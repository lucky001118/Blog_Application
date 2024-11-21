/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author manik
 */
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Login</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Login at " + request.getContextPath() + "</h1>");
            
            //login
            //fatching user-name and password from the user
            String userName = request.getParameter("user_email");
            String userPassword = request.getParameter("user_password");
            
            UserDao dao = new UserDao(ConnectionProvider.getConnection());
            
            User u = dao.getUserByEmailAndPassword(userName, userPassword);
            
            if(u==null){
                //login errror
                
                //setting the error massage to the error class wich carry some values..
                Message msg = new Message("invailid Details! try with another","error","alert-danger");
                //redirecting the page into login page
                //response.sendRedirect("login_page.jsp");
                
                HttpSession session = request.getSession();
                session.setAttribute("msg",msg);   //giving the session to object of message class
                response.sendRedirect("login_page.jsp");
            }else{
                //login succuss
                
                HttpSession session = request.getSession();
                session.setAttribute("currentUser", u);
                response.sendRedirect("profile.jsp");
            }
            
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
