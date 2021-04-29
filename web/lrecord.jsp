<%@ page import="com.model.Lost" %>
<%@ page import="com.dao.LostDao" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 20:36
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
            left:45%;
        }
        #objectid{
            text-align:center;
            width:120px;
            border:none;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:history.back(-1)">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-file" aria-hidden="true"></span></div>
    </div>
</nav>
<%
    Lost lost=new Lost();
    LostDao lostdao=new LostDao();
    int id=Integer.valueOf(request.getParameter("id")).intValue();
    lost=lostdao.findLostById(id);
%>
<div class="container">
    <div class="jumbotron">
        <form action="/LRServlet" method="post" id="myform" class="form-horizontal" role="form">
        <p align="center"><b>请确认是否找回编号为</b> <font color="red"><input type="text" id="objectid" name="objectid" value="<%=lost.getId()%>" readonly="readonly"/></font> <b>的失物</b></p>
        <p align="center"><b>如是,认真填写拾主的信息</b></p>
            <div class="form-group">
                <label class="col-sm-5 control-label">拾主姓名</label>
                <div class="col-sm-3">
                    <input name="applyname" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 control-label">拾主电话</label>
                <div class="col-sm-3">
                    <input name="applytel" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 control-label">拾主地址</label>
                <div class="col-sm-3">
                    <input name="applyaddress" type="address" class="form-control">
                </div>
            </div>
            <div class="form-group">

                   <p align="center"><button id="commit" type="submit" class="btn btn-default btn-md">确认提交</button></p>

            </div>
        </form>
    </div>
</div>
</body>
</html>

