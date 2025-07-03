<%-- 
    Document   : studentNotification
    Created on : Apr 23, 2025, 12:55:16 AM
    Author     : mkros
--%>


<%@page import="java.text.SimpleDateFormat"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, org.hibernate.*, in.mk.main.util.HibernateUtil, in.mk.model.Notification" %>
<!DOCTYPE html>
<html>
<head>
    <style>
     .notification-card {
      margin-bottom: 15px;
      padding: 12px;
      border: 1px solid #ccc;
      border-radius: 8px;
      background-color: #fff;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
     }   

     .notification-card p {
      font-size: 1rem;
      color: #333;
      line-height: 1.5;
     }

    </style>
    <title>Notifications</title>
</head>
<body>
   
         
    <h2>Notifications</h2>

    <%
        Session hsession = HibernateUtil.getSessionFactory().openSession();
        List<Notification> notifications = hsession.createQuery("FROM Notification ORDER BY createdAt DESC", Notification.class).list();
        for(Notification note : notifications) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd MMM yyyy, hh:mm a"); // or "dd/MM/yyyy HH:mm"
    String formattedDateTime = sdf.format(note.getCreatedAt());
    %>
            <div class="notification-card">
            <p><strong><%= formattedDateTime %>:</strong> <%= note.getMessage() %></p>
        </div>
    <%
        }
        hsession.close();
    %>
    
    
</body>
</html>
