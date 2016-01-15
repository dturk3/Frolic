
<%@ page import="frolic.Place"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'place.label', default: 'Place')}" />
<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>
<body>
	<a href="#show-place" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">
					<g:message code="default.list.label" args="[entityName]" />
				</g:link></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="show-place" class="content scaffold-show" role="main">
		<h1>
			<g:message code="default.show.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<ol class="property-list place">
			<g:if test="${placeInstance?.name}">
				<li class="fieldcontain"><span id="name-label"
					class="property-label"><g:message code="place.name.label"
							default="Name" /></span> <span class="property-value"
					aria-labelledby="name-label"><g:fieldValue
							bean="${placeInstance}" field="name" /></span></li>
			</g:if>
			
			<g:if test="${placeInstance?.imageUrl}">
                <li class="fieldcontain"><span id="address-label"
                    class="property-label"></span> <span class="property-value"
                    aria-labelledby="address-label"><img src="${ placeInstance.imageUrl }"></span></li>
            </g:if>
			

			<g:if test="${placeInstance?.address}">
				<li class="fieldcontain"><span id="address-label"
					class="property-label"><g:message code="place.address.label"
							default="Address" /></span> <span class="property-value"
					aria-labelledby="address-label"><g:fieldValue
							bean="${placeInstance}" field="address" /></span></li>
			</g:if>
			
            <g:if test="${placeInstance?.upvotes}">
                <li class="fieldcontain"><span id="upvotes-label"
                    class="property-label"><g:message code="place.upvotes.label"
                            default="Upvotes" /></span> <span class="property-value"
                    aria-labelledby="upvotes-label"><g:fieldValue
                            bean="${placeInstance}" field="upvotes" /></span></li>
            </g:if>

			<g:if test="${placeInstance?.downvotes}">
				<li class="fieldcontain"><span id="downvotes-label"
					class="property-label"><g:message
							code="place.downvotes.label" default="Downvotes" /></span> <span
					class="property-value" aria-labelledby="downvotes-label"><g:fieldValue
							bean="${placeInstance}" field="downvotes" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.frolics}">
				<li class="fieldcontain"><span id="frolics-label"
					class="property-label"><g:message code="place.frolics.label"
							default="Frolics" /></span> <span class="property-value"
					aria-labelledby="frolics-label"><g:fieldValue
							bean="${placeInstance}" field="frolics" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.hits}">
				<li class="fieldcontain"><span id="hits-label"
					class="property-label"><g:message code="place.hits.label"
							default="Hits" /></span> <span class="property-value"
					aria-labelledby="hits-label"><g:fieldValue
							bean="${placeInstance}" field="hits" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.lon}">
				<li class="fieldcontain"><span id="lon-label"
					class="property-label"><g:message code="place.lon.label"
							default="Lon" /></span> <span class="property-value"
					aria-labelledby="lon-label"><g:fieldValue
							bean="${placeInstance}" field="lon" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.lat}">
				<li class="fieldcontain"><span id="lat-label"
					class="property-label"><g:message code="place.lat.label"
							default="Lat" /></span> <span class="property-value"
					aria-labelledby="lat-label"><g:fieldValue
							bean="${placeInstance}" field="lat" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.link}">
				<li class="fieldcontain"><span id="link-label"
					class="property-label"><g:message code="place.link.label"
							default="Link" /></span> <span class="property-value"
					aria-labelledby="link-label"><g:fieldValue
							bean="${placeInstance}" field="link" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.phone}">
				<li class="fieldcontain"><span id="phone-label"
					class="property-label"><g:message code="place.phone.label"
							default="Phone" /></span> <span class="property-value"
					aria-labelledby="phone-label"><g:fieldValue
							bean="${placeInstance}" field="phone" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.popularity}">
				<li class="fieldcontain"><span id="popularity-label"
					class="property-label"><g:message
							code="place.popularity.label" default="Popularity" /></span> <span
					class="property-value" aria-labelledby="popularity-label"><g:fieldValue
							bean="${placeInstance}" field="popularity" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.rating}">
				<li class="fieldcontain"><span id="rating-label"
					class="property-label"><g:message code="place.rating.label"
							default="Rating" /></span> <span class="property-value"
					aria-labelledby="rating-label"><g:fieldValue
							bean="${placeInstance}" field="rating" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.summary}">
				<li class="fieldcontain"><span id="summary-label"
					class="property-label"><g:message code="place.summary.label"
							default="Summary" /></span> <span class="property-value"
					aria-labelledby="summary-label"><g:fieldValue
							bean="${placeInstance}" field="summary" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.tags}">
				<li class="fieldcontain"><span id="tags-label"
					class="property-label"><g:message code="place.tags.label"
							default="Tags" /></span> <span class="property-value"
					aria-labelledby="tags-label"><g:fieldValue
							bean="${placeInstance}" field="tags" /></span></li>
			</g:if>

			<g:if test="${placeInstance?.yelpId}">
				<li class="fieldcontain"><span id="yelpId-label"
					class="property-label"><g:message code="place.yelpId.label"
							default="Yelp Id" /></span> <span class="property-value"
					aria-labelledby="yelpId-label"><g:fieldValue
							bean="${placeInstance}" field="yelpId" /></span></li>
			</g:if>

		</ol>
		<g:form url="[resource:placeInstance, action:'delete']"
			method="DELETE">
			<fieldset class="buttons">
				<g:link class="edit" action="edit" resource="${placeInstance}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:link>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
