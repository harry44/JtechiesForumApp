package in.jtechies

class CategoryGroup {
long id
    String categoryCode
    String description
    static constraints = {
        categoryCode nullable:false
        description nullable:true
    }
    static mapping={
        id generator: 'sequence',params: [sequence:'categoryGroup_seq']
    }
}
