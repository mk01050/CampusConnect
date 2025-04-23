<%-- 
    Document   : role-handler
    Created on : Apr 21, 2025, 7:44:23 PM
    Author     : mkros
--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String role = request.getParameter("role");

    if ("teacher".equals(role)) {
        response.sendRedirect("register-teacher.jsp");
    } else if ("student".equals(role)) {
        response.sendRedirect("register-student.jsp");
    } else {
        out.println("Invalid role selected.");
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
