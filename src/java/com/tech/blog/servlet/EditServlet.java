package com.tech.blog.servlet;

import com.tech.blog.dao.UserDao;
import com.tech.blog.entities.Message;
import com.tech.blog.entities.User;
import com.tech.blog.helper.ConnectionProvider;
import com.tech.blog.helper.Helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author manik
 */
@MultipartConfig
public class EditServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");
            out.println("</head>");
            out.println("<body>");

//            fatch all the data from profile page
            String userEmail = request.getParameter("user_email");
            String userName = request.getParameter("user_name");
            String userPassword = request.getParameter("user_password");
            String userAbout = request.getParameter("user_about");
            Part part = request.getPart("user_profile_pick");
            String imageName = part.getSubmittedFileName();

            //getting the datas from the exising session
            HttpSession session = request.getSession();
            User user = (User) session.getAttribute("currentUser");
            user.setEmail(userEmail);
            user.setName(userName);
            user.setPassword(userPassword);
            user.setAbout(userAbout);

            String oldUserProfile = user.getProfile(); //getting the old file of the user;
            user.setProfile(imageName);

            //updating the database
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            boolean ans = userDao.updateUser(user);

            if (ans) {

                String path = request.getRealPath("/") + "picks" + File.separator + user.getProfile();

//                delete old profile datas
                String oldPath = request.getRealPath("/") + "picks" + File.separator +oldUserProfile;
               
                if(!oldPath.equals("default.png")){
                   Helper.deleteFile(oldPath); 
                }
                
                if (Helper.saveFile(part.getInputStream(), path)) {
                    out.println("Profile updated!");

                    Message msg = new Message("Profile detail updated..!", "success", "alert-success");
                    session.setAttribute("msg", msg);   //giving the session to object of message class
                } else {
                    out.println("File not save successfully..");
                    Message msg = new Message("Somthing went wrong..!", "error", "alert-danger");
                    session.setAttribute("msg", msg);   //giving the session to object of message class
                }

            } else {
                out.println("updated to db succefully!");

                Message msg = new Message("Somthing went wrong..!", "error", "alert-danger");
                session.setAttribute("msg", msg);   //giving the session to object of message class
            }

            response.sendRedirect("profile.jsp");
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
