<%@ page import="in.jtechies.Category" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'category.label', default: 'Category')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-category" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-category" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list category">

        <g:if test="${categoryInstance?.categoryName}">
            <li class="fieldcontain">
                <span id="categoryName-label" class="property-label"><g:message code="category.categoryName.label"
                                                                                default="Category Name"/></span>

                <span class="property-value" aria-labelledby="categoryName-label"><g:fieldValue
                        bean="${categoryInstance}" field="categoryName"/></span>

            </li>
        </g:if>

        <g:if test="${categoryInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="category.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${categoryInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${categoryInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="category.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${categoryInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: categoryInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${categoryInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
