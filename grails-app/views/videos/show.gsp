
<%@ page import="in.jtechies.Videos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'videos.label', default: 'Videos')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-videos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-videos" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list videos">
			
				<g:if test="${videosInstance?.title}">
				<li class="fieldcontain">
					<span id="title-label" class="property-label"><g:message code="videos.title.label" default="Title" /></span>
					
						<span class="property-value" aria-labelledby="title-label"><g:fieldValue bean="${videosInstance}" field="title"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${videosInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="videos.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:fieldValue bean="${videosInstance}" field="description"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${videosInstance?.comments}">
				<li class="fieldcontain">
					<span id="comments-label" class="property-label"><g:message code="videos.comments.label" default="Comments" /></span>
					
						<g:each in="${videosInstance.comments}" var="c">
						<span class="property-value" aria-labelledby="comments-label"><g:link controller="comments" action="show" id="${c.id}">${c?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${videosInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="videos.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${videosInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${videosInstance?.lastUpdated}">
				<li class="fieldcontain">
					<span id="lastUpdated-label" class="property-label"><g:message code="videos.lastUpdated.label" default="Last Updated" /></span>
					
						<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${videosInstance?.lastUpdated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${videosInstance?.tags}">
				<li class="fieldcontain">
					<span id="tags-label" class="property-label"><g:message code="videos.tags.label" default="Tags" /></span>
					
						<g:each in="${videosInstance.tags}" var="t">
						<span class="property-value" aria-labelledby="tags-label"><g:link controller="tags" action="show" id="${t.id}">${t?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${videosInstance?.videoFile}">
				<li class="fieldcontain">
					<span id="videoFile-label" class="property-label"><g:message code="videos.videoFile.label" default="Video File" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${videosInstance?.videoPoster}">
				<li class="fieldcontain">
					<span id="videoPoster-label" class="property-label"><g:message code="videos.videoPoster.label" default="Video Poster" /></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:videosInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${videosInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
