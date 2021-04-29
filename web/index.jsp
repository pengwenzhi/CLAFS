<%@ page import="com.model.Found" %>
<%@ page import="com.model.Lost" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.dao.LostDao" %>
<%@ page import="com.dao.FoundDao" %>
<%@ page import="java.sql.Array" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/3/17
  Time: 16:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
  <head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>首页</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
      a{
        text-decoration:none;
      }
      .footer {
        position: absolute;
        bottom: 0;
        width: 100%;
        height: 60px; /* Set the fixed height of the footer here */
        background-color: #f5f5f5;
      }
      .footer > .container {
        padding-right: 15px;
        padding-left: 15px;
      }
      .container .text-muted {
        margin: 20px 0;
      }
    </style>
  </head>
  <body>
  <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
      <div class="navbar-header">
        <a href="index.jsp" class="navbar-brand">社区失物招领系统</a>
      </div>
      <div id="navbar" class="collapse navbar-collapse">
        <ul class="nav navbar-nav">
          <li class="active"><a href="index.jsp">首页</a></li>
          <li><a href="lostinfo.jsp">寻物</a></li>
          <li><a href="foundinfo.jsp">招领</a></li>
          <li><a href="fastpost.jsp">快速发布</a></li>
        </ul>

        <form method="post" action="/SSearchServlet" class="navbar-form navbar-left" role="search">
          <div class="form-group">
            <input name="key" type="text" class="form-control" placeholder="搜索">
          </div>
          <button type="submit" class="btn btn-default">搜索</button>
        </form>

        <c:choose>
          <c:when test="${sessionScope.currentUser!=null}">
            <ul class="nav navbar-nav navbar-right">
              <li>
                <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
              </li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  用户名：${sessionScope.currentUser}<span class="caret"></span>
                </a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="memberinfo.jsp">用户信息</a></li>
                  <li><a href="loginout.jsp">注销</a></li>
                </ul>
              </li>
            </ul>
          </c:when>
          <c:otherwise>
            <ul class="nav navbar-nav navbar-right">
              <li><a href="login.jsp"><span class="glyphicon glyphicon-log-in"></span> 登录</a></li>
              <li><a href="register.jsp"><span class="glyphicon glyphicon-user"></span> 注册</a></li>
            </ul>
          </c:otherwise>
        </c:choose>
      </div>
    </div>
  </nav>
<%
  LostDao lostdao=new LostDao();
  ArrayList<Lost> llist1=lostdao.findAllLost();
  ArrayList<Lost> llist2=lostdao.findAllLostweek();
  ArrayList<Lost> llist3=lostdao.findAllLosted();
  FoundDao founddao=new FoundDao();
  ArrayList<Found> flist1=founddao.findAllFound();
  ArrayList<Found> flist2=founddao.findAllFoundweek();
%>
  <div class="container">
    <div class="jumbotron">
      <h3>系统最新动态：</h3>
      <p></p>
      <p align="center">共<font color="red"><%=llist1.size()%></font>条寻物启事，近7天有<font color="red"><%=llist2.size()%></font>件遗失物品！</p>
      <p align="center">共<font color="red"><%=flist1.size()%></font>条招领启事，近7天有<font color="red"><%=flist2.size()%></font>件被捡物品！</p>
      <p align="center">共找回<font color="red"><%=llist3.size()%></font>件失物</p>
      <p></p>
      <p align="center"><a class="btn btn-info btn-lg" href="fastpost.jsp" role="button">快速发布</a></p>
    </div>
  </div>
  <footer class="footer">
    <div class="container">
      <p class="text-muted" align="center">以梦为马，建设国家</p>
    </div>
  </footer>
  <script src="jquery/jquery-3.4.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script>
    $("#mytab a").click(function(e){
      e.preventDefault();
      $(this).tab("show");
    })
  </script>
  </body>
</html>
