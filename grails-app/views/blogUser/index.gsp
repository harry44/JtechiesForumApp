
<%@ page import="in.jtechies.blog.BlogUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogUser.label', default: 'BlogUser')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-blogUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blogUser" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="userLogin" title="${message(code: 'blogUser.userLogin.label', default: 'User Login')}" />
					
						<g:sortableColumn property="userNicename" title="${message(code: 'blogUser.userNicename.label', default: 'User Nicename')}" />
					
						<g:sortableColumn property="displayName" title="${message(code: 'blogUser.displayName.label', default: 'Display Name')}" />
					
						<g:sortableColumn property="userEmail" title="${message(code: 'blogUser.userEmail.label', default: 'User Email')}" />
					
						<g:sortableColumn property="userPass" title="${message(code: 'blogUser.userPass.label', default: 'User Pass')}" />
					
						<g:sortableColumn property="userRegistered" title="${message(code: 'blogUser.userRegistered.label', default: 'User Registered')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blogUserInstanceList}" status="i" var="blogUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${blogUserInstance.id}">${fieldValue(bean: blogUserInstance, field: "userLogin")}</g:link></td>
					
						<td>${fieldValue(bean: blogUserInstance, field: "userNicename")}</td>
					
						<td>${fieldValue(bean: blogUserInstance, field: "displayName")}</td>
					
						<td>${fieldValue(bean: blogUserInstance, field: "userEmail")}</td>
					
						<td>${fieldValue(bean: blogUserInstance, field: "userPass")}</td>
					
						<td><g:formatDate date="${blogUserInstance.userRegistered}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${blogUserInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
