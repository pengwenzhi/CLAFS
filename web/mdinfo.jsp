<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDao" %>
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
    </style>
</head>
<body>
<%
    HttpSession Session = request.getSession();
    String currentUser = (String)Session.getAttribute("currentUser");
    User user=new User();
    UserDao dao=new UserDao();
        user=dao.findUserByName(currentUser);
%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="userinfo.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
    </div>
</nav>
<form  action="#" method="post" id="myform" class="form-horizontal" role="form">
    <div class="form-group">
        <label class="col-sm-5 control-label">用户名</label>
        <div class="col-sm-3">
            <input name="username" type="text" class="form-control" value="<%=user.getUsername()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">姓名</label>
        <div class="col-sm-3">
            <input name="realname" type="text" class="form-control" value="<%=user.getRealname()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">性别</label>
        <div class="col-sm-3">
            <input name="gender" type="text" class="form-control" value="<%=user.getGender()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">邮箱</label>
        <div class="col-sm-3">
            <input name="email" type="email" class="form-control" value="<%=user.getEmail()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">QQ</label>
        <div class="col-sm-3">
            <input name="qq" type="text" class="form-control" value="<%=user.getQq()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">手机号码</label>
        <div class="col-sm-3">
            <input name="tel" type="tel" class="form-control" value="<%=user.getTel()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">居住地址</label>
        <div class="col-sm-3">
            <input name="address" type="address" class="form-control" value="<%=user.getAddress()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">用户类型</label>
        <div class="col-sm-3">
            <input name="role" type="text" class="form-control" value="<%=user.getRole()%>" readonly="readonly">
        </div>
    </div>
    <p align="center"><button id="commit" type="submit" class="btn btn-default btn-md">保存信息</button></p>
</form>
</body>
</html>
