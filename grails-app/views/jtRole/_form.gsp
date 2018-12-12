<%@ page import="in.jtechies.JtRole" %>



<div class="fieldcontain ${hasErrors(bean: jtRoleInstance, field: 'authority', 'error')} required">
    <label for="authority">
        <g:message code="jtRole.authority.label" default="Authority"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="authority" required="" value="${jtRoleInstance?.authority}"/>

</div>

