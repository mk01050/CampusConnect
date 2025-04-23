<%-- 
    Document   : studentNotification
    Created on : Apr 23, 2025, 12:55:16 AM
    Author     : mkros
--%>


<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, org.hibernate.*, in.mk.main.util.HibernateUtil, in.mk.model.Notification" %>
<!DOCTYPE html>
<html>
<head>
    <title>Notifications</title>
</head>
<body>

    <h2>Notifications</h2>

    <%
        Session hsession = HibernateUtil.getSessionFactory().openSession();
        List<Notification> notifications = hsession.createQuery("FROM Notification ORDER BY createdAt DESC", Notification.class).list();
        for(Notification note : notifications) {
    %>
        <div style="margin-bottom: 10px; padding: 10px; border: 1px solid #ccc;">
            <p><strong><%= note.getCreatedAt() %>:</strong> <%= note.getMessage() %></p>
        </div>
    <%
        }
        hsession.close();
    %>

</body>
</html>
