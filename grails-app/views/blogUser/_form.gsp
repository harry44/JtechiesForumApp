<%@ page import="in.jtechies.blog.BlogUser" %>



<div class="fieldcontain ${hasErrors(bean: blogUserInstance, field: 'userLogin', 'error')} ">
	<label for="userLogin">
		<g:message code="blogUser.userLogin.label" default="User Login" />
		
	</label>
	<g:textField name="userLogin" value="${blogUserInstance?.userLogin}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogUserInstance, field: 'userNicename', 'error')} ">
	<label for="userNicename">
		<g:message code="blogUser.userNicename.label" default="User Nicename" />
		
	</label>
	<g:textField name="userNicename" value="${blogUserInstance?.userNicename}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogUserInstance, field: 'displayName', 'error')} ">
	<label for="displayName">
		<g:message code="blogUser.displayName.label" default="Display Name" />
		
	</label>
	<g:textField name="displayName" value="${blogUserInstance?.displayName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogUserInstance, field: 'userEmail', 'error')} ">
	<label for="userEmail">
		<g:message code="blogUser.userEmail.label" default="User Email" />
		
	</label>
	<g:textField name="userEmail" value="${blogUserInstance?.userEmail}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogUserInstance, field: 'userPass', 'error')} ">
	<label for="userPass">
		<g:message code="blogUser.userPass.label" default="User Pass" />
		
	</label>
	<g:textField name="userPass" value="${blogUserInstance?.userPass}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogUserInstance, field: 'userRegistered', 'error')} ">
	<label for="userRegistered">
		<g:message code="blogUser.userRegistered.label" default="User Registered" />
		
	</label>
	<g:datePicker name="userRegistered" precision="day"  value="${blogUserInstance?.userRegistered}" default="none" noSelection="['': '']" />

</div>

