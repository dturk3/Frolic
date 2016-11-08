import java.nio.file.attribute.UserDefinedFileAttributeView;

import org.apache.shiro.SecurityUtils
import org.apache.shiro.authc.AuthenticationException
import org.apache.shiro.authc.UsernamePasswordToken
import org.apache.shiro.crypto.hash.Sha256Hash
import org.apache.shiro.web.util.SavedRequest
import org.apache.shiro.web.util.WebUtils

class AuthController {
    def shiroSecurityManager

    def index = { redirect(uri: "/entry/geolocate") }

    def login = {
		// Slight hack to get around issue of anchors not being preserved in security redirects
		redirect(uri: "/entry/geolocate?targetUri=" + URLEncoder.encode(params.targetUri) + "#signin")
    }

    def signIn = {
        def authToken = new UsernamePasswordToken(params.username, params.password as String)

        // Support for "remember me"
        if (params.rememberMe) {
            authToken.rememberMe = true
        }
        
        // If a controller redirected to this page, redirect back
        // to it. Otherwise redirect to the root URI.
        def targetUri = params.targetUri ?: "/"
        
        // Handle requests saved by Shiro filters.
        SavedRequest savedRequest = WebUtils.getSavedRequest(request)
        if (savedRequest) {
            targetUri = savedRequest.requestURI - request.contextPath
            if (savedRequest.queryString) targetUri = targetUri + '?' + savedRequest.queryString
        }
        
        try{
            // Perform the actual login. An AuthenticationException
            // will be thrown if the username is unrecognised or the
            // password is incorrect.
            SecurityUtils.subject.login(authToken)

            log.info "Redirecting to '${targetUri}'."
            redirect(uri: targetUri)
        }
        catch (AuthenticationException ex){
            // Authentication failed, so display the appropriate message
            // on the login page.
            log.info "Authentication failure for user '${params.username}'."
            flash.message = message(code: "login.failed")

            // Keep the username and "remember me" setting so that the
            // user doesn't have to enter them again.
            def m = [ username: params.username ]
            if (params.rememberMe) {
                m["rememberMe"] = true
            }

            // Remember the target URI too.
            if (params.targetUri) {
                m["targetUri"] = params.targetUri
            }

            // Now redirect back to the login page.
            redirect(uri: "/entry/geolocate?targetUri=" + URLEncoder.encode(params.targetUri) + "#signin")
        }
    }

    def signOut = {
        // Log the user out of the application.
        SecurityUtils.subject?.logout()
        webRequest.getCurrentRequest().session = null

        // For now, redirect back to the home page.
        redirect(uri: "/")
    }
	
	void validateJoin(userParams) {
		def nameRegex = /[a-zA-z]+([ '-][a-zA-Z]+)*/
		def emailRegex = /[_A-Za-z0-9-]+(.[_A-Za-z0-9-]+)*@[A-Za-z0-9]+(.[A-Za-z0-9]+)*(.[A-Za-z]{2,})/
		
		if (userParams.username) {
			userParams.username = userParams.username.toLowerCase()
		}
		if (userParams.email) {
			userParams.email = userParams.email.toLowerCase()
		}
		
		if (!userParams.username || userParams.username.length() < 4 || userParams.username.length() > 256) {
			flash.message = message(code: "invalid.username")
			return
		}
		if (!userParams.displayName || !userParams.displayName.matches(nameRegex) || userParams.displayName.length() > 256) {
			flash.message = message(code: "invalid.name")
			return
		}
		if (!userParams.email || !userParams.email.matches(emailRegex) || userParams.email.length() > 256) {
			flash.message = message(code: "invalid.email")
			return
		}
		if (!userParams.city || userParams.city.length() > 256) {
			flash.message = message(code: "invalid.city")
			return
		}
		if (!userParams.password || (userParams.password.length() < 8) || userParams.password.length() > 256) {
			flash.message = message(code: "invalid.password")
			return
		}
		if (userParams.password != userParams.confirmPassword) {
			flash.message = message(code: "invalid.confirmation")
			return
		}
		
		def exists = ShiroUser.findByUsername(userParams.username)
		if (exists) {
			flash.message = message(code: "invalid.user.exists")
			return
		}
		exists = ShiroUser.findByEmail(userParams.email)
		if (exists) {
			flash.message = message(code: "invalid.user.exists")
			return
		}
	}
	
	def join = {
		validateJoin(params)
		
		if (flash.message) {
			for (param in params.keySet()) {
				def value = params[param]
				if (!value) {
					params[param] = ''
				}
			}
			params.password = ''
			params.confirmPassword = ''
			// TODO - dirty
			redirect(uri: "/entry/join\\?" + (params.collect { k,v -> "$k=${URLEncoder.encode(v)}" }.join('&') + "#join-top"))
			return
		}
				
		def user = new ShiroUser(
			username: params.username,
			passwordHash: new Sha256Hash(params.password).toHex(),
			email: params.email,
			gender: params.gender,
			displayName: params.displayName,
			name: params.displayName,
			city: params.city
		)
		user.addToPermissions("*:*")
		user.save()
		
		redirect action: signIn, params: [username: user.username, password: params.password, targetUri: '/']
	}

    def unauthorized = {
        render "You do not have permission to access this page."
    }
}
