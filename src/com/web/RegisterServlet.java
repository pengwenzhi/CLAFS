package com.web;

import com.dao.UserDao;
import com.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String username=request.getParameter("username");
        String realname=request.getParameter("realname");
        String password=request.getParameter("password");
        String gender=request.getParameter("gender");
        String email=request.getParameter("email");
        String qq=request.getParameter("qq");
        String tel=request.getParameter("tel");
        String address=request.getParameter("address");
        String role=request.getParameter("role");
        User user=new User(username,realname,password,gender,email,qq,tel,address,role);
        UserDao dao=new UserDao();
        try {
            dao.insert(user);
            HttpSession session=request.getSession();
            session.setAttribute("username",username);
            request.getRequestDispatcher("/translogin.jsp").forward(request,response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
           doPost(request,response);
    }
}
