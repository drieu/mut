package fr.dr.model

class User {

    String login

    String password

    static constraints = {
    }

    String toString(){ return "${login}"}
}
