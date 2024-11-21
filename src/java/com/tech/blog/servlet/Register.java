package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 *
 * @author manik
 */
@MultipartConfig
public class Register extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            //fatch all the data frome the registration form
            String check=request.getParameter("check");
            if(check==null){
                
                //if check box is not checked
                out.println("Box not checked, Please check the check-box");
                
            }else{
                
                try {
                    Thread.sleep(2000);
                } catch (InterruptedException ex) {
                    Logger.getLogger(Register.class.getName()).log(Level.SEVERE, null, ex);
                }
                
               //if check box is checked then insert get all the data from the signup form
               String name = request.getParameter("user_name");
               String email = request.getParameter("user_email");
               String password = request.getParameter("user_password");
               String gender = request.getParameter("gender");
               String about = request.getParameter("about");
               
               //create user object and set all data to that object..
               User user = new User(name,email,password,gender,about);
               
               //creating a user dao object..
               UserDao dao =new UserDao(ConnectionProvider.getConnection());
               if(dao.saveUser(user)){
                    out.println("done");
               }else{
                   out.println("error");
               }
               
            }

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
