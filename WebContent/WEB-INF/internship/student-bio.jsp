<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" integrity="sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47" crossorigin="anonymous" >
<jsp:include page="../styles/sidebar.jsp" />

<div class="profile-content">
    <div id="svg-container">
        <main style="padding: 10vh">
            <div id="content">
                <mark><h1>Overview</h1></mark>
                <h3 align="left"><b>&emsp;&emsp;&emsp;First Name:</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;${student.firstName}</h3>
                <h3 align="left"><b>&emsp;&emsp;&emsp;Last Name:</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;${student.lastName}</h3>
                <h3 align="left"><b>&emsp;&emsp;&emsp;Department:</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;${student.dept}</h3>
                <h3 align="left"><b>&emsp;&emsp;&emsp;Years In Uni:</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;${student.year}</h3>
                <h3 align="left"><b>&emsp;&emsp;&emsp;Failed Classes:</b>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;${student.failed}</h3>
            </div>
        </main>
    </div>
    <footer>
        <p>All rights included... Greg & Tanabe Co.</p>
        <small>🕷 Wish you luck, <a href="http://github.com/grigorisar">Gregory</a>.</small>
    </footer>
</div>