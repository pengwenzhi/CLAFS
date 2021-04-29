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
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
    </div>
</nav>
<form  action="/RegisterServlet" method="post" id="myform" class="form-horizontal" role="form">
    <div class="form-group">
        <label class="col-sm-5 control-label">用户名</label>
        <div class="col-sm-3">
            <input name="username" type="text" class="form-control" placeholder="请输入用户名">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">姓名</label>
        <div class="col-sm-3">
            <input name="realname" type="text" class="form-control" placeholder="请输入姓名">
        </div>
    </div>

    <div class="form-group">
        <label class="col-sm-5 control-label">密码</label>
        <div class="col-sm-3">
            <input name="password" type="password" class="form-control" placeholder="请输入密码">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">确认密码</label>
        <div class="col-sm-3">
            <input name="cpassword" type="password" class="form-control" placeholder="请输入密码">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">性别</label>
        <div class="col-sm-3">
            <label class="radio-inline">
                <input  name="gender"  type="radio" value="男"> 男
            </label>
            <label class="radio-inline">
                <input name="gender" type="radio" value="女"> 女
            </label>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">邮箱</label>
        <div class="col-sm-3">
            <input name="email" type="email" class="form-control" placeholder="请输入邮箱">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">QQ</label>
        <div class="col-sm-3">
            <input name="qq" type="text" class="form-control" placeholder="请输入QQ号">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">手机号码</label>
        <div class="col-sm-3">
            <input name="tel" type="tel" class="form-control" placeholder="请输入手机号码">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">居住地址</label>
        <div class="col-sm-3">
            <input name="address" type="address" class="form-control" placeholder="请输居住地址">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">用户类型</label>
        <div class="col-sm-3">
            <input name="role" type="text" class="form-control" value="普通用户" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-3">
            <button id="commit" type="submit" class="btn btn-default btn-md">注册</button>
        </div>
    </div>
</form>
</body>
</html>
