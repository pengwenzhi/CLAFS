package com.web;

import com.dao.SearchDao;
import com.model.Found;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/CFSearchServlet")
public class CFSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String sort=request.getParameter("sort");
        String start=request.getParameter("start");
        String end=request.getParameter("end");
        String address=request.getParameter("address");
        String key=request.getParameter("key");
        SearchDao dao=new SearchDao();
        try {
            ArrayList<Found> list=dao.searchFound(sort,start,end,address,key);
            request.setAttribute("searchlist",list);
            request.getRequestDispatcher("searchfoundinfo.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
