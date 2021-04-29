package com.web;

import com.dao.LostDao;
import com.dao.RecordDao;
import com.model.Lost;
import com.model.Record;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/LRServlet")
public class LRServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("utf-8");
        Lost lost=new Lost();
        LostDao lostdao=new LostDao();
        int objectid=Integer.valueOf(request.getParameter("objectid")).intValue();
        System.out.println(objectid);
        String applyname=new String(request.getParameter("applyname").getBytes("ISO8859-1"),"UTF-8");
        System.out.println(applyname);
        String applytel=new String(request.getParameter("applytel").getBytes("ISO8859-1"),"UTF-8");
        System.out.println(applytel);
        String applyaddress=new String(request.getParameter("applyaddress").getBytes("ISO8859-1"),"UTF-8");
        System.out.println(applyaddress);
        try {
            lost=lostdao.findLostById(objectid);
            lostdao.updateState(objectid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        Record record=new Record(lost.getId(),lost.getUsername(),lost.getTitle(),lost.getSort(),lost.getPhoto(),lost.getState(),applyname,applytel,applyaddress);
        RecordDao dao=new RecordDao();
        try {
            dao.lrinsert(record);
            request.getRequestDispatcher("direction.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         doPost(request,response);
    }
}
