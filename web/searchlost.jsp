<%@ page import="com.dao.LostDao" %>
<%@ page import="com.model.Lost" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        #icon{
            position:relative;
            left:48%;
        }
    </style>
</head>
<body>
<%
    String privateuser=request.getParameter("privateuser");
    LostDao lostdao=new LostDao();
    ArrayList<Lost> list=lostdao.findAllLostByName(privateuser);
%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="usersearch.jsp?privateuser=<%=privateuser%>">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></div>
    </div>
</nav>
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
