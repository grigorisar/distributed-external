<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>

<html>

<head>
<%--    <script type="text/javascript" src="https://code.jquery.com/jquery-3.4.1.js"></script>--%>

    <style>
        ul {
            list-style-type: none;
            margin: 0;
            padding: 0;
            overflow: hidden;
            background-color: #333;
        }

        li {
            float: left;
        }

        li a, .dropbtn {
            display: inline-block;
            color: white;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
        }

        li a:hover, .dropdown:hover .dropbtn {
            background-color: red;
        }

        li.dropdown {
            display: inline-block;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #f9f9f9;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
            text-align: left;
        }

        .dropdown-content a:hover {background-color: #f1f1f1;}

        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
</head>
<body>

<ul>
    <li><a href="${pageContext.request.contextPath}">Home</a></li>
    <li class="dropdown">
        <a href="javascript:void(0)" class="dropbtn">Representative</a>
        <div class="dropdown-content">
            <a href="${pageContext.request.contextPath}/rep/accept_petitions">Petition</a>
        </div>
    </li>
    <c:set value="${not empty pageContext.request.userPrincipal}" var="loginCheck"/>

    <c:choose>
        <c:when test="${loginCheck}">
            <c:set value="${pageContext.request.contextPath}/logout" var="url"/>
        </c:when>
        <c:otherwise>
            <c:set value="${pageContext.request.contextPath}/login" var="url"/>
        </c:otherwise>
    </c:choose>

    <li style="float:right"><a class="active" href= "${url}" >${loginCheck ? 'Sign Out' : 'Sign In'}</a></li>
        </ul>

        </body>
        </html>
