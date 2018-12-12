<%@ page import="in.jtechies.JtUser" %>



<div class="form-group row ${hasErrors(bean: jtUserInstance, field: 'username', 'error')} required">
    <label for="username" class="col-2">
        <g:message code="jtUser.username.label" default="Username"/>
        <span class="required-indicator">*</span>
    </label>
<div class="col-6">
    <g:textField name="username" required="" class="form-control" value="${jtUserInstance?.username}"/>
</div>

</div>

<div class="form-group row ${hasErrors(bean: jtUserInstance, field: 'password', 'error')} required">
    <label for="password" class="col-2">
        <g:message code="jtUser.password.label"  default="Password"/>
        <span class="required-indicator">*</span>
    </label>
    <div class="col-6">
    <g:textField name="password" required="" class="form-control" value="${jtUserInstance?.password}"/>
    </div>
</div>
<div class="form-group row ${hasErrors(bean: jtUserInstance, field: 'emailId', 'error')} required">
    <label for="emailId" class="col-2 control-label">
        <g:message code="jtUser.password.label" default="Email Id"/>
        <span class="required-indicator">*</span>
    </label>
    <div class="col-6">
    <g:textField name="emailId" required="" class="form-control" value="${jtUserInstance?.emailId}"/>
    </div>
</div>
<sec:ifAnyGranted roles="ROLE_ADMIN">
<div class="form-group row ${hasErrors(bean: jtUserInstance, field: 'accountExpired', 'error')} ">
    <label for="accountExpired">
        <g:message code="jtUser.accountExpired.label" default="Account Expired"/>

    </label>
    <g:checkBox name="accountExpired" value="${jtUserInstance?.accountExpired}"/>

</div>

<div class="form-group row ${hasErrors(bean: jtUserInstance, field: 'accountLocked', 'error')} ">
    <label for="accountLocked">
        <g:message code="jtUser.accountLocked.label" default="Account Locked"/>

    </label>
    <g:checkBox name="accountLocked" value="${jtUserInstance?.accountLocked}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jtUserInstance, field: 'enabled', 'error')} ">
    <label for="enabled">
        <g:message code="jtUser.enabled.label" default="Enabled"/>

    </label>
    <g:checkBox name="enabled" value="${jtUserInstance?.enabled}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: jtUserInstance, field: 'passwordExpired', 'error')} ">
    <label for="passwordExpired">
        <g:message code="jtUser.passwordExpired.label" default="Password Expired"/>

    </label>
    <g:checkBox name="passwordExpired" value="${jtUserInstance?.passwordExpired}"/>

</div>
</sec:ifAnyGranted>

