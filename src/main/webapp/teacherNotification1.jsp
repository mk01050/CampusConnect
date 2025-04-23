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
    <style type="text/css">
        body {
            font-family: 'Segoe UI', sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }

        h2, h3 {
            text-align: center;
            color: #333;
        }

        form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
            max-width: 500px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        textarea {
            width: 100%;
            padding: 10px;
            border-radius: 10px;
            border: 1px solid #6f6fff;
            resize: vertical;
            font-size: 1rem;
            outline: none;
        }

        input[type="submit"] {
            padding: 12px 20px;
            background-color: #6f6fff;
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #5544dd;
        }

        .notification-list {
            max-width: 600px;
            margin: 30px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.05);
        }

        .notification-list p {
            margin: 10px 0;
            line-height: 1.6;
        }

        .notification-list strong {
            color: #333;
        }
    </style>
</head>
<body>

    <h2>Send Notification to All Students</h2>

    <form action="notify" method="post">
        <textarea name="message" rows="5" placeholder="Type your message here..." required></textarea>
        <input type="submit" value="Send Notification">
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
                        <p><strong><%= note.getCreatedAt() %>:</strong> <%= note.getMessage() %></p>
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
                if (hsession != null) hsession.close();
            }
        %>
    </div>

</body>
</html>
