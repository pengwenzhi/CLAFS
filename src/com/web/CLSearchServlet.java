package com.web;

import com.dao.SearchDao;
import com.model.Lost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/CLSearchServlet")
public class CLSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String sort=request.getParameter("sort");
        String start=request.getParameter("start");
        String end=request.getParameter("end");
        String address=request.getParameter("address");
        String key=request.getParameter("key");
        System.out.println(sort);
        System.out.println(start);
        System.out.println(end);
        System.out.println(address);
        System.out.println(key);
        SearchDao dao=new SearchDao();
        try {
            ArrayList<Lost> list=dao.searchLost(sort,start,end,address,key);
            request.setAttribute("searchlist",list);
            request.getRequestDispatcher("searchlostinfo.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
