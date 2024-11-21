package com.tech.blog.servlet;

import com.tech.blog.dao.LikeDao;
import com.tech.blog.helper.ConnectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author manik
 */
public class LikeServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String operation = request.getParameter("operation");
            int uid = Integer.parseInt(request.getParameter("uid"));
            int pid = Integer.parseInt(request.getParameter("pid"));

            LikeDao ldao = new LikeDao(ConnectionProvider.getConnection());
            if (operation.equals("like")) {

//                boolean f = ldao.insertLike(pid,uid);
//                out.println(f);
                boolean chechUserIsAleadyLiked = ldao.isLikedByUser(pid, uid);
                if (chechUserIsAleadyLiked == true) {
                    boolean likeDeleted = ldao.deleteLike(pid, uid);
                    out.println(likeDeleted+"_delete");
                } else {
                    boolean likeInserted = ldao.insertLike(pid, uid);
                    out.println(likeInserted+"_insert");
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
