/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package in.mk.controller;

import in.mk.main.util.HibernateUtil;
import in.mk.model.Notification;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;
import org.hibernate.Transaction;

/**
 *
 * @author mkros
 */
@WebServlet(name = "SendNotification", urlPatterns = {"/notify"})
public class SendNotification extends HttpServlet {


   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String message = request.getParameter("message");
        
        if (message == null || message.trim().isEmpty()) {
            request.setAttribute("error", "Message cannot be empty");
            request.getRequestDispatcher("teacherDashboard.jsp?page=teacherNotification.jsp").forward(request, response);
            return;
        }
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        Notification notification = new Notification();
        notification.setMessage(message);
        
        try{    
            session.persist(notification);
            transaction.commit();
            
        }catch(Exception e){
            e.printStackTrace();
            transaction.rollback();
            
        }
        finally{
            session.close();
            response.sendRedirect("teacherDashboard.jsp?page=teacherNotification.jsp");

        }

    }

    
}
