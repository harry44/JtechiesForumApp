<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}"/>
    <title><g:message code="default.create.label" args="[entityName]"/></title>

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

</head>

<body>
%{--<a href="#create-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
<div class="nav nav-navbar" role="navigation">
    <ul class="nav">
        <li><a class="home badge badge-info" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a>
        </li>
        <li>&nbsp;</li>
        <li><g:link class="list badge badge-info" action="index"><g:message code="default.list.label"
                                                                            args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="create-post" class="content scaffold-create" role="main">

    <div class="row">
        <div class="col-12">
            <h1><g:message code="default.create.label" args="[entityName]"/></h1>
            <hr>
            <g:if test="${flash.message}">
                <div class="message" role="status">${flash.message}</div>
            </g:if>

            <g:form class="form-horizontal" style="align:center;" url="[resource: postInstance, action: 'save']">
                <fieldset class="form">
                    <g:render template="form"/>
                </fieldset>
                <fieldset class="buttons" style="align-content: center">
                    <g:submitButton name="create" class="save btn btn-success"
                                    value="${message(code: 'default.button.create.label', default: 'Create')}"/>
                </fieldset>
            </g:form>
        </div>

    </div>

    %{--<g:hasErrors bean="${postInstance}">--}%
        %{--<ul class="errors" role="alert">--}%
            %{--<g:eachError bean="${postInstance}" var="error">--}%
                %{--<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message--}%
                        %{--error="${error}"/></li>--}%
            %{--</g:eachError>--}%
        %{--</ul>--}%
    %{--</g:hasErrors>--}%

</div>
</body>
</html>
