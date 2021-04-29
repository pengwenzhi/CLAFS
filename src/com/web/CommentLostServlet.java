package com.web;

import com.dao.CommentDao;
import com.dao.LostDao;
import com.model.Comment;
import com.model.Lost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/CommentLostServlet")
public class CommentLostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int objectid = Integer.parseInt(request.getParameter("objectid"));
        System.out.println(objectid);
        Lost lost=new Lost();
        LostDao lostdao=new LostDao();
        try {
            lost=lostdao.findLostById(objectid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        HttpSession Session = request.getSession();
        String visitor = (String)Session.getAttribute("currentUser");
        System.out.println(visitor);
        String content=new String(request.getParameter("content").getBytes("ISO8859-1"),"UTF-8");
        System.out.println(content);
        Comment comment=new Comment(objectid,lost.getUsername(),visitor,content);
        CommentDao dao=new CommentDao();
        try {
            dao.insert(comment);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        String url = request.getHeader("REFERER");
        String refer=url.substring(url.indexOf(request.getContextPath()));
        response.sendRedirect(refer);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       doPost(request,response);
    }
}
