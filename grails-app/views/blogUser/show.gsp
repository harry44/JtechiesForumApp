
<%@ page import="in.jtechies.blog.BlogUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogUser.label', default: 'BlogUser')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-blogUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-blogUser" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list blogUser">
			
				<g:if test="${blogUserInstance?.userLogin}">
				<li class="fieldcontain">
					<span id="userLogin-label" class="property-label"><g:message code="blogUser.userLogin.label" default="User Login" /></span>
					
						<span class="property-value" aria-labelledby="userLogin-label"><g:fieldValue bean="${blogUserInstance}" field="userLogin"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogUserInstance?.userNicename}">
				<li class="fieldcontain">
					<span id="userNicename-label" class="property-label"><g:message code="blogUser.userNicename.label" default="User Nicename" /></span>
					
						<span class="property-value" aria-labelledby="userNicename-label"><g:fieldValue bean="${blogUserInstance}" field="userNicename"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogUserInstance?.displayName}">
				<li class="fieldcontain">
					<span id="displayName-label" class="property-label"><g:message code="blogUser.displayName.label" default="Display Name" /></span>
					
						<span class="property-value" aria-labelledby="displayName-label"><g:fieldValue bean="${blogUserInstance}" field="displayName"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogUserInstance?.userEmail}">
				<li class="fieldcontain">
					<span id="userEmail-label" class="property-label"><g:message code="blogUser.userEmail.label" default="User Email" /></span>
					
						<span class="property-value" aria-labelledby="userEmail-label"><g:fieldValue bean="${blogUserInstance}" field="userEmail"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogUserInstance?.userPass}">
				<li class="fieldcontain">
					<span id="userPass-label" class="property-label"><g:message code="blogUser.userPass.label" default="User Pass" /></span>
					
						<span class="property-value" aria-labelledby="userPass-label"><g:fieldValue bean="${blogUserInstance}" field="userPass"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${blogUserInstance?.userRegistered}">
				<li class="fieldcontain">
					<span id="userRegistered-label" class="property-label"><g:message code="blogUser.userRegistered.label" default="User Registered" /></span>
					
						<span class="property-value" aria-labelledby="userRegistered-label"><g:formatDate date="${blogUserInstance?.userRegistered}" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:blogUserInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${blogUserInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
