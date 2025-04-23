<%-- 
    Document   : teacherHome
    Created on : Apr 23, 2025, 12:42:55 AM
    Author     : mkros
--%>

<%@page import="in.mk.model.Student"%>
<%@page import="in.mk.model.User"%>
<%@page import="in.mk.model.Teacher"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%
    Teacher user = (Teacher) session.getAttribute("user");
//    if (user == null || !"student".equalsIgnoreCase(user.getRole())) {
//        response.sendRedirect("login.jsp");
//        return;
//    }
    System.out.println(user.getName());
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
    <div class="main">
        <h3>Welcome, <%= user.getName() %>!</h3>
        <p>Select an option from the sidebar to manage your tasks.</p>
    </div>
    </body>
</html>
