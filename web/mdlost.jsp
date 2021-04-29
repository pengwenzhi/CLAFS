<%@ page import="com.model.Lost" %>
<%@ page import="com.dao.LostDao" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/30
  Time: 17:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="jquery/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <style>
        #icon{
            position:relative;
            left:40%;
        }
    </style>
</head>
<body>
<%
    HttpSession Session = request.getSession();
    String currentUser = (String)Session.getAttribute("currentUser");
    Lost lost=new Lost();
    LostDao lostdao=new LostDao();
    int id=Integer.valueOf(request.getParameter("id")).intValue();
    lost=lostdao.findLostById(id);
    Timestamp time1 = Timestamp.valueOf(lost.getLostday());
    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String timeFormat1 = sdf1.format(time1);
    Timestamp time2 = Timestamp.valueOf(lost.getPubtime());
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String timeFormat2 = sdf2.format(time2);
    User user=new User();
    UserDao userdao=new UserDao();
    user=userdao.findUserByName(lost.getUsername());
%>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:history.back(-1)">返回</a>
        </div>
        <div id="icon" class="navbar-brand">修改信息</div>
    </div>
</nav>
<form action="/LostServlet" method="post" id="myform" class="form-horizontal" role="form" enctype="multipart/form-data">
    <div class="form-group">
        <label class="col-sm-5 control-label">信息标题</label>
        <div class="col-sm-3">
            <input name="title" type="text" class="form-control" value="<%=lost.getTitle()%>"">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">物品类别</label>
        <div class="col-sm-2">
            <select name="sort" class="form-control " >
                <option>请选择</option>
                <option value="钱包">钱包</option>
                <option value="钥匙">钥匙</option>
                <option value="宠物">宠物</option>
                <option value="卡类/证照">卡类/证照</option>
                <option value="数码产品">数码产品</option>
                <option value="手包/挎包">手包/挎包</option>
                <option value="衣服/鞋帽">衣服/鞋帽</option>
                <option value="首饰/挂饰">首饰/挂饰</option>
                <option value="行李/包裹">行李/包裹</option>
                <option value="书籍/文件">书籍/文件</option>
                <option value="其他">其他</option>
            </select>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">丢失日期</label>
        <div class="col-sm-3">
            <div class='input-group date' id='datetimepicker1'>
                <input name="lostday" type='text' class="form-control" value="<%=timeFormat1%>" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">丢失地址</label>
        <div class="col-sm-3">
            <input name="address" type="address" class="form-control" value="<%=lost.getAddress()%>">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">物品图片</label>
        <div class="col-sm-3">
            <input name="photo" type="file" id="photo">
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">详情描述</label>
        <div class="col-sm-3">
            <textarea name="detail" class="form-control" rows="3"><%=lost.getDetail()%></textarea>
        </div>
    </div>
    <div class="form-group">
        <div class="col-sm-offset-5 col-sm-3">
            <button id="commit" type="submit" class="btn btn-default btn-md">确认发布信息</button>
        </div>
    </div>
</form>
<script>
    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:00',
            locale: moment.locale('zh-cn'),
        });
    });
</script>
</body>
</html>
