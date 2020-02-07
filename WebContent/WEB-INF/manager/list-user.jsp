<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 26-Dec-19
  Time: 7:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>List Customers</title>
    <!-- reference our style sheet -->
<%--    <link type="text/css" rel="stylesheet"--%>
<%--          href="${pageContext.request.contextPath}/resources/css/style.css"/>--%>

</head>
<body>
<link type="text/css" rel="stylesheet"
      href="${pageContext.request.contextPath}/resources/css/buttons.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <script type="text/javascript" src=" https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>

<div id="wrapper">
    <div id="header">
        <h1> UDM - User Data Manager</h1>
    </div>
</div>

<div id="container">
    <div id="content">
        <!--  add our html table here -->
        <table id="list" class="steelBlueCols" style="width:100%">
            <thead>
            <tr>
                <th>Username</th>
                <th>Password</th>
                <th>Enabled</th>
            </tr>
            </thead>
            <c:forEach var="tempUser" items="${users}">
            <!-- loop over and print ONLY enabled users -->
                <c:if test="${not (tempUser.enabled eq 0)}">
                    <tr>
                        <td>${tempUser.username}</td>
                        <td>${tempUser.password}</td>
                        <td>${tempUser.enabled}</td>
                    </tr>
                </c:if>
            </c:forEach>
        </table>
    </div>
</div>
<div class="main">
    <div class="sub-main">
        <button class="button-one">New User</button>
    </div>
    <div class="sub-main">
        <button class="button-two"><span>Update User</span></button>
    </div>
    <div class="sub-main">
        <button class="button-three">Delete User</button>
    </div>
</div>
<script type="text/javascript">

    function highlight(e) {
        if (selected[0]) selected[0].className = '';
        e.target.parentNode.className = 'selected';
        // var v= $(this).find(".selected td:first").html()
        var v = $('.selected td').eq(1).text();             //get selected table row'w second column (starts from zero)
        console.log(v);
    }

    var table = document.getElementById('list'),
        selected = table.getElementsByClassName('selected');


    table.onclick = highlight;
</script>

</body>
</html>
