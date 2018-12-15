<%@ page import="in.jtechies.Post;in.jtechies.Tags;" %>



<%--<div class="fieldcontain ${hasErrors(bean: postInstance, field: 'comments', 'error')} ">
	<label for="comments">
		<g:message code="post.comments.label" default="Comments" />
		
	</label>
	<g:select id="comments" name="comments.id" from="${in.jtechies.Comments.list()}" optionKey="id" value="${postInstance?.comments?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

--%><div class="form-group required row">
    <label for="category" class="col-2">
        <g:message code="post.category.label" default="Category"/>
        <span class="required-indicator">*</span>
    </label>

    <div class="col-8">
        <g:select id="category" name="category.id" from="${in.jtechies.Category.list()}" optionKey="id"
                  optionValue="categoryName" required="" value="${postInstance?.category?.id==null?params?.category:postInstance?.category?.id}"
                  class="many-to-one form-control"/>

    </div>

</div>

<div class="form-group row ${hasErrors(bean: postInstance, field: 'postTitle', 'error')} required">
    <label for="postTitle" class="col-2">
        <g:message code="post.postTitle.label" default="Post Title"/>
        <span class="required-indicator">*</span>
    </label>
    <div class="col-8">
    <g:textField name="postTitle" required="" value="${postInstance?.postTitle}" class="form-control"/>
    </div>
</div>

<div class="form-group row ${hasErrors(bean: postInstance, field: 'postContent', 'error')} required">
    <label for="postContent" class="col-2">
        <g:message code="post.postContent.label" default="Post Content"/>
        <span class="required-indicator">*</span>
    </label>
    <div class="col-8">
    %{--<g:textArea name="postContent" value="${postInstance?.postContent}" class="form-control" cols="30" rows="5"/>--}%
        %{--<textarea name="postContent" id="editor"></textarea>--}%
        <ckeditor:editor name="postContent"  width="100%" toolbar="Mytoolbar" height="300px;">
           ${postInstance?.postContent}
        </ckeditor:editor>
    </div>
    </div>
    <div class="form-group row">
        <label class="col-2">Tags</label>
        <div class="col-8">
            <g:select from="${Tags.list()}" name="tags" optionKey="id" class="form-control" optionValue="tagName" multiple="" value="${postInstance.tags}">

            </g:select>
        </div>
    </div>


