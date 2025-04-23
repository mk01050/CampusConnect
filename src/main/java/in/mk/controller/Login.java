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
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;
import java.util.Optional;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

/**
 *
 * @author mkros
 */
@WebServlet(name = "Login", urlPatterns = {"/login"})
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        PrintWriter out = response.getWriter();
        response.setContentType("text/html;charset=UTF-8");

        Session session = HibernateUtil.getSessionFactory().openSession();

        try {
            Transaction transaction = session.beginTransaction();

            Optional<Teacher> check1 = session.createQuery("FROM Teacher WHERE email = :email AND password = :password", Teacher.class).setParameter("email", email).setParameter("password", password).uniqueResultOptional();
            Teacher query = null;

            if (check1.isPresent()) {
                query = check1.get();
            }

//            System.out.println(query.getRole());
            if (query != null) {
                // store user in session
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("user", query);
                System.out.println(query.getName());

                response.sendRedirect("teacherDashboard.jsp");
                return;
            }

            Optional<Student> check2 = session.createQuery("FROM Student WHERE email = :email AND password = :password", Student.class).setParameter("email", email).setParameter("password", password).uniqueResultOptional();

            Student stud = null;
            if (check2.isPresent()) {
                stud = check2.get();
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("user", stud);
                System.out.println("STUDENT SUCCESS");
                response.sendRedirect("studentDashboard.jsp");
                return;
            } else {
                request.setAttribute("error", "Invalid credentials. Try again.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.include(request, response);
                return;
            }

        } catch (IOException e) {
            System.out.println("EXCEPTION");
            System.out.println("EXCEPTION");
            e.printStackTrace();
//            response.sendRedirect("login.jsp?error=Something went wrong");
        }

    }
}
