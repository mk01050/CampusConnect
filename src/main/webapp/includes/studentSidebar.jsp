<%-- 
    Document   : sidebar
    Created on : Apr 23, 2025, 12:32:38 AM
    Author     : mkros
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <style>
          .sidebar {
              width: 240px;
              height: calc(100vh - 64px);
              background: #f7f9fc;
              color: #333;
              padding-top: 20px;
              position: fixed;
              top: 64px;
              left: 0;
              border-right: 1px solid #ddd;
              box-shadow: 2px 0 8px rgba(0, 0, 0, 0.04);
          }
      
          .sidebar a {
              display: block;
              color: #444;
              padding: 24px 24px;
              text-decoration: none;
              border-radius: 0 20px 20px 0;
              transition: all 0.3s ease;
              font-weight: 500;
          }
      
          .sidebar a:hover,
          .sidebar a.active {
              background-color: #ddeeff;
              color: #0077c2;
              padding-left: 28px;
          }
        </style>
        <title>JSP Page</title>
    </head>
    <body>
       <div class="sidebar">
        <a href="studentDashboard.jsp">Home</a>
        <a href="viewAssignment">Assignments</a>
        <a href="teacherResult.jsp">Results</a>
        <a href="studentDashboard.jsp?page=studentNotification.jsp">Notifications</a>
        <a href="teacherAttendance.jsp">Attendance</a>
        <a href="logout">Logout</a>
    </div>
    </body>
</html>
