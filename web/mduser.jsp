<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 16:11
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
            left:46%;
        }
    </style>
</head>
<body>
        <%
            String privateuser=request.getParameter("privateuser");
            User user=new User();
            UserDao dao=new UserDao();
            user=dao.findUserByName(privateuser);
        %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="manageuser.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></div>
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
        <label class="col-sm-5 control-label">密码</label>
        <div class="col-sm-3">
            <input name="password" type="text" class="form-control" value="<%=user.getPassword()%>">
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
        <div class="col-sm-2">
            <select name="role" class="form-control " >
                <option value="普通用户">普通用户</option>
                <option value="管理员">管理员</option>
            </select>
        </div>
    </div>
    <p align="center"><button id="commit" type="submit" class="btn btn-default btn-md">保存信息</button></p>
</form>

</body>
</html>

