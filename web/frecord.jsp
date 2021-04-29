<%@ page import="com.model.Found" %>
<%@ page import="com.dao.FoundDao" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 20:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    Found found=new Found();
    FoundDao founddao=new FoundDao();
    int id=Integer.valueOf(request.getParameter("id")).intValue();
    found=founddao.findFoundById(id);
%>
<div class="container">
    <div class="jumbotron">
        <form action="/FRServlet" method="post" id="myform" class="form-horizontal" role="form">
        <p align="center"><b>请确认是归还回编号为</b> <font color="red"><input type="text" id="objectid" name="objectid" value="<%=found.getId()%>" readonly="readonly"/></font> <b>的拾物</b></p>
        <p align="center"><b>如是,认真填写失主的信息</b></p>
            <div class="form-group">
                <label class="col-sm-5 control-label">失主姓名</label>
                <div class="col-sm-3">
                    <input name="applyname" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 control-label">失主电话</label>
                <div class="col-sm-3">
                    <input name="applytel" type="text" class="form-control">
                </div>
            </div>
            <div class="form-group">
                <label class="col-sm-5 control-label">失主地址</label>
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

