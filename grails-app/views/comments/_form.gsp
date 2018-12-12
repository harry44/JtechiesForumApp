<%@ page import="in.jtechies.Comments" %>



<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'comment', 'error')} required">
    <label for="comment">
        <g:message code="comments.comment.label" default="Comment"/>
        <span class="required-indicator">*</span>
    </label>
    <g:textField name="comment" required="" value="${commentsInstance?.comment}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: commentsInstance, field: 'post', 'error')} required">
    <label for="post">
        <g:message code="comments.post.label" default="Post"/>
        <span class="required-indicator">*</span>
    </label>
    <g:select id="post" name="post.id" from="${in.jtechies.Post.list()}" optionKey="id" required=""
              value="${commentsInstance?.post?.id}" class="many-to-one"/>

</div>

