<%@ page import="in.jtechies.Category;in.jtechies.Post" %>
<head>
    <meta name="layout" content="main">
</head>

<div class="row">
    <div class="col-8">
        <g:each in="${Category.list()}" var="category">
            <div class="shadow-none p-3 bg-light rounded"><h5><i
                    class="fab fa-forumbee text-success"></i> &nbsp;${category?.categoryName} <small
                    class="float-right"> <span class="badge badge-success">${Post.findAllByCategory(category).size()}</span>  <span class="btn btn-default"><i class="fas fa-share-alt"></i></span><i
                        class="fab fa-facebook-f"></i> <i class="fab fa-twitter"></i> <i class="fab fa-linkedin"></i>
            </small>
            </h5>
            </div>

            <div class="shadow-sm p-3 mb-5 bg-white rounded">${category?.description}
                <ul>
                    <g:each in="${Post.findAllByCategory(category)}" var="post">
                        <li><a href="${createLink(controller: 'post', action: 'show', id: post.id,params:[category:category?.id] )}">${post?.postTitle}</a>&nbsp; <i
                                class="far fa-comments"></i></li>

                    </g:each>
                </ul>
                <br>
                <a href="${createLink(controller: 'post', action: 'create' ,params:['category':category.id] )}" class="float-right"><span
                        class="btn btn-outline-success btn-sm"><i class="far fa-paper-plane"></i>&nbsp; New Post</span>
                </a>

                <div class="clearfix"></div>
            </div>
        </g:each>
    </div>

    <div class="col-4">
        <h4>Latest Posts</h4>
        <hr style="margin-top:2px;margin-bottom: 2px;">
<ul class="list-unstyled">
        <g:each in="${Post.list().reverse().groupBy { it.dateCreated.format('dd/MM/yyyy') }}" var="postData" status="i">
           <li>
               <details ${i==0?'open':null}>
               <summary><span class="badge badge-outline-info" style="font-size:9px;"><mark>Publish Date:${postData.key}</mark></span>
               </summary>
               <ul>
            <g:each in="${postData.value}" var="post">
            <li><a href="${createLink(controller: 'post',action: 'show',params: [id: post?.id,category: post?.category?.id])}">${post?.postTitle}</a></li>

            %{--<p>${post?.postContent?.substring(0,30)?.encodeAsRaw()}..<a href>Read More</a></p>--}%

<div class="clearfix"></div>
           </g:each>
           </ul>
                   </details>
           </li>
        </g:each>
</ul>
        <hr style="margin-top:2px;margin-bottom: 2px;">
    </div>

</div>


<div>

</div>
</body>
</html>
