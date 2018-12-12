
<%@ page import="in.jtechies.Tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tags.label', default: 'Tags')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-tags" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-tags" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list tags">
			
				<g:if test="${tagsInstance?.post}">
				<li class="fieldcontain">
					<span id="post-label" class="property-label"><g:message code="tags.post.label" default="Post" /></span>
					
						<g:each in="${tagsInstance.post}" var="p">
						<span class="property-value" aria-labelledby="post-label"><g:link controller="post" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${tagsInstance?.tagName}">
				<li class="fieldcontain">
					<span id="tagName-label" class="property-label"><g:message code="tags.tagName.label" default="Tag Name" /></span>
					
						<span class="property-value" aria-labelledby="tagName-label"><g:fieldValue bean="${tagsInstance}" field="tagName"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:tagsInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${tagsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
