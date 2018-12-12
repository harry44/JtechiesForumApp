<%@ page import="in.jtechies.Tags" %>



<div class="fieldcontain ${hasErrors(bean: tagsInstance, field: 'post', 'error')} ">
	<label for="post">
		<g:message code="tags.post.label" default="Post" />
		
	</label>
	

</div>

<div class="fieldcontain ${hasErrors(bean: tagsInstance, field: 'tagName', 'error')} required">
	<label for="tagName">
		<g:message code="tags.tagName.label" default="Tag Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="tagName" required="" value="${tagsInstance?.tagName}"/>

</div>

