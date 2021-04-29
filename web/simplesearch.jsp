<%@ page import="com.model.Found" %>
<%@ page import="com.model.Lost" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/5/3
  Time: 0:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        a{
            text-decoration : none;
        }
        a:hover{
            text-decoration: none;
        }
        #icon{
            position:relative;
            left:45%;
        }
        #photo{
            height:200px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:history.back(-1)">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></div>
    </div>
</nav>
<%
    ArrayList<Found> flist= (ArrayList<Found>) request.getAttribute("fsearchlist");
    ArrayList<Lost> llist= (ArrayList<Lost>) request.getAttribute("lsearchlist");
%>
<hr>
<h4 align="center"><font color="#5f9ea0">失物记录</font></h4>
<hr>
<div class="row">
    <%
        if(null!=llist && llist.size() !=0){
    %>
    <%
        for(int i=0; i<llist.size();i++){
    %>
    <div class="col-sm-2">
        <div class="thumbnail">
            <a href="onelostinfo.jsp?id=<%=llist.get(i).getId()%>">
                <img id="photo" src="upload/<%=llist.get(i).getPhoto()%>" alt="物品图片">
                <div class="caption" style="word-wrap:break-word; overflow:hidden;">
                    <h4 align="center"><%=llist.get(i).getTitle()%></h4>
                    <p><%=llist.get(i).getDetail()%></p>
                    <%
                        Timestamp time = Timestamp.valueOf(llist.get(i).getPubtime());
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String timeFormat = sdf.format(time);
                    %>
                    <p align="right" style="font-size: 12px"><%=timeFormat%></p>
                </div>
            </a>
        </div>
    </div>
    <%
        }
    %>
    <%
        }
    %>
</div>
<hr>
<h4 align="center"><font color="#5f9ea0">拾物记录</font></h4>
<hr>
<div class="row">
    <%
    if(null!=flist && flist.size() !=0){
    %>
    <%
        for(int i=0; i<flist.size();i++){
    %>
    <div class="col-sm-2">
        <div class="thumbnail">
            <a href="onefoundinfo.jsp?id=<%=flist.get(i).getId()%>">
                <img id="photo" src="upload/<%=flist.get(i).getPhoto()%>" alt="物品图片">
                <div class="caption" style="word-wrap:break-word; overflow:hidden;">
                    <h4 align="center"><%=flist.get(i).getTitle()%></h4>
                    <p><%=flist.get(i).getDetail()%></p>
                    <%
                        Timestamp time = Timestamp.valueOf(flist.get(i).getPubtime());
                        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                        String timeFormat = sdf.format(time);
                    %>
                    <p align="right" style="font-size: 12px"><%=timeFormat%></p>
                </div>
            </a>
        </div>
    </div>
    <%
        }
    %>
    <%
        }
    %>
</div>
</body>
</html>
