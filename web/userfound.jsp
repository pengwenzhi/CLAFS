<%@ page import="com.dao.FoundDao" %>
<%@ page import="com.model.Found" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>拾物管理</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #photo{
            position:relative;
            width:20px;
            height:30px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></div>
        <div class="navbar-header">
            <a href="#" class="navbar-brand">${sessionScope.currentUser}</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <c:choose>
                    <c:when test="${sessionScope.currentRole.equals('普通用户')}">
                        <li><a href="userinfo.jsp">用户信息</a></li>
                        <li><a href="userlost.jsp">寻物记录</a></li>
                        <li class="active"><a href="userfound.jsp">拾物记录</a></li>
                        <li><a href="direction.jsp">物品去向</a></li>
                    </c:when>
                    <c:when test="${sessionScope.currentRole.equals('管理员')}">
                        <li><a href="userinfo.jsp">管理员信息</a></li>
                        <li><a href="userlost.jsp">寻物记录</a></li>
                        <li class="active"><a href="userfound.jsp">拾物记录</a></li>
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
    FoundDao founddao=new FoundDao();
    ArrayList<Found> list=founddao.findAllFoundByName(currentUser);
    System.out.println(list.size());
%>
<div class="container">
    <table class="table">
        <thead>
        <tr class="info">
            <th>拾物编码</th>
            <th>标题</th>
            <th>拾物类别</th>
            <th>拾获时间</th>
            <th>拾取地点</th>
            <th>物品图片</th>
            <th>详细信息</th>
            <th>物品状态</th>
            <th>归还</th>
            <th>查看</th>
            <th >修改</th>
            <th >删除</th>
        </tr>
        </thead>
        <tbody>
        <%
            for(int i=0; i<list.size();i++){
        %>
        <tr class="success">
            <td><%=list.get(i).getId()%></td>
            <td><%=list.get(i).getTitle()%></td>
            <td><%=list.get(i).getSort()%></td>
            <%
                Timestamp time = Timestamp.valueOf(list.get(i).getPickday());
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String timeFormat = sdf.format(time);
            %>
            <td><%=timeFormat%></td>
            <td><%=list.get(i).getAddress()%></td>
            <td ><img id="photo" src="upload/<%=list.get(i).getPhoto()%>"></td>
            <td><%=list.get(i).getDetail()%></td>
            <td><%=list.get(i).getState()%></td>
            <td ><a href="frecord.jsp?id=<%=list.get(i).getId()%>"><span class="glyphicon glyphicon-ok" aria-hidden="true"></span></a></td>
            <td ><a href="onefoundinfo.jsp?id=<%=list.get(i).getId()%>"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></a></td>
            <td ><a href="mdfound.jsp?id=<%=list.get(i).getId()%>"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></a></td>
            <td ><a href="#"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>
</div>
</body>
</html>
