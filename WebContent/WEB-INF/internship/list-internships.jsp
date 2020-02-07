<%--LIBRARIES AND STYLES--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" integrity="sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47" crossorigin="anonymous" >

<!-- styling for the datatable -->
<link rel="stylesheet" type="text/css" href=" https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css ">
<link rel="stylesheet" type="text/css" href=" https://cdn.datatables.net/1.10.20/css/dataTables.jqueryui.min.css ">


<!-- <%--  jquery sources  --%> -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- <%--  scripts sources for jquery data tables --%> -->
<script type="text/javascript" src=" https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.jqueryui.min.js"></script>

<%--PROJECT STYLES--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header-footer.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/navbar.css">


<ul class="navbar">
    <li><a href="${pageContext.request.contextPath}">Home</a></li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Representative</a>
        <div class="dropdown-content">
            <a href="${pageContext.request.contextPath}/rep/accept_petitions">Petition</a>
        </div>
    </li><
    <li style="float:right"><a class="active" href= "${url}" >${loginCheck ? 'Sign Out' : 'Sign In'}</a></li>
</ul>
<!-- SIDEBAR START -->
<div class="profile-sidebar">
    <!-- SIDEBAR USER TITLE -->
    <div class="profile-usertitle">
        <div class="profile-usertitle-name">
            ${username}
        </div>
        <div class="profile-usertitle-job">
            Full Stack Developer
        </div>
    </div>
    <!-- END SIDEBAR USER TITLE -->
    <!-- SIDEBAR BUTTONS -->
    <div class="profile-userbuttons">
        <button type="button" class="btn btn-success btn-sm">Sign in</button>
        <button type="button" class="btn btn-danger btn-sm">Sign out</button>
    </div>
    <!-- END SIDEBAR BUTTONS -->
    <!-- SIDEBAR MENU -->
    <div class="profile-usermenu">
        <ul class="navprofile">
            <li class="active">
                <a href="${pageContext.request.contextPath}/company/">
                    <i class="glyphicon glyphicon-home"></i>
                    Overview </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/company/internships/">
                    <i class="glyphicon glyphicon-user"></i>
                    List of Internships </a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/company/new_internship">
                    <i class="glyphicon glyphicon-ok"></i>
                    New Internship </a>
            </li>

            <li>
                <a href="#">
                    <i class="glyphicon glyphicon-flag"></i>
                    Help </a>
            </li>
        </ul>
    </div>
    <!-- END MENU -->
</div>
<!-- END SIDEBAR -->




<!-- CONTENT HERE  -->




<div class="profile-content">
    <main style="padding: 10vh">
        <div id="content">
            <!--  add our html table here -->
            <table id="table" class="display" style="width:100%">
                <thead>
                <tr>
                    <th>Title </th>
                    <th>Salary  </th>
                    <th>Description   </th>
                </tr>
                </thead>
                <tbody id="table_body">
                <!-- loop over and print staff members -->
                <c:forEach var="internship" items="${internships}">
                    <c:if test="${internship.status == 'pending'}">
                        <tr>
                            <td>${internship.title}  </td>
                            <td>${internship.salary}  </td>
                            <td>${internship.description}  </td>
                        </tr>
                    </c:if>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
    <footer>
        <p>All rights included... Greg & Tanabe Co.</p>
        <small>🕷 Wish you luck, <a href="http://github.com/grigorisar">Gregory</a>.</small>
    </footer>
</div>

<script type="text/javascript">

    $('table tr').mouseover(function() {    //on hover color script
        $(this).addClass('hovered');
    }).mouseout(function() {
        $(this).removeClass('hovered');
    });

    function highlight(e) {                           //highlight function
        if (selected[0]) {
            selected[0].className = ''
        }

        e.target.parentNode.className = 'selected';

    }

    var table = document.getElementById('table');

    var selected = table.getElementsByClassName('selected');

    table.onclick = highlight;


    $(document).ready(function() {

        var table = $('#table').DataTable();    //make "table" into a datatable using the library
    });
</script>