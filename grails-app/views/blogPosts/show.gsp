
<%@ page import="in.jtechies.blog.BlogPosts" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogPosts.label', default: 'BlogPosts')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
		<style>
		h2 strong {
			display: block;
			font-size: 18px;
			margin-top: 0.67em;
			margin-bottom: 0.67em;
			margin-left: 0;
			margin-right: 0;

		}
		h1 {
			display: block;
			font-size: 10px;
			margin-top: 0.67em;
			margin-bottom: 0.67em;
			margin-left: 0;
			margin-right: 0;

		}
		</style>
		<link rel="stylesheet"
			  href="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/styles/default.min.css">
		<script src="//cdnjs.cloudflare.com/ajax/libs/highlight.js/9.13.1/highlight.min.js"></script>

	</head>
	<body>
	<script>hljs.initHighlightingOnLoad();</script>
		%{--<a href="#show-blogPosts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
	<nav class="navbar navbar-expand-sm bg-light">
		<ul class="navbar-nav">
				<li class="nav-item"><a  class="nav-link" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li class="nav-item"><g:link class="list" class="nav-link" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li class="nav-item"><g:link class="create" class="nav-link" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
	</nav>
	<div class="row">
	<div class="col-2">

		<g:if test="${blogPostsInstance?.postAuthor}">

				<span id="postAuthor-label" class=""><g:message code="blogPosts.postAuthor.label" default="Post Author" /></span>

				<span class="property-value" aria-labelledby="postAuthor-label"><g:fieldValue bean="${blogPostsInstance}" field="postAuthor"/></span>


		</g:if>

		<g:if test="${blogPostsInstance?.postModified}">

				<span id="postModified-label" class="property-label"><g:message code="blogPosts.postModified.label" default="Post Modified" /></span>

				<span class="property-value" aria-labelledby="postModified-label"><g:formatDate date="${blogPostsInstance?.postModified}" /></span>


		</g:if>

		<g:if test="${blogPostsInstance?.postDate}">

				<span id="postDate-label" class="property-label"><g:message code="blogPosts.postDate.label" default="Post Date" /></span>

				<span class="property-value" aria-labelledby="postDate-label"><g:formatDate date="${blogPostsInstance?.postDate}" /></span>


		</g:if>


	</div>
		<div  class="col-8" role="main">
			<br>
			<h3><g:if test="${blogPostsInstance?.postTitle}">

					%{--<span id="postTitle-label" class="property-label"><g:message code="blogPosts.postTitle.label" default="Post Title" /></span>--}%

					<span class="property-value" aria-labelledby="postTitle-label"><g:fieldValue bean="${blogPostsInstance}" field="postTitle"/></span>


			</g:if></h3>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>

			

			
				<g:if test="${blogPostsInstance?.postContent}">

					%{--<span id="postContent-label" class="property-label"><g:message code="blogPosts.postContent.label" default="Post Content" /></span>--}%
					
						<span class="property-value" aria-labelledby="postContent-label">${blogPostsInstance?.postContent.encodeAsRaw()}</span>
					

				</g:if>
			

			
				<g:if test="${blogPostsInstance?.postStatus}">

					<span id="postStatus-label" class="property-label"><g:message code="blogPosts.postStatus.label" default="Post Status" /></span>
					
						<span class="property-value" aria-labelledby="postStatus-label"><g:fieldValue bean="${blogPostsInstance}" field="postStatus"/></span>
					

				</g:if>
			
				<g:if test="${blogPostsInstance?.postName}">

					<span id="postName-label" class="property-label"><g:message code="blogPosts.postName.label" default="Post Name" /></span>
					
						<span class="property-value" aria-labelledby="postName-label"><g:fieldValue bean="${blogPostsInstance}" field="postName"/></span>
					

				</g:if>
			
				<g:if test="${blogPostsInstance?.postType}">

					<span id="postType-label" class="property-label"><g:message code="blogPosts.postType.label" default="Post Type" /></span>
					
						<span class="property-value" aria-labelledby="postType-label"><g:fieldValue bean="${blogPostsInstance}" field="postType"/></span>
					

				</g:if>
			
<br><br>
			<g:form url="[resource:blogPostsInstance, action:'delete']" method="DELETE">
				<center>
					<g:link class="edit btn btn-success" action="edit" resource="${blogPostsInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete btn btn-danger" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</center>
			</g:form>
		</div>
	</div>
	</body>
</html>
