package in.jtechies

class Comments {
Long id
Post post
String comment
Date dateCreated,lastUpdated
    static constraints = {
    }
    static mapping={
        id generator: 'sequence',params: [sequence:'comments_seq']
        comment sqlType: 'text'
    }
    static hasMany = [post:Post]
    static belongsTo =Post
}
