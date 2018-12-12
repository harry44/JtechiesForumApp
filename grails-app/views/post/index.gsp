<%@ page import="in.jtechies.Post" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-post" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>
            <g:sortableColumn property="postTitle"
                              title="${message(code: 'post.postTitle.label', default: 'Post Title')}"/>



            <th><g:message code="post.category.label" default="Category"/></th>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'post.dateCreated.label', default: 'Date Created')}"/>

            <g:sortableColumn property="lastUpdated"
                              title="${message(code: 'post.lastUpdated.label', default: 'Last Updated')}"/>
            <th><g:message code="post.comments.label" default="Comments"/></th>

        </tr>
        </thead>
        <tbody>
        <g:each in="${postInstanceList}" status="i" var="postInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${postInstance.id}">${fieldValue(bean: postInstance, field: "postTitle")}</g:link></td>

                <td>${fieldValue(bean: postInstance, field: "category")}</td>

                <td><g:formatDate date="${postInstance.dateCreated}"/></td>

                <td><g:formatDate date="${postInstance.lastUpdated}"/></td>

                <td>\u0024{fieldValue(bean: postInstance, field: "comments")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${postInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
