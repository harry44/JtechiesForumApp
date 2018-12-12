<%@ page import="in.jtechies.JtUser" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'jtUser.label', default: 'JtUser')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-jtUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                             default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-jtUser" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="username"
                              title="${message(code: 'jtUser.username.label', default: 'Username')}"/>

            <g:sortableColumn property="password"
                              title="${message(code: 'jtUser.password.label', default: 'Password')}"/>

            <g:sortableColumn property="accountExpired"
                              title="${message(code: 'jtUser.accountExpired.label', default: 'Account Expired')}"/>

            <g:sortableColumn property="accountLocked"
                              title="${message(code: 'jtUser.accountLocked.label', default: 'Account Locked')}"/>

            <g:sortableColumn property="enabled" title="${message(code: 'jtUser.enabled.label', default: 'Enabled')}"/>

            <g:sortableColumn property="passwordExpired"
                              title="${message(code: 'jtUser.passwordExpired.label', default: 'Password Expired')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${jtUserInstanceList}" status="i" var="jtUserInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td><g:link action="show"
                            id="${jtUserInstance.id}">${fieldValue(bean: jtUserInstance, field: "username")}</g:link></td>

                <td>${fieldValue(bean: jtUserInstance, field: "password")}</td>

                <td><g:formatBoolean boolean="${jtUserInstance.accountExpired}"/></td>

                <td><g:formatBoolean boolean="${jtUserInstance.accountLocked}"/></td>

                <td><g:formatBoolean boolean="${jtUserInstance.enabled}"/></td>

                <td><g:formatBoolean boolean="${jtUserInstance.passwordExpired}"/></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${jtUserInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
