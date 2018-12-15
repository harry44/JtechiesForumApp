<%@ page import="in.jtechies.blog.BlogPosts" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'blogPosts.label', default: 'BlogPosts')}" />
		<title><g:message code="default.edit.label" args="[entityName]" /></title>
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
		%{--<g:set var="editorToolbar" value="${toolbar_Mytoolbar}" scope="session"></g:set>--}%
		%{--<tinyMce:resources />--}%
		<tinyMce:importJs init="false"/>
		<script>
		tinymce.init({
			selector: "textarea",
			plugins: "a11ychecker, advcode, linkchecker, media mediaembed, powerpaste, tinycomments, tinydrive, tinymcespellchecker",

			'toolbar': 'undo redo | styleselect | bold italic alignleft | aligncenter alignright alignjustify | outdent indent'


		});
	</script>
	</head>
	<body>
<tinyMce:renderEditor type="simple"/>
<tinyMce:renderEditor type="advanced" style="width:100%"/>
		<a href="#edit-blogPosts" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="edit-blogPosts" class="content scaffold-edit" role="main">
			<h1><g:message code="default.edit.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<g:hasErrors bean="${blogPostsInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${blogPostsInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			<g:form url="[resource:blogPostsInstance, action:'update']" method="PUT" >
				<g:hiddenField name="version" value="${blogPostsInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>

				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
