<%@ page import="in.jtechies.Comments" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'comments.label', default: 'Comments')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-comments" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                               default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-comments" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list comments">

        <g:if test="${commentsInstance?.comment}">
            <li class="fieldcontain">
                <span id="comment-label" class="property-label"><g:message code="comments.comment.label"
                                                                           default="Comment"/></span>

                <span class="property-value" aria-labelledby="comment-label"><g:fieldValue bean="${commentsInstance}"
                                                                                           field="comment"/></span>

            </li>
        </g:if>

        <g:if test="${commentsInstance?.dateCreated}">
            <li class="fieldcontain">
                <span id="dateCreated-label" class="property-label"><g:message code="comments.dateCreated.label"
                                                                               default="Date Created"/></span>

                <span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate
                        date="${commentsInstance?.dateCreated}"/></span>

            </li>
        </g:if>

        <g:if test="${commentsInstance?.lastUpdated}">
            <li class="fieldcontain">
                <span id="lastUpdated-label" class="property-label"><g:message code="comments.lastUpdated.label"
                                                                               default="Last Updated"/></span>

                <span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate
                        date="${commentsInstance?.lastUpdated}"/></span>

            </li>
        </g:if>

        <g:if test="${commentsInstance?.post}">
            <li class="fieldcontain">
                <span id="post-label" class="property-label"><g:message code="comments.post.label"
                                                                        default="Post"/></span>

                <span class="property-value" aria-labelledby="post-label"><g:link controller="post" action="show"
                                                                                  id="${commentsInstance?.post?.id}">${commentsInstance?.post?.encodeAsHTML()}</g:link></span>

            </li>
        </g:if>

    </ol>
    <g:form url="[resource: commentsInstance, action: 'delete']" method="DELETE">
        <fieldset class="buttons">
            <g:link class="edit" action="edit" resource="${commentsInstance}"><g:message
                    code="default.button.edit.label" default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
