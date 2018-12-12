
<%@ page import="in.jtechies.Tags" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'tags.label', default: 'Tags')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-tags" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-tags" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="example" class=" display compact" style="width:100%">
			<thead>
					<tr>
					
						<g:sortableColumn property="tagName" title="${message(code: 'tags.tagName.label', default: 'Tag Name')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tagsInstanceList}" status="i" var="tagsInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tagsInstance.id}">${fieldValue(bean: tagsInstance, field: "tagName")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tagsInstanceCount ?: 0}" />
			</div>
		</div>
	<script>
		$(document).ready(function() {
			$('#example').DataTable();
		} );
	</script>
	</body>
</html>
