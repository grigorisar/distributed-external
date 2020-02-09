<%--LIBRARIES AND STYLES--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" integrity="sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47" crossorigin="anonymous" >
<jsp:include page="../styles/sidebar.jsp" />

<!-- CONTENT HERE  -->
<div class="profile-content">
        <div id="svg-container">
            <main style="padding: 33vh">
                <div id="content">
                    <!--  add our html table here -->
                    <table id="table" class="display" align="center">
                        <thead>
                        <tr>
                            <th>ID </th>
                            <th>Title </th>
                            <th>Salary  </th>
                            <th>Description </th>
                            <th>Petition List </th>
                        </tr>
                        </thead>
                        <tbody id="table_body">
                        <!-- loop over and print staff members -->
                        <c:forEach var="internship" items="${internships}">
                            <c:if test="${internship.status == 'pending'}">
                                <tr>
                                    <td>${internship.id}  </td>
                                    <td>${internship.title}  </td>
                                    <td>${internship.salary}  </td>
                                    <td>${internship.description}  </td>
                                    <td> <a href="<c:url value='/company/internship/${internship.id}'/>" >View Petitions </a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </main>
        </div>
        <footer>
            <p>All rights included... Greg & Tanabe Co.</p>
            <small>🕷 Wish you luck, Gregory.</small>
    </footer>
</div>

<<script type="text/javascript">
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

















