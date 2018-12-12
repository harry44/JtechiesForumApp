
<%@ page import="in.jtechies.Videos" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'videos.label', default: 'Videos')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-videos" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-videos" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table class="table table-bordered" style="display:none;">
			<thead>
					<tr>
					
						<g:sortableColumn property="title" title="${message(code: 'videos.title.label', default: 'Title')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'videos.description.label', default: 'Description')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'videos.dateCreated.label', default: 'Date Created')}" />
					
						<g:sortableColumn property="lastUpdated" title="${message(code: 'videos.lastUpdated.label', default: 'Last Updated')}" />
					
						<g:sortableColumn property="videoFile" title="${message(code: 'videos.videoFile.label', default: 'Video File')}" />
					%{----}%
						<g:sortableColumn property="videoPoster" title="${message(code: 'videos.videoPoster.label', default: 'Video Poster')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${videosInstanceList}" status="i" var="videosInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${videosInstance.id}">${fieldValue(bean: videosInstance, field: "title")}</g:link></td>
					
						<td>${fieldValue(bean: videosInstance, field: "description")}</td>
					
						<td><g:formatDate date="${videosInstance.dateCreated}" /></td>
					
						<td><g:formatDate date="${videosInstance.lastUpdated}" /></td>
						<td><video controls height="200px;">
							<source src="${createLink(controller: 'videos',action: 'showVideo',id:videosInstance?.id)}">
						</video></td>
						<td><img src="${createLink(controller: 'videos',action: 'showPoster',id:videosInstance?.id)}" style="height:150px; width:300px;"></td>
					
						%{--<td>${fieldValue(bean: videosInstance, field: "videoFile")}</td>--}%
					%{----}%
						%{--<td>${fieldValue(bean: videosInstance, field: "videoPoster")}</td>--}%
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${videosInstanceCount ?: 0}" />
			</div>
		</div>
	<div class="row">
		<div class="col-9">
			%{--<video controls width="100%">--}%
				%{--<source src="${createLink(controller: 'videos',action: 'showVideo',id:videosInstanceList[0]?.id)}">--}%
			%{--</video>--}%
			<video controls crossorigin playsinline preload="auto" oncanplaythrough poster="${createLink(controller: 'videos',action: 'showPoster',id:videosInstanceList[0]?.id)}" id="player" width="100%">
				<!-- Video files -->
				<source src="file:///F:/TUTORIAL_VIDEOS/MYSQL/JPassion.com%20-%20MySQL%20(with%20Passion!)_2.mp4" type="video/mp4" size="576">
				%{--<source src="${createLink(controller: 'videos',action: 'showVideo',id:videosInstanceList[0]?.id)}" type="video/mp4" size="720">--}%
				%{--<source src="${createLink(controller: 'videos',action: 'showVideo',id:videosInstanceList[0]?.id)}" type="video/mp4" size="1080">--}%

				%{--<!-- Caption files -->--}%
				%{--<track kind="captions" label="English" srclang="en" src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.en.vtt"--}%
					   %{--default>--}%
				%{--<track kind="captions" label="FranÃ§ais" srclang="fr" src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.fr.vtt">--}%

				<!-- Fallback for browsers that don't support the <video> element -->
				<a href="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4" download>Download</a>
			</video>
		</div>
		<div class="col-3">
<g:each in="${videosInstanceList}" status="i" var="videosInstance">
	<video controls crossorigin playsinline preload="auto" oncanplaythrough height="150px;" src="${createLink(controller: 'videos',action: 'showPoster',id:videosInstance?.id)}">
		%{--<source src="${createLink(controller: 'videos',action: 'showVideo',id:videosInstance?.id)}">--}%
	</video>
</g:each>
		</div>

	</div>
	<video controls crossorigin playsinline poster="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.jpg" id="player">
		<!-- Video files -->
		<source src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4" type="video/mp4" size="576">
		<source src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-720p.mp4" type="video/mp4" size="720">
		<source src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-1080p.mp4" type="video/mp4" size="1080">

		<!-- Caption files -->
		<track kind="captions" label="English" srclang="en" src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.en.vtt"
			   default>
		<track kind="captions" label="FranÃ§ais" srclang="fr" src="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-HD.fr.vtt">

		<!-- Fallback for browsers that don't support the <video> element -->
		<a href="https://cdn.plyr.io/static/demo/View_From_A_Blue_Moon_Trailer-576p.mp4" download>Download</a>
	</video>
	<script src="../dist/plyr.js" crossorigin="anonymous"></script>

	<!-- Sharing libary (https://shr.one) -->
	<script src="https://cdn.shr.one/1.0.1/shr.js" crossorigin="anonymous"></script>

	<!-- Rangetouch to fix <input type="range"> on touch devices (see https://rangetouch.com) -->
	<script src="https://cdn.rangetouch.com/1.0.1/rangetouch.js" async crossorigin="anonymous"></script>
	</body>
</html>
