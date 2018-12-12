package in.jtechies

class Post {
  long id
  String postTitle
  Category category
  String postContent
  Date dateCreated,lastUpdated
    static constraints = {
		//comments nullable:true
		postContent nullable:true

    }
    static mapping={
      id generator: 'sequence',params: [sequence:'post_seq']
        postContent sqlType: 'text'
        //comments sqlType: 'text'
    }

    static hasMany = [tags:Tags,comments:Comments]
}
