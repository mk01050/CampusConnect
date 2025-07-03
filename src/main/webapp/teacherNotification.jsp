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
        <meta charset="UTF-8">
        <title>Notification</title>
        <style>
            /* General form styling */
            .form-group {
                margin-bottom: 15px;
            }

            .form-group textarea {
                width: 100%;
                padding: 10px;
                border-radius: 8px;
                border: 1px solid #ddd;
                font-size: 1rem;
                margin-top: 5px;
                font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            }

            .form-group input[type="submit"] {
                background-color: #5b6ef5;
                color: white;
                padding: 12px 24px;
                border: none;
                border-radius: 8px;
                cursor: pointer;
                font-size: 1rem;
            }

            .form-group input[type="submit"]:hover {
                background-color: #6f6fff;
            }

            /* Styling for previous notifications */
            .notification-item {
                margin-bottom: 15px;
                padding: 10px;
                border: 1px solid #ddd;
                background-color: #f9f9f9;
                border-radius: 8px;
                font-size: 1rem;
            }

            .notification-item p {
                margin: 0;
            }

        </style>
    </head>
    <body>

        <h2>Send Notification to All Students</h2>

        <form action="notify" method="post">
            <div class="form-group">
                <textarea name="message" rows="5" placeholder="Type your message here..." required></textarea>
            </div>
            <div class="form-group">
                <input type="submit" value="Send Notification" />
            </div>        
        </form>

        <div class="notification-list">
            <h3>Previous Notifications</h3>
            <%
                Session hsession = null;
                try {
                    hsession = HibernateUtil.getSessionFactory().openSession();
                    List<Notification> notifications = hsession.createQuery("FROM Notification ORDER BY createdAt DESC", Notification.class).list();

                    if (notifications != null && !notifications.isEmpty()) {
                        for (Notification note : notifications) {
            %>
            <p><strong><%= note.getCreatedAt()%>:</strong> <%= note.getMessage()%></p>
            <%
                }
            } else {
            %>
            <p>No notifications found.</p>
            <%
                }
            } catch (Exception e) {
                e.printStackTrace();
            %>
            <p style="color:red;">Error fetching notifications.</p>
            <%
                } finally {
                    if (hsession != null) {
                        hsession.close();
                    }
                }
            %>
        </div>

    </body>
</html>
