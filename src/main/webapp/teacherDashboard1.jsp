<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="in.mk.model.Teacher" %>
<%
    Teacher user = (Teacher) session.getAttribute("user");
    // You can uncomment this if you want to restrict access
    // if (user == null || !"teacher".equalsIgnoreCase(user.getRole())) {
    //     response.sendRedirect("login.jsp");
    //     return;
    // }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Teacher Dashboard</title>
    <style>
    body {
        margin: 0;
        font-family: 'Segoe UI', sans-serif;
        background-color: #f4f4f4;
    }

    .navbar {
        background-color: #6f6fff;
        padding: 1rem 2rem;
        color: white;
        font-size: 1.2rem;
        font-weight: bold;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    .sidebar {
        width: 220px;
        height: 100vh;
        background-color: #6f6fff;
        color: white;
        padding-top: 20px;
        position: fixed;
        top: 0;
        left: 0;
    }

    .sidebar a {
        display: block;
        color: white;
        padding: 14px 24px;
        text-decoration: none;
        border-radius: 8px;
        transition: background 0.3s ease;
    }

    .sidebar a:hover {
        background-color: #5544dd;
    }

    .main {
        margin-left: 220px;
        padding: 30px;
    }

    .content-box {
        background-color: white;
        padding: 30px;
        border-radius: 15px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.1);
    }
</style>

    
<%-- <style>
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
    </style> --%>
</head>
<body>

    <%@ include file="includes/navbar.jsp" %>

    <div class="sidebar">
        <%@ include file="includes/sidebar.jsp" %>
    </div>

    <div class="main">
        <jsp:include page="${param.page != null ? param.page : 'homeDashboard.jsp'}" />
    </div>

    <%@ include file="includes/footer.jsp" %>

</body>
</html>

