<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/header-footer.css">
<jsp:include page="../styles/sidebar.jsp" />


<title>Application</title>
<body>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<div class="svg-container">
    <!-- I created SVG with: https://codepen.io/anthonydugois/pen/mewdyZ -->
    <svg viewbox="0 0 1650 400" class="svg">
        <path id="curve" fill="#50c6d8" d="M 1650 300 Q 400 350 0 300 L 0 0 L 1650 0 L 1650 300 Z">
        </path>
    </svg>
</div>

<header>
    <h1>This is an internship request page</h1>
    <h3>Here you are, scroll down.</h3>
</header>

<main>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/form.css">
    <div class="square">
        <div class="form-style-6">
            <h1>Internship proposal</h1>
            <form id="create_internship" name="create_internship" method="post" action="${pageContext.request.contextPath}/company/create_internship_process">
                <input required type="text" name="title" placeholder="Position Title" />
<%--                <input required type="text" name="company" placeholder="Company Name" />--%>
                <input required type="number" name="salary" placeholder="Salary / Per Year">
                <textarea required name="description" placeholder="Internship Description and Requirements"></textarea>
                <input type="text" name="comments" placeholder="Additional Comments">
                <input type="submit" value="Send" onsubmit="console.log('send')" />
                <input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/>
            </form>
            <div id="bottom1"></div>
        </div>
    </div>

</main>

<footer>
    <p>All rights included....</p>
    <small> Wish you luck, Gregory.</small>
</footer>
</body>

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/header.js"> /*DO NOT REMOVE THIS COMMENT #askjava*/</script>

<script type="text/javascript">
    $(document).ready(function () {
            var form =$("#create_internship").submit(function (event) {
            event.preventDefault();
            console.log(form);

            var $form = $(this),
                url = $form.attr('action');
            console.log("posting happens");

            $.ajax({
                type: "POST",
                url: url,
                data : $('#create_internship').serialize(),
                // dataType: "plain/text",
                success: function(data) {                                   //on success of ajax
                    //var obj = jQuery.parseJSON(data); if the dataType is not specified as json uncomment this
                    console.log("posting sucessful");
                    $("#bottom1").empty().append(data);
                    window.location.reload();
                },
                error: function(xhr, request, error) {                                 //on error
                    //  = eval("(" + xhr.responseText + ")");       //eval is evil dont use it
                    // alert(err.Message);
                    let err = xhr.responseText;
                    alert(err);
                    $('#bottom1').empty().append("Error Encountered with request " + error)
                },
                complete: function () {                             //on completion

                    console.log("submission finished");
                }


            });
        });
    });
</script>