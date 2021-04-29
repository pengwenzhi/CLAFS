<%@ page import="com.model.User" %>
<%@ page import="com.dao.FoundDao" %>
<%@ page import="com.model.Found" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #photo{
            position:relative;
            width:20px;
            height:30px;
        }
        #icon{
            position:relative;
            left:48%;
        }
    </style>
</head>
<body>
        <%
            String privateuser=request.getParameter("privateuser");
            FoundDao founddao=new FoundDao();
            ArrayList<Found> list=founddao.findAllFoundByName(privateuser);
        %>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="usersearch.jsp?privateuser=<%=privateuser%>">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></div>
    </div>
</nav>
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
