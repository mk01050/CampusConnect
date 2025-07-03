<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="in.mk.model.Teacher" %>
<%
    Teacher user = (Teacher) session.getAttribute("user");
    // Uncomment this for access control
    // if (user == null || !"teacher".equalsIgnoreCase(user.getRole())) {
    //     response.sendRedirect("login.jsp");
    //     return;
    // }
%>
<html>
<head>
    <title>Teacher Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            color: #333;
        }
        .navbar {
            height: 64px;
            background: linear-gradient(90deg, #6f6fff, #6dd5ed);
            padding: 0 2rem;
            color: white;
            font-size: 1.3rem;
            font-weight: 600;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
        }
        .main {
            margin-left: 200px;
            padding: 100px 40px 40px 40px;
            background-color: #f0f2f5;
            min-height: 100vh;
        }
        .content-box {
            background-color: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.06);
            transition: transform 0.2s ease;
        }
        .content-box:hover {
           
            transform: translate(-3px,-3px);
        }
     </style>
</head>
<body>

    <%@ include file="includes/teacherNavbar.jsp" %>
    <%@ include file="includes/teacherSidebar.jsp" %>

    <div class="main">
        <div class="content-box">
            <jsp:include page="${param.page != null ? param.page : 'teacherHome.jsp'}" />
        </div>
    </div>

    

</body>
</html>