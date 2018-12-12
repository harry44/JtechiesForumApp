package in.jtechies

class Videos {
    Long id
    String title
    String description
    byte[] videoPoster
    byte[] videoFile
    Date dateCreated,lastUpdated
    static hasMany=[tags:Tags,comments:Comments]
    static constraints = {
        title nullable:true
        description nullable:true
    }
    static mapping={
        id generator: 'sequence', params: ['sequence':'videos_seq']
        description sqlType: 'text'
    }
}
