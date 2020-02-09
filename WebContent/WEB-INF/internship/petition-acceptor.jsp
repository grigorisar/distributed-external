<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>


</html>


    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Role Manager</title>

    <link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" integrity="sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47" crossorigin="anonymous" >
    <jsp:include page="../styles/sidebar.jsp" />



<div class="profile-content">
    <main style="padding: 35vh">
        <div id="content">
        <br>
        <table id="table" class="display"  align="center">
            <thead>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>BIO</th>
            </tr>
            </thead>
            <tbody id="table_body">

            <c:forEach var="tempPet" items="${petitions}">
                <tr>
                    <td style="text-align: center">${tempPet.id}</td>
                    <td style="text-align: center">${tempPet.title}</td>
                    <td style="text-align: center">${tempPet.description}</td>
                    <td style="text-align: center">
                            <%--                create link to new page for student with current username--%>
                        <a href="${pageContext.request.contextPath}/company/get_bio?username=${tempPet.student_username}" target="_blank"  >BIO</a>
                    </td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
        </div>

    </main>
    <footer>
        <p>All rights included... Greg & Tanabe Co.</p>
        <small>🕷 Please don't hurt me CSS.</small>
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

</html>
