<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>

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
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.20/js/dataTables.jqueryui.min.js"></script>

<%--PROJECT STYLES--%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/account.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/header-footer.css">






<style>
    tr {border: 1px #DDD solid; padding: 5px;}
    td {border: 1px #DDD solid; padding: 5px; cursor: pointer;}

   /* .l-box {
        padding: 1em;
    }*/
    /*
          .hovered td {
              background: #ddd;
          }
    */
</style>
<!-- SIDEBAR START -->
<div class="profile-sidebar">
    <!-- SIDEBAR USER TITLE -->
    <div class="profile-usertitle">
        <div class="profile-usertitle-name">
            ${pageContext.request.userPrincipal.name}
        </div>
        <div class="profile-usertitle-job">
            Company Representative
        </div>
    </div>
    <!-- END SIDEBAR USER TITLE -->
    <!-- SIDEBAR BUTTONS -->
    <div class="profile-userbuttons">
        <c:set value="${not empty pageContext.request.userPrincipal}" var="loginCheck"/>
        <c:choose>
            <c:when test="${loginCheck}">
                <c:set value="${pageContext.request.contextPath}/logout" var="url"/>
            </c:when>
            <c:otherwise>
                <c:set value="${pageContext.request.contextPath}/login" var="url"/>
            </c:otherwise>
        </c:choose>
        <button type="button" class="btn btn-info btn-sm"><a class="active" href= "${url}" >${loginCheck ? 'Sign Out' : 'Sign In'}</a></button>
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
                <a href="${pageContext.request.contextPath}/company/accept_petitions">
                    <i class="glyphicon glyphicon-ok"></i>
                    Accept Petitions </a>
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
