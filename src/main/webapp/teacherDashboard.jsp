<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="in.mk.model.Teacher" %>
<%
    Teacher user = (Teacher) session.getAttribute("user");
//    if (user == null || !"student".equalsIgnoreCase(user.getRole())) {
//        response.sendRedirect("login.jsp");
//        return;
//    }
%>
<html>
    <head>
        <title>Teacher Dashboard</title>
        <style>
            body {
                margin: 0;
                font-family: Arial, sans-serif;
            }
            .navbar {
                background-color: #2c3e50;
                padding: 1rem;
                color: white;
            }
            .sidebar {
                width: 200px;
                height: 100vh;
                background-color: #34495e;
                color: white;
                float: left;
                padding-top: 20px;
                position: fixed;
            }
            .sidebar a {
                display: block;
                color: white;
                padding: 12px 20px;
                text-decoration: none;
            }
            .sidebar a:hover {
                background-color: #1abc9c;
            }
            .main {
                margin-left: 200px;
                padding: 20px;
            }
        </style>
    </head>
    <body>

        <%@ include file="includes/navbar.jsp" %>
        <%@ include file="includes/teacherSidebar.jsp" %>
        <div class="main">
            <jsp:include page="${param.page != null ? param.page : 'teacherHome.jsp'}" />
        </div>

        <%@ include file="includes/footer.jsp" %>



    </body>
</html>
