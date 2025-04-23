/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package in.mk.controller;


import in.mk.main.util.HibernateUtil;
import in.mk.model.Student;
import in.mk.model.Teacher;
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Map;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author mkros
 */
@WebServlet(name = "Register", urlPatterns = {"/register"})
public class Register extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        response.setContentType("text/html");
        
        

        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String role = request.getParameter("role");
        String name = request.getParameter("name");

        
        Session session = HibernateUtil.getSessionFactory().openSession();
        Transaction transaction = session.beginTransaction();

        if (role.equals("teacher")) {
            Teacher teacher = new Teacher();
            teacher.setEmail(email);
            teacher.setPassword(password);
            teacher.setName(name);
            teacher.setRole(role);
            try {
                session.save(teacher);
                transaction.commit();
                out.println("<h3 style='color:green'>Registered Successfully </h3>");

                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
            } catch (Exception e) {
                e.printStackTrace();
                transaction.rollback();
            }

        } else {
            Student student = new Student();
            student.setEmail(email);
            student.setPassword(password);
            student.setName(name);
            student.setEmail(email);
            try {
                session.save(student);
                transaction.commit();
                out.println("<h3 style='color:green'>Registered Successfully </h3>");

                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
            } catch (Exception e) {
                out.println("<h3 style='color:red'>Registered Failed due to some reason </h3>");

                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
                e.printStackTrace();
                transaction.rollback();
            }

        }

        
    }
}
