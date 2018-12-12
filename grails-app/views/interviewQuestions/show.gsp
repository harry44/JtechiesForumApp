
<%@ page import="in.jtechies.InterviewQuestions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'interviewQuestions.label', default: 'InterviewQuestions')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-interviewQuestions" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-interviewQuestions" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			%{--<ol class="property-list interviewQuestions">--}%
			<div class="shadow-sm p-4 mb-4 bg-white">
				<g:if test="${interviewQuestionsInstance?.question}">
				<h3 class="fieldcontain">
					<span id="question-label" class="property-label"><g:message code="interviewQuestions.question.label" default="Question" /></span>
					
						<span class="property-value" aria-labelledby="question-label"><g:fieldValue bean="${interviewQuestionsInstance}" field="question"/></span>
					
				</h3>
				</g:if>
			
				<g:if test="${interviewQuestionsInstance?.answer}">
				<p class="fieldcontain">
					<span id="answer-label" class="property-label"><g:message code="interviewQuestions.answer.label" default="Answer" /></span>
					
						${interviewQuestionsInstance?.answer?.encodeAsRaw()}
					
				</p>
				</g:if>
			
				<g:if test="${interviewQuestionsInstance?.category}">
				<li class="badge badge-success">
					<span id="category-label" class="badge badge-success"><g:message code="interviewQuestions.category.label" default="Category" /></span>
					
						<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" style="color:white" id="${interviewQuestionsInstance?.category?.id}">${interviewQuestionsInstance?.category?.categoryName?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${interviewQuestionsInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="interviewQuestions.comments.label" default="Comments" /></span>
					
						<g:each in="${interviewQuestionsInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comments" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${interviewQuestionsInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="interviewQuestions.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${interviewQuestionsInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${interviewQuestionsInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="interviewQuestions.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${interviewQuestionsInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${interviewQuestionsInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="interviewQuestions.tags.label" default="Tags" /></span>
					
						<g:each in="${interviewQuestionsInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tags" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			</div>
			%{--</ol>--}%
			<g:form url="[resource:interviewQuestionsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${interviewQuestionsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
