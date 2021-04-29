package com.web;

import com.dao.UserDao;
import com.model.User;
import com.util.C3p0Utils;
import com.util.StringUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;

@WebServlet(urlPatterns= "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        String role=new String(request.getParameter("role").getBytes("ISO8859-1"),"UTF-8");
        request.setAttribute("username", username);
        if(StringUtil.isEmpty(username)||StringUtil.isEmpty(password)){
            request.setAttribute("error", "用户名或密码为空！");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        User user=new User(username,password,role);
        Connection conn=null;
        try {
            conn = C3p0Utils.getConnection();
            User currentUser= UserDao.login(conn, user);
            if(currentUser==null){
                request.setAttribute("error", "用户名、或密码或用户类型错误！");
                // 服务器跳转
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }else{
                //获取session
                HttpSession session=request.getSession();
                session.setAttribute("currentUser", username);
                session.setAttribute("currentRole",role);
                // 客户端跳转
                response.sendRedirect("main.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            try {
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          doPost(request,response);
    }
}
