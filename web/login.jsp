<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/8
  Time: 20:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #icon{
            position:relative;
            left:46%;
        }
        #layout{
            position:relative;
            top:50px;
        }
        #commit{
            width:120px;
            position:relative;
            left:55px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="index.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-log-in" aria-hidden="true"></span></div>
    </div>
</nav>
<div id="layout">
    <form method="post" action="/LoginServlet" id="myform" class="form-horizontal" role="form">
        <div class="form-group has-error">
            <div class="col-sm-offset-5 col-sm-3 ">
                <b><font color="red">${message}</font></b>
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">用户名</label>
            <div class="col-sm-3">
                <input name="username" type="text" class="form-control" placeholder="请输入用户名" value="${sessionScope.username}">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">密码</label>
            <div class="col-sm-3">
                <input name="password" type="password" class="form-control" placeholder="请输入密码">
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-5 control-label">用户类型</label>
            <div class="col-sm-2">
                <select name="role" class="form-control " >
                    <option value="普通用户">普通用户</option>
                    <option value="管理员">管理员</option>
                </select>
            </div>
        </div>

        <div class="form-group has-error">
            <div class="col-sm-offset-5 col-sm-3 ">
                <b><font color="red">${error}</font></b>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-3">
                <button id="commit" type="submit" class="btn btn-default btn-md">登录</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
