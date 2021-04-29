<%@ page import="com.dao.LostDao" %>
<%@ page import="com.model.Lost" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.dao.FoundDao" %>
<%@ page import="com.model.Found" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
</head>
<body>
<%
    LostDao lostdao=new LostDao();
    ArrayList<Lost> llist1=lostdao.findAllLost();
    ArrayList<Lost> llist2=lostdao.findAllLostweek();
    ArrayList<Lost> llist3=lostdao.findAllLosted();
    FoundDao founddao=new FoundDao();
    ArrayList<Found> flist1=founddao.findAllFound();
    ArrayList<Found> flist2=founddao.findAllFoundweek();
%>
<c:choose>
    <c:when test="${sessionScope.currentRole.equals('普通用户')}">
        <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="index.jsp" class="navbar-brand">社区失物招领系统</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="main.jsp">首页</a></li>
                        <li><a href="lostinfo.jsp">寻物</a></li>
                        <li><a href="foundinfo.jsp">招领</a></li>
                        <li><a href="fastpost.jsp">快速发布</a></li>
                    </ul>

                    <form method="post" action="/SSearchServlet" class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input name="key" type="text" class="form-control" placeholder="搜索">
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                用户名：${sessionScope.currentUser}<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="userinfo.jsp">用户信息</a></li>
                                <li><a href="loginout.jsp">注销</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron">
                <h1 align="center">欢迎</h1>
                <p>来到社区失物招领系统，你可以寻到丢失的物品，也可以帮助别人找回遗失的物品。传递正能量，你我同行。</p>
                <p align="center">共<font color="red"><%=llist1.size()%></font>条寻物启事，近7天有<font color="red"><%=llist2.size()%></font>件遗失物品！</p>
                <p align="center">共<font color="red"><%=flist1.size()%></font>条招领启事，近7天有<font color="red"><%=flist2.size()%></font>件被捡物品！</p>
                <p align="center">共找回<font color="red"><%=llist3.size()%></font>件失物</p>
                <p align="center"><a class="btn btn-info btn-lg" href="fastpost.jsp" role="button">快速发布</a></p>
            </div>
        </div>
    </c:when>
    <c:when test="${sessionScope.currentRole.equals('管理员')}">
        <nav class="navbar navbar-inverse navbar-static-top" role="navigation">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a href="main.jsp" class="navbar-brand">社区失物招领系统*管理员版</a>
                </div>
                <div class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="main.jsp">首页</a></li>
                        <li><a href="lostinfo.jsp">寻物</a></li>
                        <li><a href="foundinfo.jsp">招领</a></li>
                        <li><a href="fastpost.jsp">快速发布</a></li>
                        <li><a href="manageuser.jsp">用户管理</a></li>
                    </ul>
                    <form method="post" action="/SSearchServlet" class="navbar-form navbar-left" role="search">
                        <div class="form-group">
                            <input name="key" type="text" class="form-control" placeholder="搜索">
                        </div>
                        <button type="submit" class="btn btn-default">搜索</button>
                    </form>

                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
                        </li>
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                管理员：${sessionScope.currentUser}<span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a href="userinfo.jsp">管理员信息</a></li>
                                <li><a href="loginout.jsp"></span>注销</a></li>
                            </ul>
                        </li>
                    </ul>

                </div>
            </div>
        </nav>
        <div class="container">
            <div class="jumbotron">
                <h1 align="center">亲爱的管理员</h1>
                <p>感谢你的付出，因为你的帮助，让很多人挽回了无可避免的损失。但还是请你继续努力工作，帮助更多的人。</p>
                <p align="center">共<font color="red"><%=llist1.size()%></font>条寻物启事，近7天有<font color="red"><%=llist2.size()%></font>件遗失物品！</p>
                <p align="center">共<font color="red"><%=flist1.size()%></font>条招领启事，近7天有<font color="red"><%=flist2.size()%></font>件被捡物品！</p>
                <p align="center">共找回<font color="red"><%=llist3.size()%></font>件失物</p>
                <p align="center"><a class="btn btn-info btn-lg" href="fastpost.jsp" role="button">快速发布</a></p>
            </div>
        </div>
    </c:when>
    <c:otherwise>
        <jsp:forward page="index.jsp"/>
    </c:otherwise>
</c:choose>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script>
    $("#mytab a").click(function(e){
        e.preventDefault();
        $(this).tab("show");
    })
</script>
</body>
</html>
