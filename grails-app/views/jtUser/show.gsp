<%@ page import="in.jtechies.JtUser" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'jtUser.label', default: 'JtUser')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<sec:ifNotLoggedIn>
    You have succesfully registered for post
</sec:ifNotLoggedIn>
<sec:ifAnyGranted roles="ROLE_ADMIN">
    <a href="#show-jtUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                 default="Skip to content&hellip;"/></a>

    <div class="nav" role="navigation">
        <ul>
            <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
            <li><g:link class="list" action="index"><g:message code="default.list.label"
                                                               args="[entityName]"/></g:link></li>
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </ul>
    </div>

    <div id="show-jtUser" class="content scaffold-show" role="main">
        <h1><g:message code="default.show.label" args="[entityName]"/></h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <ol class="property-list jtUser">

            <g:if test="${jtUserInstance?.username}">
                <li class="fieldcontain">
                    <span id="username-label" class="property-label"><g:message code="jtUser.username.label"
                                                                                default="Username"/></span>

                    <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${jtUserInstance}"
                                                                                                field="username"/></span>

                </li>
            </g:if>

            <g:if test="${jtUserInstance?.password}">
                <li class="fieldcontain">
                    <span id="password-label" class="property-label"><g:message code="jtUser.password.label"
                                                                                default="Password"/></span>

                    <span class="property-value" aria-labelledby="password-label"><g:fieldValue bean="${jtUserInstance}"
                                                                                                field="password"/></span>

                </li>
            </g:if>

            <g:if test="${jtUserInstance?.accountExpired}">
                <li class="fieldcontain">
                    <span id="accountExpired-label" class="property-label"><g:message code="jtUser.accountExpired.label"
                                                                                      default="Account Expired"/></span>

                    <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean
                            boolean="${jtUserInstance?.accountExpired}"/></span>

                </li>
            </g:if>

            <g:if test="${jtUserInstance?.accountLocked}">
                <li class="fieldcontain">
                    <span id="accountLocked-label" class="property-label"><g:message code="jtUser.accountLocked.label"
                                                                                     default="Account Locked"/></span>

                    <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean
                            boolean="${jtUserInstance?.accountLocked}"/></span>

                </li>
            </g:if>

            <g:if test="${jtUserInstance?.enabled}">
                <li class="fieldcontain">
                    <span id="enabled-label" class="property-label"><g:message code="jtUser.enabled.label"
                                                                               default="Enabled"/></span>

                    <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean
                            boolean="${jtUserInstance?.enabled}"/></span>

                </li>
            </g:if>

            <g:if test="${jtUserInstance?.passwordExpired}">
                <li class="fieldcontain">
                    <span id="passwordExpired-label" class="property-label"><g:message
                            code="jtUser.passwordExpired.label" default="Password Expired"/></span>

                    <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean
                            boolean="${jtUserInstance?.passwordExpired}"/></span>

                </li>
            </g:if>

        </ol>
        <g:form url="[resource: jtUserInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${jtUserInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </div>
</sec:ifAnyGranted>
</body>
</html>
