package in.jtechies

class Category {
Long id
String categoryName
    byte[] categoryLogo
    String description
    CategoryGroup categoryGroup
     Date dateCreated,lastUpdated

    static constraints = {
        description nullable:true
        categoryGroup nullable:true
        categoryLogo nullable:false
    }
    static mapping={
        id generator: 'sequence',params: [sequence:'category_seq']
        description sqlType: 'text'
    }
}
