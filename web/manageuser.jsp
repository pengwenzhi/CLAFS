<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.User" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="com.dao.FoundDao" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #icon{
            position:relative;
            left:43%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand">用户信息</div>
    </div>
</nav>
<%
    UserDao userdao=new UserDao();
    ArrayList<User> list=userdao.findAllUser();
    System.out.println(list.size());
%>
<div class="container">
    <table class="table">
        <thead>
        <tr class="info">
            <th>用户名</th>
            <th>姓名</th>
            <th>性别</th>
            <th>邮箱</th>
            <th>qq</th>
            <th>电话</th>
            <th>地址</th>
            <th>角色</th>
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
            <td><%=list.get(i).getUsername()%></td>
            <td><%=list.get(i).getRealname()%></td>
            <td><%=list.get(i).getGender()%></td>
            <td><%=list.get(i).getEmail()%></td>
            <td><%=list.get(i).getQq()%></td>
            <td><%=list.get(i).getTel()%></td>
            <td><%=list.get(i).getAddress()%></td>
            <td><%=list.get(i).getRole()%></td>
            <td ><a href="usersearch.jsp?privateuser=<%=list.get(i).getUsername()%>"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></td>
            <td ><a href="mduser.jsp?privateuser=<%=list.get(i).getUsername()%>"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>
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
