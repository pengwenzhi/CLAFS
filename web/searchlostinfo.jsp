<%@ page import="com.dao.LostDao" %>
<%@ page import="com.model.Lost" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/9
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        a{
            text-decoration : none;
        }
        a:hover{
            text-decoration: none;
        }
        #icon{
            position:relative;
            left:43%;
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
        <div id="icon" class="navbar-brand">寻物启事信息</div>
    </div>
</nav>
<div class="container">
    <p><b>快速筛选</b></p>
    <div class="jumbotron">
        <form action="/CLSearchServlet" method="post" id="myform" class="form-horizontal" role="form">
            <div class="form-group">
                <label class="col-sm-1 control-label">失物类别</label>
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
                <label class="col-sm-1 control-label">丢失日期</label>
                <div class="col-sm-3">
                    <div class='input-group date' id='datetimepicker1'>
                        <input name="start" type='text' class="form-control" />
                        <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                    </div>
                </div>
                <div class="col-sm-1"> <label class="col-sm-1 control-label">至</label></div>
                <div class="col-sm-3">
                    <div class='input-group date' id='datetimepicker2'>
                        <input name="end" type='text' class="form-control" />
                        <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
                    </div>
                </div>
            </div>


            <div class="form-group">
                <label class="col-sm-1 control-label">丢失地点</label>
                <div class="col-sm-2">
                    <input name="address" type="address" class="form-control" >
                </div>
                <label class="col-sm-1 control-label">关键字</label>
                <div class="col-sm-2">
                    <input name="key" type="text" class="form-control">
                </div>
                <div class=" col-sm-1">
                    <button id="commit" type="submit" class="btn btn-info btn-md">筛选</button>
                </div>
            </div>
        </form>
    </div>
</div>
<%
    ArrayList<Lost> list= (ArrayList<Lost>) request.getAttribute("searchlist");
%>
<div class="row">
    <%
        for(int i=0; i<list.size();i++){
    %>
    <div class="col-sm-2">
        <div class="thumbnail">
            <a href="onelostinfo.jsp?id=<%=list.get(i).getId()%>">
                <img id="photo" src="upload/<%=list.get(i).getPhoto()%>" alt="物品图片">
                <div class="caption" style="word-wrap:break-word; overflow:hidden;">
                    <h4 align="center"><%=list.get(i).getTitle()%></h4>
                    <p><%=list.get(i).getDetail()%></p>
                    <%
                        Timestamp time = Timestamp.valueOf(list.get(i).getPubtime());
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
</div>
<script>
    $(function () {
        $('#datetimepicker1').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:00',
            locale: moment.locale('zh-cn'),
        });
    });
    $(function () {
        $('#datetimepicker2').datetimepicker({
            format: 'YYYY-MM-DD HH:mm:00',
            locale: moment.locale('zh-cn'),
        });
    });
</script>
</body>
</html>
