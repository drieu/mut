import fr.dr.SecRole
import fr.dr.SecUser
import fr.dr.SecUserSecRole

class BootStrap {

    def init = { servletContext ->
        def userRole = SecRole.findByAuthority('ROLE_USER') ?: new SecRole(authority: 'ROLE_USER').save(failOnError: true)
        def adminRole = SecRole.findByAuthority('ROLE_ADMIN') ?: new SecRole(authority: 'ROLE_ADMIN').save(failOnError: true)

        def adminUser = SecUser.findByUsername('admin') ?: new SecUser(
                username: 'admin',
                password: 'admin',
                enabled: true).save(failOnError: true)

        def basicUser = SecUser.findByUsername('guest') ?: new SecUser(
                username: 'guest',
                password: 'guest',                          //pw encoded by security plugin
                enabled: true).save(failOnError: true)

        if (!adminUser.authorities.contains(adminRole)) {
            SecUserSecRole.create adminUser, adminRole
        }
        if (!basicUser.authorities.contains(userRole)) {
            SecUserSecRole.create basicUser, userRole
        }
    }
    def destroy = {
    }
}
