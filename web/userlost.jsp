<%@ page import="com.dao.LostDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.model.Lost" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/16
  Time: 18:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>失物管理</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #photo{
            position:relative;
            width:20px;
            height:30px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
        <div class="navbar-header">
            <a href="#" class="navbar-brand">${sessionScope.currentUser}</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${sessionScope.currentRole.equals('普通用户')}">
                        <li><a href="userinfo.jsp">用户信息</a></li>
                        <li  class="active"><a href="userlost.jsp">寻物记录</a></li>
                        <li><a href="userfound.jsp">拾物记录</a></li>
                        <li><a href="direction.jsp">物品去向</a></li>
                    </c:when>
                    <c:when test="${sessionScope.currentRole.equals('管理员')}">
                        <li><a href="userinfo.jsp">管理员信息</a></li>
                        <li class="active"><a href="userlost.jsp">寻物记录</a></li>
                        <li><a href="userfound.jsp">拾物记录</a></li>
                        <li><a href="direction.jsp">物品去向</a></li>
                    </c:when>
                </c:choose>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a class="navbar-brand" href="main.jsp">返回</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
  <%
       HttpSession Session = request.getSession();
       String currentUser = (String)Session.getAttribute("currentUser");
       LostDao lostdao=new LostDao();
      ArrayList<Lost> list=lostdao.findAllLostByName(currentUser);
      System.out.println(list.size());
  %>
<div class="container">
    <table class="table">
        <thead>
        <tr class="info">
            <th >失物编码</th>
            <th >标题</th>
            <th >失物类别</th>
            <th >丢失时间</th>
            <th >丢失地点</th>
            <th >物品图片</th>
            <th >详细信息</th>
            <th>物品状态</th>
            <th>找回</th>
            <th>查看</th>
            <th >修改</th>
            <th >删除</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(int i=0; i<list.size();i++){
        %>
        <tr class="success">
            <td><%=list.get(i).getId()%></td>
            <td><%=list.get(i).getTitle()%></td>
            <td><%=list.get(i).getSort()%></td>
            <%
                Timestamp time = Timestamp.valueOf(list.get(i).getLostday());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String timeFormat = sdf.format(time);
            %>
            <td><%=timeFormat%></td>
            <td><%=list.get(i).getAddress()%></td>
            <td ><img id="photo" src="upload/<%=list.get(i).getPhoto()%>"></td>
            <td><%=list.get(i).getDetail()%></td>
            <td><%=list.get(i).getState()%></td>
            <td ><a href="lrecord.jsp?id=<%=list.get(i).getId()%>"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a></td>
            <td ><a href="onelostinfo.jsp?id=<%=list.get(i).getId()%>"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></td>
            <td ><a href="mdlost.jsp?id=<%=list.get(i).getId()%>"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>
            <td ><a href="#"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
