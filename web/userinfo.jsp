<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/27
  Time: 20:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
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
                                <li class="active"><a href="userinfo.jsp">用户信息</a></li>
                                <li><a href="userlost.jsp">寻物记录</a></li>
                                <li><a href="userfound.jsp">拾物记录</a></li>
                                <li><a href="direction.jsp">物品去向</a></li>
                            </c:when>
                            <c:when test="${sessionScope.currentRole.equals('管理员')}">
                                <li class="active"><a href="userinfo.jsp">管理员信息</a></li>
                                <li><a href="userlost.jsp">寻物记录</a></li>
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
        User user=new User();
        UserDao dao=new UserDao();
        user=dao.findUserByName(currentUser);
    %>
<form  action="#" method="post" id="myform" class="form-horizontal" role="form">
    <div class="form-group">
        <label class="col-sm-5 control-label">用户名</label>
        <div class="col-sm-3">
            <input name="username" type="text" class="form-control" value="<%=user.getUsername()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">姓名</label>
        <div class="col-sm-3">
            <input name="realname" type="text" class="form-control" value="<%=user.getRealname()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">性别</label>
        <div class="col-sm-3">
            <input name="gender" type="text" class="form-control" value="<%=user.getGender()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">邮箱</label>
        <div class="col-sm-3">
            <input name="email" type="email" class="form-control" value="<%=user.getEmail()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">QQ</label>
        <div class="col-sm-3">
            <input name="qq" type="text" class="form-control" value="<%=user.getQq()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">手机号码</label>
        <div class="col-sm-3">
            <input name="tel" type="tel" class="form-control" value="<%=user.getTel()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">居住地址</label>
        <div class="col-sm-3">
            <input name="address" type="address" class="form-control" value="<%=user.getAddress()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">用户类型</label>
        <div class="col-sm-3">
            <input name="role" type="text" class="form-control" value="<%=user.getRole()%>" readonly="readonly">
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-7">
            <a href="mdinfo.jsp"><button id="mi" type="button" class="btn btn-default btn-md">修改信息</button></a>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <a href="mdpswd.jsp"><button id="mp" type="button" class="btn btn-default btn-md">修改密码</button></a>
        </div>
    </div>
</form>
</body>
</html>
