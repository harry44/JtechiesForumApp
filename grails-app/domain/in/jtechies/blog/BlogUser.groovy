package in.jtechies.blog

class BlogUser {
Long id
    String userLogin,userNicename,displayName,userEmail
    String userPass
    Date userRegistered
    static constraints = {
        userLogin nullable: true;
        userNicename nullable:true
        displayName nullable: true
        userEmail nullable: true
        userPass nullable: true
        userRegistered nullable:true
    }
    static mapping ={
        id column:'ID',generator: 'increment'
        version false
        datasource("db2")
        table name: 'blogusers'
    }
}
