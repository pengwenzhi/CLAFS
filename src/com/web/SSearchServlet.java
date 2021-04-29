package com.web;

import com.dao.SearchDao;
import com.model.Found;
import com.model.Lost;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

@WebServlet(urlPatterns = "/SSearchServlet")
public class SSearchServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        request.setCharacterEncoding("utf-8");
        String key=request.getParameter("key");
        System.out.println(key);
        SearchDao dao=new SearchDao();
        try {
            ArrayList<Lost> llist=dao.ssearchLost(key);
            ArrayList<Found> flist=dao.ssearchFound(key);
            request.setAttribute("lsearchlist",llist);
            request.setAttribute("fsearchlist",flist);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        request.getRequestDispatcher("simplesearch.jsp").forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
