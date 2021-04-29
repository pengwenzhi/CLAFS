<%@ page import="com.model.Lost" %>
<%@ page import="com.dao.LostDao" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.User" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <style>
        #photo{
            position:relative;
            width:90px;
            height:120px;
        }
        span{
            font-size: 16px;
        }
        #icon{
            position:relative;
            left:43%;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="lostinfo.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand">发布成功<span class="glyphicon glyphicon-ok" aria-hidden="true"></span></div>
    </div>
</nav>
<%
    HttpSession Session = request.getSession();
    String currentUser = (String)Session.getAttribute("currentUser");
    Lost lost=new Lost();
    LostDao lostdao=new LostDao();
    lost=lostdao.findLostByName(currentUser);
    Timestamp time1 = Timestamp.valueOf(lost.getLostday());
    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    String timeFormat1 = sdf1.format(time1);
    Timestamp time2 = Timestamp.valueOf(lost.getPubtime());
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String timeFormat2 = sdf2.format(time2);
    User user=new User();
    UserDao userdao=new UserDao();
    user=userdao.findUserByName(currentUser);
%>
<form>
<div class="container">
    <div class="jumbotron">
        <p align="center"><span style="font-size: 22px"><b><%=lost.getTitle()%></b></span></p>
        <p align="center"><span style="font-size:12px;"><b>发布时间：</b><%=timeFormat2%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>拾物编号：</b><%=lost.getId()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>物品状态：</b><%=lost.getState()%></span></p>
        <div id="fontsize">
            <p ><span ><b>失物类别 : <%=lost.getSort()%></b></span></p>
            <p ><span ><b>丢失时间 : <%=timeFormat1%></b></span></p>
            <p ><span ><b>丢失地点 : <%=lost.getAddress()%></b></span></p>
            <p ><span ><b>联系人 : <%=user.getRealname()%></b></span></p>
            <p ><span ><b>联系方式 : <%=user.getTel()%></b></span></p>
            <p><span><b>联系地址 : <%=user.getAddress()%></b></span></p>
            <p ><span ><b>物品图片 : <img id="photo" src="upload/<%=lost.getPhoto()%>"></b></span></p>
        </div>
        <ul id="myTab" class="nav nav-tabs">
            <li class="active">
                <a href="#related" data-toggle="tab">
                    <b style="font-size: 18px">相关线索</b>
                </a>
            </li>
            <li>
                <a href="#provide" data-toggle="tab">
                    <b style="font-size: 18px">我要提供线索</b>
               </a>
            </li>
        </ul>
        <div id="myTabContent" class="tab-content">
            <div class="tab-pane fade in active" id="related">
                <div>
                    <p></p>
                    <p><span><b>温馨提示Tips：</b></span></p>
                    <p><span>暂无网友回复，祝您早日找回遗失物品。</span></p>
                    <p><span>请点击上方“我要提供线索”留言，谢谢。</span></p>
                    <p><span><font color="red"><b>诚信，从你我做起！请给这个社会多一份爱心。</b></font></span></p>
                </div>
            </div>
            <div class="tab-pane fade" id="provide">
                    <div>
                        <p></p>
                        <p><span><b>期待您的回复：</b></span></p>
                        <div class="form-group">
                            <textarea name="detail" class="form-control" rows="5"></textarea>
                        </div>
                        <p align="center"><button type="submit" class="btn btn-default">提交</button></p>
                    </div>
            </div>
        </div>
    </div>
</div>
</form>
<script src="jquery/jquery-3.4.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
