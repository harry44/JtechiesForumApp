<%@ page import="in.jtechies.Post;in.jtechies.Category;in.jtechies.Comments;" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'post.label', default: 'Post')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<div class="row">
    <div class="col-3" style="border-right:solid 1px aliceblue;">
       <ul class="nav">
        <g:each in="${Post.findAllByCategory(Category.get(params?.category))}" var="post">
           <li><i class="fas fa-arrow-circle-right text-info"></i> &nbsp;<a href="${createLink(controller: 'post', action: 'show',id:post.id ,params:['category':params?.category] )}">${post?.postTitle}</a></li>


        </g:each>
       </ul>
    </div>
    <div class="col-6" style="border-right:solid 1px aliceblue;">
        <h3 align="center"><i class="fab fa-forumbee text-success"></i> &nbsp;${postInstance.category?.categoryName}
        </h3><hr>
        <h5><i class="far fa-paper-plane"></i> &nbsp;<u>${postInstance.postTitle}</u></h5>

        <div>${postInstance?.postContent?.encodeAsRaw()}</div>

        <a href="${createLink(controller: 'post',action: 'edit',id:postInstance?.id)}" >Edit <i class="far fa-edit"></i></a>
        <hr>
        <b>Tags :</b>
        <g:each in="${postInstance?.tags}" var="tags">
            <span class="badge badge-info">${tags?.tagName}</span>
        </g:each>
        <hr>
        <h4>Comments (${Comments.findAllByPost(postInstance)?.size()})</h4>
        <div id="allCommets">
        <g:each in="${Comments.findAllByPost(postInstance).take(5)}" var="comments">

           <i class="fas fa-user"></i> ${comments?.comment}<br>
            <i style="font-size: x-small">${comments?.dateCreated}</i>
           <br>
        </g:each>

            <div  id="livecomment">


        </div>
            </div>
        <a href="${createLink(controller: 'comments',action: 'index',id:params.id)}" style="font-size: smaller"> view All comments</a>


        <h5>Post Your Comment:<small class="float-right"><span class="btn btn-default"><i class="fas fa-share-alt"></i></span><i
                class="fab fa-facebook-f"></i> <i class="fab fa-twitter"></i> <i class="fab fa-linkedin"></i>
        </small></h5>

        <g:textArea name="comments" id="comments" class="col-6" cols="10" rows="3" class="form-control"></g:textArea>
        <div class="clearfix"></div>
        <br>
        <input type="submit" value="submit" class="btn btn-outline-success btn-sm pull-right" onclick="saveComents();">
        <script>
           function saveComents() {
               var comments= $("#comments").val();
              if(comments!=null &&comments!="") {
                  $.ajax({
                      type: 'POST',
                      data: {post: '${params.id}', comment: comments},
                      url: '${createLink(controller: 'comments',action: 'saveComment')}',
                      success: function (data) {
                          alert("success" + data);
                          $("#livecomment").html(data);
                          $("#livecomment").show();
                      },
                      error: function () {
                          alert("error"+data);
                      }
                  })
              }else{
                  alert("please enter somthing")
              }
           }
        </script>
    </div>
    <div class="col-3">
        <h4>Other Tutorials</h4>
        <hr>
        <ul type="none" ">
<g:each in="${Category.list()}" var="category">
   <li> <i class="fas fa-hand-point-right text-muted"></i> &nbsp;<a href="">${category.categoryName}</a></li>
    </g:each>

        </ul>
    </div>
    </div>
</div>
%{--<a href="#show-post" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%
%{--<div class="nav" role="navigation">--}%
%{--<ul>--}%
%{--<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>--}%
%{--<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>--}%
%{--<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>--}%
%{--</ul>--}%
%{--</div>--}%
%{--<div id="show-post" class="content scaffold-show" role="main">--}%
%{--<h1><g:message code="default.show.label" args="[entityName]" /></h1>--}%
%{--<g:if test="${flash.message}">--}%
%{--<div class="message" role="status">${flash.message}</div>--}%
%{--</g:if>--}%
%{--<ol class="property-list post">--}%
%{----}%
%{--<g:if test="${postInstance?.comments}">--}%
%{--<li class="fieldcontain">--}%
%{--<span id="comments-label" class="property-label"><g:message code="post.comments.label" default="Comments" /></span>--}%
%{----}%
%{--<span class="property-value" aria-labelledby="comments-label"><g:link controller="comments" action="show" id="${postInstance?.comments?.id}">${postInstance?.comments?.encodeAsHTML()}</g:link></span>--}%
%{----}%
%{--</li>--}%
%{--</g:if>--}%
%{----}%
%{--<g:if test="${postInstance?.category}">--}%
%{--<li class="fieldcontain">--}%
%{--<span id="category-label" class="property-label"><g:message code="post.category.label" default="Category" /></span>--}%
%{----}%
%{--<span class="property-value" aria-labelledby="category-label"><g:link controller="category" action="show" id="${postInstance?.category?.id}">${postInstance?.category?.encodeAsHTML()}</g:link></span>--}%
%{----}%
%{--</li>--}%
%{--</g:if>--}%
%{----}%
%{--<g:if test="${postInstance?.dateCreated}">--}%
%{--<li class="fieldcontain">--}%
%{--<span id="dateCreated-label" class="property-label"><g:message code="post.dateCreated.label" default="Date Created" /></span>--}%
%{----}%
%{--<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${postInstance?.dateCreated}" /></span>--}%
%{----}%
%{--</li>--}%
%{--</g:if>--}%
%{----}%
%{--<g:if test="${postInstance?.lastUpdated}">--}%
%{--<li class="fieldcontain">--}%
%{--<span id="lastUpdated-label" class="property-label"><g:message code="post.lastUpdated.label" default="Last Updated" /></span>--}%
%{----}%
%{--<span class="property-value" aria-labelledby="lastUpdated-label"><g:formatDate date="${postInstance?.lastUpdated}" /></span>--}%
%{----}%
%{--</li>--}%
%{--</g:if>--}%
%{----}%
%{--<g:if test="${postInstance?.postTitle}">--}%
%{--<li class="fieldcontain">--}%
%{--<span id="postTitle-label" class="property-label"><g:message code="post.postTitle.label" default="Post Title" /></span>--}%
%{----}%
%{--<span class="property-value" aria-labelledby="postTitle-label"><g:fieldValue bean="${postInstance}" field="postTitle"/></span>--}%
%{----}%
%{--</li>--}%
%{--</g:if>--}%
%{----}%
%{--</ol>--}%
%{--<g:form url="[resource:postInstance, action:'delete']" method="DELETE">--}%
%{--<fieldset class="buttons">--}%
%{--<g:link class="edit" action="edit" resource="${postInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>--}%
%{--<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />--}%
%{--</fieldset>--}%
%{--</g:form>--}%
%{--</div>--}%
</body>
</html>
