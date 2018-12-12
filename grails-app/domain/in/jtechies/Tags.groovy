package in.jtechies

class Tags {
Integer id
    String tagName
    static constraints = {
    }
    static mapping={
        id generator: 'sequence',params: [sequence:'tags_seq']
    }
    static hasMany = [post:Post]
    static belongsTo = Post
}
