<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>快速发布</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        .notice{
            position:relative;
            top:10px;
            left:60px;
            color:red;
        }
        .container{
            position:relative;
            top:85px;
            left:22%;
        }
        #icon{
            position:relative;
            left:45%;
        }
        .information{
            position:absolute;
            left:65px;
            top:430px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="main.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-send" aria-hidden="true"></span></div>
    </div>
</nav>
<div class="notice">
    请选择发布启事类别，并阅读下方须知：
</div>
<div class="container">
    <img src="image/xuan.png" class="col-lg-2">
    <a href="lost.jsp">
        <img src="image/xun.png" class="col-lg-2">
    </a>
    <a href="found.jsp">
        <img src="image/zhao.png" class="col-lg-2">
    </a>
</div>
<div class="information">
    <b>
        1、无论您是拾者还是失主，请务必认真填写，所有信息需要审核后方可显示！<br>
        2、信息的真实性与合法性由信息提供者负责，请谨慎审核，理性抉择，避免给您或他人造成不必要的损失。
    </b>
</div>
</body>
</html>
