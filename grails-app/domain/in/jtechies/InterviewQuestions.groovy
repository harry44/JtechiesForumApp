package in.jtechies

class InterviewQuestions {
     Long id
     String question
     String answer
     Category category
     Date dateCreated ,lastUpdated

    static hasMany = [tags:Tags,comments:Comments]
    static constraints = {
        question nullable:false ,unique: true
        answer nullable:false
    }
    static  mapping={
        id generator: 'sequence',params: [sequence:'interviewQuestions_seq']
        answer sqlType: 'text'
        question sqlType: 'text'
    }
}
