<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../styles/sidebar.jsp" />
<div class="profile-content">
    <main style="padding: 10vh">
        <div id="content">
            <h1>Select a Service</h1>
            <%-- NAVIGATE TO PAGE--%>
            <h2><a href="<c:url value="/company/internships"></c:url>">Overview</a></h2>
            <h2><a href="<c:url value="/company/new_internship"></c:url>">New internship</a></h2>
            <h2><a href="<c:url value="/manager/company"></c:url>">New Company Account</a></h2>
            <%--<h2><a href="<c:url value="/manager/user"></c:url>">User Manager</a></h2>--%>
<%--<h2><a href="<c:url value="/manager/student"></c:url>">Student Manager</a></h2>--%>
        </div>
    </main>
    <footer>
        <p>All rights included... Greg & Tanabe Co.</p>
        <small>🕷 Wish you luck, <a href="http://github.com/grigorisar">Gregory</a>.</small>
    </footer>
</div>
</html>