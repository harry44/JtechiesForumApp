package in.jtechies

class Notifications {
    Integer id
    Post post
    Date dateCreated,lastUpdated
    boolean status

    static constraints = {

    }
    static mapping={
        id generator: 'sequence',params: [sequence:'notifications_seq']
    }
}
