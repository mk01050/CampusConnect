/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package in.mk.controller;

import in.mk.main.util.HibernateUtil;
import in.mk.model.Assignment;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import org.hibernate.Session;

/**
 *
 * @author mkros
 */
@WebServlet(name = "StudentAssignmentView", urlPatterns = {"/viewAssignment"})
public class StudentAssignmentView extends HttpServlet {

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        Session session = HibernateUtil.getSessionFactory().openSession();
        List<Assignment> assignments = session.createQuery("FROM Assignment", Assignment.class).list();
        
        request.setAttribute("assignments", assignments);

        request.getRequestDispatcher("studentDashboard.jsp?page=studentAssignment.jsp").forward(request, response);


    }
    @Override
     protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException{
         doPost(request,response);
     }

    

}
