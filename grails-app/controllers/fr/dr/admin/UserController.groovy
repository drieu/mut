package fr.dr.admin

import fr.dr.model.User

class UserController {

    def scaffold = User

    def index = {
        def user = User.list([sort:"login", order:"asc"])

        return [user: user]
    }
}
