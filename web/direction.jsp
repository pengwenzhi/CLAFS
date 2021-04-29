<%@ page import="com.dao.RecordDao" %>
<%@ page import="com.model.Record" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 21:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Title</title>
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
            <div class="navbar-brand">
                ${sessionScope.currentUser}
            </div>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${sessionScope.currentRole.equals('普通用户')}">
                        <li><a href="userinfo.jsp">用户信息</a></li>
                        <li><a href="userlost.jsp">寻物记录</a></li>
                        <li><a href="userfound.jsp">拾物记录</a></li>
                        <li class="active"><a href="direction.jsp">物品去向</a></li>
                    </c:when>
                    <c:when test="${sessionScope.currentRole.equals('管理员')}">
                        <li><a href="userinfo.jsp">管理员信息</a></li>
                        <li><a href="userlost.jsp">寻物记录</a></li>
                        <li><a href="userfound.jsp">拾物记录</a></li>
                        <li  class="active"><a href="direction.jsp">物品去向</a></li>
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
    RecordDao recorddao=new RecordDao();
    ArrayList<Record> list=recorddao.findAllRecordByName(currentUser);
    System.out.println(list.size());
%>
<div class="container">
    <table class="table">
        <thead>
        <tr class="info">
            <th>编号</th>
            <th>用户名</th>
            <th>标题</th>
            <th>种类</th>
            <th>照片</th>
            <th>状态</th>
            <th>时间</th>
            <th>联系姓名</th>
            <th>联系方式</th>
            <th >联系地址</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(int i=0; i<list.size();i++){
        %>
        <tr class="success">
            <td><%=list.get(i).getObjectid()%></td>
            <td><%=list.get(i).getUsername()%></td>
            <td><%=list.get(i).getTitle()%></td>
            <td><%=list.get(i).getSort()%></td>
            <td ><img id="photo" src="upload/<%=list.get(i).getPhoto()%>"></td>
            <td><%=list.get(i).getState()%></td>
            <%
                Timestamp time = Timestamp.valueOf(list.get(i).getPubtime());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                String timeFormat = sdf.format(time);
            %>
            <td><%=timeFormat%></td>
            <td><%=list.get(i).getApplyname()%></td>
            <td><%=list.get(i).getApplytel()%></td>
            <td><%=list.get(i).getApplyaddress()%></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
