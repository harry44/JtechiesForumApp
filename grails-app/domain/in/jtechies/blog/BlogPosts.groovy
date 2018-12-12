package in.jtechies.blog

class BlogPosts {
Long id
    Long postAuthor
    Date postDate,postModified
    String postContent
    String postTitle,postStatus,postName,postType

    static constraints = {
        postAuthor nullable: true
        postModified nullable: true
        postDate nullable: true
        postContent nullable:true
        postTitle nullable:true
        postStatus nullable:true
        postStatus nullable: true
        postName nullable: true
        postType nullable: true
    }
    static mapping={
        version false
        datasource("db2")
        id generator: 'increment'
        table name: 'blogposts'
        postContent sqlType: 'longtext'
        id column:'ID'
        postTitle sqlType: 'text'
    }
}
