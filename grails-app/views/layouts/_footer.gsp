<sec:ifLoggedIn>
    <hr>
    <br><br>
<a href="${createLink(controller: 'category',action: 'index')}">Category</a>|<a href="${createLink(controller: 'tags',action: 'index')}">Tags</a>
    |<a href="${createLink(controller: 'settings',action: 'index')}">Settins</a>|
    <a href="${createLink(controller: 'jtUser',action: 'index')}">User</a>|
</sec:ifLoggedIn>
</div>
<center>&copy;javatechiesForum</center>
<br>
<br>
<script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
