<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/16
  Time: 20:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注销成功</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #layout {
            position: relative;
            top: 150px;
            left:47%;
        }
        .form-group{
            position:relative;
            top:200px;
            left:43%;
        }
    </style>
</head>
<body>
<% session.invalidate();%>
<h2 id="layout";align="center"><font color="red">注销成功!</font></h2>
<div class="form-group">
    <div class="col-sm-3">
        <a href="index.jsp"><button id="commit" type="submit" class="btn btn-default btn-md">返回首页</button></a>
        &nbsp;&nbsp;&nbsp;&nbsp;
        <a href="login.jsp"><button id="mp" type="button" class="btn btn-default btn-md">用户登录</button></a>
    </div>
</div>
</body>
</html>
