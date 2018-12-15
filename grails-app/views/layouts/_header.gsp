<html>
<head>
    <title>Forum Home</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
          integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
          integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
            integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
            crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.3.1.js"></script>


</head>

<body>

<div class="container">
    <div class="row shadow-sm p-2  bg-white rounded">
        <div class="col-6"><h3><a href="${request.contextPath}">Jtechies Forum</a></h3>
            <b><a href="${request.contextPath}/index">Website</a></b>
        </div>

        <div class="col-6">

            <sec:ifLoggedIn>
                <div class="float-right">welcome <span class="badge badge-success"><sec:loggedInUserInfo
                        field="username"></sec:loggedInUserInfo></span> <i class="fa fa-unlock"></i>
                    <a href="${createLink(controller: 'logout',action:'index')}">Logout</a>
                </div>
            </sec:ifLoggedIn>
            <sec:ifNotLoggedIn>
                <a href="${createLink(controller: 'jtUser',action: 'create')}">Register User</a>

                <div class="float-right"><i class="fa fa-user"></i><a href="${createLink(controller: 'login',action: 'auth')}">login</a></div>
            </sec:ifNotLoggedIn>
        </div>
    </div>
    <hr/>