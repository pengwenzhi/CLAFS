<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.dao.FoundDao" %>
<%@ page import="com.model.Found" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.LostDao" %>
<%@ page import="com.model.Lost" %>
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
        #mi{
            width:120px;
            position:relative;
            left:55px;
        }
        a{
            text-decoration : none;
        }
        a:hover{
            text-decoration: none;
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
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></div>
    </div>
</nav>
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
        <label class="col-sm-5 control-label">密码</label>
        <div class="col-sm-3">
            <input name="password" type="text" class="form-control" value="<%=user.getPassword()%>" readonly="readonly">
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
        <label class="col-sm-5 control-label">失物记录</label>
        <div class="col-sm-2">
            <%
                LostDao lostdao=new LostDao();
                ArrayList<Lost> listl=lostdao.findAllLostByName(user.getUsername());
            %>
            <a href="searchlost.jsp?privateuser=<%=user.getUsername()%>"><input style="text-align: center" type="button" class="form-control" data-toggle="tooltip" data-placement="top" title="点击查看" value="<%=listl.size()%>" readonly="readonly"></a>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">拾物记录</label>
        <div class="col-sm-2">
            <%
                FoundDao founddao=new FoundDao();
                ArrayList<Found> listf=founddao.findAllFoundByName(user.getUsername());
            %>
            <a href="searchfound.jsp?privateuser=<%=user.getUsername()%>"><input style="text-align: center" type="button" class="form-control" data-toggle="tooltip" data-placement="top" title="点击查看" value="<%=listf.size()%>" readonly="readonly"></a>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-7">
            <a href="mduser.jsp?privateuser=<%=user.getUsername()%>"><button id="mi" type="button" class="btn btn-default btn-md">修改信息</button></a>
        </div>
    </div>
</form>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $(function () {
        $('[data-toggle="tooltip"]').tooltip()
    })
</script>
</body>
</html>
