<%-- 
    Document   : welcome
    Created on : Apr 21, 2025, 5:04:25 PM
    Author     : mkros
--%>

<%@page import="in.mk.model.Student"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true" %>
<%
    Student user = (Student) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome</title>
    </head>
    <body>
         <h2>Welcome, <%= user.getName() %>!</h2>
         <h2>Welcome, <%= user.getEmail() %>!</h2>
         <h2>Welcome, <%= user.getRole() %>!</h2>
    <a href="logout">Logout</a>
    </body>
</html>
