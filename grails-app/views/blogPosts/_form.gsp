<%@ page import="in.jtechies.blog.BlogPosts" %>


<div class="form-group row ${hasErrors(bean: blogPostsInstance, field: 'postTitle', 'error')} ">
	<label for="postTitle" class="col-2">
		<g:message code="blogPosts.postTitle.label" default="Post Title" />

	</label>
	<div class="col-8">
	<g:textField name="postTitle" value="${blogPostsInstance?.postTitle}" class="form-control"/>
	</div>
</div>
%{--<div class="fieldcontain ${hasErrors(bean: blogPostsInstance, field: 'postAuthor', 'error')} ">--}%
	%{--<label for="postAuthor">--}%
		%{--<g:message code="blogPosts.postAuthor.label" default="Post Author" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:textField name="postAuthor" value="${blogPostsInstance?.postAuthor}"/>--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: blogPostsInstance, field: 'postModified', 'error')} ">--}%
	%{--<label for="postModified">--}%
		%{--<g:message code="blogPosts.postModified.label" default="Post Modified" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:datePicker name="postModified" precision="day"  value="${blogPostsInstance?.postModified}" default="none" noSelection="['': '']" />--}%

%{--</div>--}%

%{--<div class="fieldcontain ${hasErrors(bean: blogPostsInstance, field: 'postDate', 'error')} ">--}%
	%{--<label for="postDate">--}%
		%{--<g:message code="blogPosts.postDate.label" default="Post Date" />--}%
		%{----}%
	%{--</label>--}%
	%{--<g:datePicker name="postDate" precision="day"  value="${blogPostsInstance?.postDate}" default="none" noSelection="['': '']" />--}%

%{--</div>--}%

%{--<textArea class="fieldcontain ${hasErrors(bean: blogPostsInstance, field: 'postContent', 'error')} ">--}%
	%{--<label for="postContent">--}%
		%{--<g:message code="blogPosts.postContent.label" default="Post Content" />--}%
		%{----}%
	%{--</label>--}%
	%{--<textArea name="postContent" value="${blogPostsInstance?.postContent}"/></textArea>--}%
<ckeditor:editor name="postContent"  width="100%" toolbar="Mytoolbar" height="200px;">
	${blogPostsInstance?.postContent}
</ckeditor:editor>

%{--</div>--}%



<div class="fieldcontain ${hasErrors(bean: blogPostsInstance, field: 'postStatus', 'error')} ">
	<label for="postStatus">
		<g:message code="blogPosts.postStatus.label" default="Post Status" />
		
	</label>
	<g:textField name="postStatus" value="${blogPostsInstance?.postStatus}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogPostsInstance, field: 'postName', 'error')} ">
	<label for="postName">
		<g:message code="blogPosts.postName.label" default="Post Name" />
		
	</label>
	<g:textField name="postName" value="${blogPostsInstance?.postName}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: blogPostsInstance, field: 'postType', 'error')} ">
	<label for="postType">
		<g:message code="blogPosts.postType.label" default="Post Type" />
		
	</label>
	<g:textField name="postType" value="${blogPostsInstance?.postType}"/>

</div>

