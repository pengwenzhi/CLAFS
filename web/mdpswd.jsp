<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/16
  Time: 18:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #icon{
            position:relative;
            left:48%;
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
            <a class="navbar-brand" href="userinfo.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></div>
    </div>
</nav>
<div id="layout">
    <form method="post" action="#" id="myform" class="form-horizontal" role="form">
        <div class="form-group">
            <label class="col-sm-5 control-label">原密码</label>
            <div class="col-sm-3">
                <input name="username" type="text" class="form-control" placeholder="请输原密码"">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">新密码</label>
            <div class="col-sm-3">
                <input name="password" type="password" class="form-control" placeholder="请输新入密码">
            </div>
        </div>
        <div class="form-group">
            <label class="col-sm-5 control-label">新密码</label>
            <div class="col-sm-3">
                <input name="cpassword" type="password" class="form-control" placeholder="请再次输入新密码">
            </div>
        </div>


        <div class="form-group has-error">
            <div class="col-sm-offset-5 col-sm-3 ">
                <b><font color="red">${error}</font></b>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-5 col-sm-3">
                <button id="commit" type="submit" class="btn btn-default btn-md">确定</button>
            </div>
        </div>
    </form>
</div>
</body>
</html>
