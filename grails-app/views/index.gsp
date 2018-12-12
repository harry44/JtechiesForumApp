<%@page import="in.jtechies.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="website"/>
    <title>Welcome to Grails</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>

<body>
<div class="container-fluid" style="height:80px;">
    </div>
    <nav class="navbar navbar-expand-lg navbar-light bg-light" style="padding: .3rem .5rem;line-height: 1.0">
        <a class="navbar-brand" href="#">JTechies</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
            <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <g:each in="${Category.list()}" var="category">
                    <li class="nav-item">
                        <a class="nav-link" href="#"> ${category.categoryName}</a>
                    </li>

                </g:each>
                <li class="nav-item"><a class="nav-link" href="${createLink(controller: 'InterviewQuestions',action:'index')}">Interview Questions</a></li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" type="search" placeholder="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
            </form>
        </div>
    </nav>
<div class="container">
    <div class="row">
        <br> <br>
<g:each in="${in.jtechies.Category.list()}" var="category" status="i">
    <img src="${createLink(controller: 'category' ,action: 'showLogo' ,id:category?.id)}" style="height:100px;border:solid 1px purple;border-radius:5px;border-left:2px solid green;margin:10px;" class="thumbnail" >
</g:each>
    </div>
</div>
%{--<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>--}%

%{--<div id="status" role="complementary">--}%
    %{--<h1>Application Status</h1>--}%
    %{--<ul>--}%
        %{--<li>App version: <g:meta name="app.version"/></li>--}%
        %{--<li>Grails version: <g:meta name="app.grails.version"/></li>--}%
        %{--<li>Groovy version: ${GroovySystem.getVersion()}</li>--}%
        %{--<li>JVM version: ${System.getProperty('java.version')}</li>--}%
        %{--<li>Reloading active: ${grails.util.Environment.reloadingAgentEnabled}</li>--}%
        %{--<li>Controllers: ${grailsApplication.controllerClasses.size()}</li>--}%
        %{--<li>Domains: ${grailsApplication.domainClasses.size()}</li>--}%
        %{--<li>Services: ${grailsApplication.serviceClasses.size()}</li>--}%
        %{--<li>Tag Libraries: ${grailsApplication.tagLibClasses.size()}</li>--}%
    %{--</ul>--}%

    %{--<h1>Installed Plugins</h1>--}%
    %{--<ul>--}%
        %{--<g:each var="plugin" in="${applicationContext.getBean('pluginManager').allPlugins}">--}%
            %{--<li>${plugin.name} - ${plugin.version}</li>--}%
        %{--</g:each>--}%
    %{--</ul>--}%
%{--</div>--}%

<div id="page-body" role="main">
    %{--<h1>Welcome to Grails</h1>--}%

    %{--<p>Congratulations, you have successfully started your first Grails application! At the moment--}%
    %{--this is the default page, feel free to modify it to either redirect to a controller or display whatever--}%
    %{--content you may choose. Below is a list of controllers that are currently deployed in this application,--}%
    %{--click on each to execute its default action:</p>--}%

    %{--<div id="controller-list" role="navigation">--}%
        %{--<h2>Available Controllers:</h2>--}%
        %{--<ul>--}%
            %{--<g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName }}">--}%
                %{--<li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>--}%
            %{--</g:each>--}%
        %{--</ul>--}%
    %{--</div>--}%
</div>
</body>
</html>
