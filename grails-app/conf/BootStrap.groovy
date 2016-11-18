import org.apache.shiro.crypto.hash.Sha256Hash
import org.hibernate.engine.spi.BatchFetchQueue;
import org.hibernate.engine.spi.EntityKey

class BootStrap {

    def init = { servletContext ->
		def user = new ShiroUser(
			username: "dturk3", 
			passwordHash: new Sha256Hash("fred").toHex(),
			email: "dennis.turko@gmail.com",
			gender: "M",
			displayName: "Dennis T",
			name: "Dennis T",
			city: "Toronto" 
		)
		user.addToPermissions("*:*")
		user.save()
		
		def oldRemoveBatchLoadableEntityKey = BatchFetchQueue.metaClass.&removeBatchLoadableEntityKey
		BatchFetchQueue.metaClass.removeBatchLoadableEntityKey = { EntityKey key ->
			return key ? oldRemoveBatchLoadableEntityKey.invoke(key) : null
		}
    }
    def destroy = {
    }
}
