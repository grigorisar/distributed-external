<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>



<meta charset="UTF-8">
<html>

<title>Still Testing</title>

<head>

</head>
<%--<jsp:include page="../styles/navbar.jsp" />--%>
<body>
<jsp:include page="../styles/sidebar.jsp" />

<div class="profile-content">
    <main style="padding: 39vh">
        <div id="content">
            <h2 style="align-content: center">Hello!</h2>
            <div class="main">
                <%--    <h3><a href="<c:url value="/showForm"></c:url>">Show Form</a></h3>--%>
                <h3><a href="<c:url value="/company/"></c:url>">Company Representative Menu</a></h3>
                <%--    <h3><a href="<c:url value="/student/"></c:url>">Show Student Menu</a></h3>--%>
                <%--    <h3><a href="<c:url value="/staff/"></c:url>">Show Staff Menu</a></h3>--%>
                <%--    <h3><a href="<c:url value="/manager/"></c:url>">Show Manager Menu</a></h3>--%>
                <%--    <h3><a href="<c:url value="/logout"></c:url>">Sign Out</a></h3>--%>
            </div>
        </div>
    </main>
    <footer>
        <p>All rights included... Greg & Tanabe Co.</p>
        <small> 🕷  🕷  🕷  🕷  🕷  🕷  🕷  🕷  🕷  🕷  .</small>
    </footer>
</div>



</body>

</html>