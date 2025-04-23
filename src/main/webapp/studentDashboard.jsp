<%@ page session="true" %>
<%@ page import="in.mk.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Student user = (Student) session.getAttribute("user");
//    if (user == null || !"student".equalsIgnoreCase(user.getRole())) {
//        response.sendRedirect("login.jsp");
//        return;
//    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Student Dashboard</title>
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

            body {
                margin: 0;
                font-family: Arial;
                display: flex;
            }

            .sidebar {
                width: 220px;
                height: 100vh;
                background: #2C3E50;
                padding-top: 20px;
                color: white;
            }

            .sidebar h2 {
                text-align: center;
                margin-bottom: 30px;
            }

            .sidebar a {
                display: block;
                padding: 12px 20px;
                text-decoration: none;
                color: white;
                transition: 0.3s;
            }

            .sidebar a:hover {
                background: #34495E;
            }

            .main {
                flex: 1;
                padding: 20px;
                background: #ecf0f1;
            }

            .navbar {
                height: 60px;
                background: #2980B9;
                display: flex;
                align-items: center;
                justify-content: space-between;
                padding: 0 20px;
                color: white;
            }

            .content {
                margin-top: 20px;
            }
            
            
        </style>
    </head>
    <body>

        <%@ include file="includes/navbar.jsp" %>
        <%@ include file="includes/studentSidebar.jsp" %>
        <div class="content">
            <jsp:include page="${param.page != null ? param.page : 'studentHome.jsp'}" />
        </div>

        <%@ include file="includes/footer.jsp" %>

    </body>
</html>
