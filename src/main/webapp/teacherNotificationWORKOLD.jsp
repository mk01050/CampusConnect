<%-- 
    Document   : teacherNotification
    Created on : Apr 23, 2025, 12:14:08 AM
    Author     : mkros
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.*, org.hibernate.*, in.mk.main.util.HibernateUtil, in.mk.model.Notification" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notification</title>
    </head>
    <body>
       <h2>Send Notification to All Students</h2>
    <form action="notify" method="post">
        <textarea name="message" rows="5" cols="50" placeholder="Type your message here..."></textarea><br><br>
        <input type="submit" value="Send Notification">
    </form>

    <hr>
    <h3>Previous Notifications</h3>
     <%
        Session hsession = HibernateUtil.getSessionFactory().openSession();
        List<Notification> notifications = hsession.createQuery("FROM Notification ORDER BY createdAt DESC", Notification.class).list();
        for(Notification note : notifications) {
    %>
        <p><strong><%= note.getCreatedAt() %>:</strong> <%= note.getMessage() %></p>
    <%
        }
        hsession.close();
    %>
    </body>
</html>
