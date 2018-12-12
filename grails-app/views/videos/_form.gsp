<%@ page import="in.jtechies.Videos" %>



<div class="fieldcontain ${hasErrors(bean: videosInstance, field: 'title', 'error')} ">
	<label for="title">
		<g:message code="videos.title.label" default="Title" />
		
	</label>
	<g:textField name="title" value="${videosInstance?.title}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: videosInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="videos.description.label" default="Description" />
		
	</label>
	<g:textField name="description" value="${videosInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: videosInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="videos.comments.label" default="Comments" />
		
	</label>
	<g:select name="comments" from="${in.jtechies.Comments.list()}" multiple="multiple" optionKey="id" size="5" value="${videosInstance?.comments*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: videosInstance, field: 'tags', 'error')} ">
	<label for="tags">
		<g:message code="videos.tags.label" default="Tags" />
		
	</label>
	<g:select name="tags" from="${in.jtechies.Tags.list()}" multiple="multiple" optionKey="id" size="5" value="${videosInstance?.tags*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: videosInstance, field: 'videoFile', 'error')} required">
	<label for="videoFile">
		<g:message code="videos.videoFile.label" default="Video File" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="videoFile" name="videoFile"  accept="video/mp4"/>

</div>

<div class="fieldcontain ${hasErrors(bean: videosInstance, field: 'videoPoster', 'error')} required">
	<label for="videoPoster">
		<g:message code="videos.videoPoster.label" default="Video Poster" />
		<span class="required-indicator">*</span>
	</label>
	<input type="file" id="videoPoster" name="videoPoster" />

</div>

