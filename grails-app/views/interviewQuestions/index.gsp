
<%@ page import="in.jtechies.InterviewQuestions" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'interviewQuestions.label', default: 'InterviewQuestions')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-interviewQuestions" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		%{--<div id="list-interviewQuestions" class="content scaffold-list" role="main">--}%
			<h3><g:message code="default.list.label" args="[entityName]" /></h3>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			%{--<table>--}%
			%{--<thead>--}%
					%{--<tr>--}%
					%{----}%
						%{--<g:sortableColumn property="question" title="${message(code: 'interviewQuestions.question.label', default: 'Question')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="answer" title="${message(code: 'interviewQuestions.answer.label', default: 'Answer')}" />--}%
					%{----}%
						%{--<th><g:message code="interviewQuestions.category.label" default="Category" /></th>--}%
					%{----}%
						%{--<g:sortableColumn property="dateCreated" title="${message(code: 'interviewQuestions.dateCreated.label', default: 'Date Created')}" />--}%
					%{----}%
						%{--<g:sortableColumn property="lastUpdated" title="${message(code: 'interviewQuestions.lastUpdated.label', default: 'Last Updated')}" />--}%
					%{----}%
					%{--</tr>--}%
				%{--</thead>--}%
				%{--<tbody>--}%
				%{--<g:each in="${interviewQuestionsInstanceList}" status="i" var="interviewQuestionsInstance">--}%
					%{--<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">--}%
					%{----}%
						%{--<td><g:link action="show" id="${interviewQuestionsInstance.id}">${fieldValue(bean: interviewQuestionsInstance, field: "question")}</g:link></td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: interviewQuestionsInstance, field: "answer")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: interviewQuestionsInstance, field: "category")}</td>--}%
					%{----}%
						%{--<td></td>--}%
					%{----}%
						%{--<td><g:formatDate date="${interviewQuestionsInstance.lastUpdated}" /></td>--}%
					%{----}%
					%{--</tr>--}%
				%{--</g:each>--}%
				%{--</tbody>--}%
			%{--</table>--}%
			%{--<div class="pagination">--}%
				%{--<g:paginate total="${interviewQuestionsInstanceCount ?: 0}" />--}%
			%{--</div>--}%
		%{--</div>--}%
<div class="row">
	<div class="col-3">test&nbsp;</div>
	<div class="col-6">
<g:each in="${interviewQuestionsInstanceList}" status="i" var="interviewQuestionsInstance">
	<div class="shadow-sm p-4 mb-4 bg-white">
		<h4><a href="${createLink(controller: 'interviewQuestions', action: 'show',id:interviewQuestionsInstance?.id)}">${interviewQuestionsInstance?.question}</a></h4>
		%{--<p>${interviewQuestionsInstance?.answer?.encodeAsRaw()}</p>--}%
		<span class="badge badge-info">Date:<g:formatDate date="${interviewQuestionsInstance.dateCreated}" format="dd/MM/yyyy" /></span>&nbsp;<span ><a href="${createLink(controller: 'interviewQuestions', action: 'edit',id:interviewQuestionsInstance?.id)}"><i class="far fa-edit"></i></a></span>
	</div>
</g:each>
	</div>
	<div class="col-3">test&nbsp;</div>
</div>
	</body>
	</body>
</html>
