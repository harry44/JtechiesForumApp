<%@ page import="in.jtechies.InterviewQuestions" %>

<head>
	<ckeditor:resources/>
	<ckeditor:config var="toolbar_Mytoolbar">
		[
   ['Styles','Format','Font','FontSize'],
   '/',
   ['Bold','Italic','Underline','StrikeThrough','-','Undo','Redo','-','Cut','Copy','Paste','Find','Replace','-','Outdent','Indent','-','Print'],
   '/',
   ['NumberedList','BulletedList','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
   ['Image','Table','-','Link','Flash','Smiley','TextColor','BGColor','Source']
]
	</ckeditor:config>
</head>

<div class="form-group row ${hasErrors(bean: interviewQuestionsInstance, field: 'question', 'error')} required">
	<label for="question" class="col-3">
		<g:message code="interviewQuestions.question.label" default="Question" />
		<span class="required-indicator">*</span>
	</label>
	<div class="col-6">
	<g:textField name="question" required="" value="${interviewQuestionsInstance?.question}" class="form-control"/>
	</div>
</div>

<div class="form-group row ${hasErrors(bean: interviewQuestionsInstance, field: 'answer', 'error')} required">
	<label for="answer" class="col-3">
		<g:message code="interviewQuestions.answer.label" default="Answer" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-6">
	%{--<g:textField name="answer" required="" value="${interviewQuestionsInstance?.answer}" class="form-control"/>--}%
	<ckeditor:editor name="answer"  width="100%" toolbar="Mytoolbar" height="200px;">
		${interviewQuestionsInstance?.answer}
	</ckeditor:editor>
</div>
</div>

<div class="form-group row ${hasErrors(bean: interviewQuestionsInstance, field: 'category', 'error')} required">
	<label for="category" class="col-3 ">
		<g:message code="interviewQuestions.category.label" default="Category" />
		<span class="required-indicator">*</span>
	</label>
<div class="col-6">
	<g:select id="category" name="category.id" from="${in.jtechies.Category.list()}" optionKey="id" optionValue="categoryName" required="" value="${interviewQuestionsInstance?.category?.id}" class="many-to-one form-control"/>
</div>
</div>

%{--<div class="fieldcontain ${hasErrors(bean: interviewQuestionsInstance, field: 'comments', 'error')} ">--}%
	%{--<label for="comments">--}%
		%{--<g:message code="interviewQuestions.comments.label" default="Comments" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:select name="comments" from="${in.jtechies.Comments.list()}" multiple="multiple" optionKey="id" size="5" value="${interviewQuestionsInstance?.comments*.id}" class="many-to-many"/>--}%

%{--</div>--}%

<div class="form-group row ${hasErrors(bean: interviewQuestionsInstance, field: 'tags', 'error')} ">
	<label for="tags" class="col-3">
		<g:message code="interviewQuestions.tags.label" default="Tags" />
		
	</label>
<div class="col-6">
	<g:select name="tags" from="${in.jtechies.Tags.list()}" multiple="multiple" optionKey="id" size="5" value="${interviewQuestionsInstance?.tags*.id}" optionValue="tagName"  class="many-to-many form-control"/>
</div>
</div>

