
<%@ page import="in.jtechies.blog.BlogPosts" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogPosts.label', default: 'BlogPosts')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>

	</head>

	<body>
		<a href="#list-blogPosts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-blogPosts" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="example" class="table table-sm table-striped" style="width:100%">
				<thead class="thead-light">
					<tr>
					
						<g:sortableColumn property="id" title="${message(code: 'blogPosts.postAuthor.label', default: 'Post id')}" />
					%{--<td>Author</td>--}%

					
						%{--<g:sortableColumn property="postContent" title="${message(code: 'blogPosts.postContent.label', default: 'Post Content')}" />--}%
					
						<g:sortableColumn property="postTitle" title="${message(code: 'blogPosts.postTitle.label', default: 'Post Title')}" />
						<g:sortableColumn property="postModified" title="${message(code: 'blogPosts.postModified.label', default: 'Post Modified')}" />

						<g:sortableColumn property="postDate" title="${message(code: 'blogPosts.postDate.label', default: 'Post Date')}" />
					
						%{--<g:sortableColumn property="postStatus" title="${message(code: 'blogPosts.postStatus.label', default: 'Post Status')}" />--}%
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${blogPostsInstanceList}" status="i" var="blogPostsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${blogPostsInstance.id}">${blogPostsInstance.id}</g:link></td>
						%{--<td>${fieldValue(bean: blogPostsInstance, field: "postAuthor")}</td>--}%
					

					
						%{--<td style="max-width:500px;overflow:scroll;">${blogPostsInstance.postContent.encodeAsRaw()}</td>--}%
					
						<td>${fieldValue(bean: blogPostsInstance, field: "postTitle")}
					<br>
						<span class="badge badge-info">edit</span> &nbsp;&nbsp;<span class="badge badge-danger">delete</span> &nbsp;&nbsp;<g:link action="show" id="${blogPostsInstance.id}" target="_newTab"><span class="badge badge-success">View</span></g:link>
					</td>
						<td>
							%{--<g:formatDate date="${blogPostsInstance.postModified}" />--}%
							${blogPostsInstance.postModified.format("dd/MM/yyyy hh:mm")}
						</td>

						<td>
							%{--<g:formatDate date="${blogPostsInstance.postDate}" />--}%
						${blogPostsInstance.postDate.format("dd/MM/yyyy")}
						</td>
					
						%{--<td>${fieldValue(bean: blogPostsInstance, field: "postStatus")}</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<script>
				$(document).ready(function() {
					$('#example').DataTable({ "order": [[ 0, "desc" ]] });
				} );
			</script>
		</div>
	</body>
</html>
