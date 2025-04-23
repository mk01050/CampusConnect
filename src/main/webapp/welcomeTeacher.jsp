<%-- 
    Document   : welcomeTeacher
    Created on : Apr 21, 2025, 6:28:27 PM
    Author     : mkros
--%>

<%@page import="in.mk.model.Teacher"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    Teacher user = (Teacher) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Teacher's Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <h2>Welcome, <%= user.getName() %>!</h2>
         <h2>Welcome, <%= user.getEmail() %>!</h2>
         <h2>Welcome, <%= user.getRole() %>!</h2>
        <a href="logout">Logout</a>
    </body>
</html>
