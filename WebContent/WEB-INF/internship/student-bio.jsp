<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<link rel="stylesheet" href="https://unpkg.com/purecss@1.0.1/build/pure-min.css" integrity="sha384-oAOxQR6DkCoMliIh8yFnu25d7Eq/PHS21PClpwjOTeU2jRSq11vu66rf90/cZr47" crossorigin="anonymous" >
<jsp:include page="../styles/sidebar.jsp" />

<style>
    .field1 {
        /*padding-right: 40px;*/
        /*display:inline-block;*/
        /*width:80px;*/
        text-align: left;
        /*padding: 14px 10px 0 0;*/
        /*margin:0 0 7px 0;*/
        /*text-align:left;*/
        /*float:left;*/
        /*display: block*/
    }

    .field2 {
        text-align:left;
        /*float:right;*/
        /*display: block*/
        /*display:inline-block;
        width:130px;
        margin:0;
        margin:0 0 7px 0;*/
    }

</style>

<div class="profile-content">
    <div id="svg-container">
        <main style="padding: 24vh">
            <div id="content">
                <mark><h1>Overview</h1></mark>


                <div style="display:flex;justify-content:center;align-items:center;">

                <div style="">
                    <h3 class="field1" ><b>First Name:&emsp;</b></h3>
                    <h3 class="field1" ><b>Last Name:&emsp;</b></h3>
                    <h3 class="field1" ><b>Department:&emsp;</b></h3>
                    <h3 class="field1" ><b>Years In Uni&emsp;</b></h3>
                    <h3 class="field1" ><b>Failed Classes:&emsp;</b></h3>

                </div>

                <div style="">
                    <h3 class="field2">${student.firstName}</h3>
                    <h3 class="field2">${student.lastName}</h3>
                    <h3 class="field2">${student.dept}</h3>
                    <h3 class="field2">${student.year}</h3>
                    <h3 class="field2">${student.failed}</h3>

                </div>

                </div>

                <br>
                <br>
                <br>
            </div>
        </main>
    </div>
    <footer>
        <p>All rights included... Greg & Tanabe Co.</p>
<%--        <small>🕷 Wish you luck, <a href="http://github.com/grigorisar">Gregory</a>.</small>--%>
    </footer>
</div>

<%--&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&ensp;--%>