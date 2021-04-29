<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%
        //权限验证
        if(session.getAttribute("currentUser")==null){
            request.setAttribute("message","登录后才能发布信息，请登录!");
            System.out.println("想翻墙，没门");
            request.getRequestDispatcher("login.jsp").forward(request,response);
            return;
        }
    %>
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <script src="jquery/jquery-3.4.1.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="https://cdn.bootcss.com/moment.js/2.18.1/moment-with-locales.min.js"></script>
    <link href="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>
    <style>
        #icon{
            position:relative;
            left:48%;
        }
        #commit{
            width:120px;
            position:relative;
            left:55px;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="fastpost.jsp">返回</a>
        </div>
        <div id="icon" class="navbar-brand"><span class="glyphicon glyphicon-flash" aria-hidden="true"></span></div>
    </div>
</nav>
<form action="/LostServlet" method="post" id="myform" class="form-horizontal" role="form" enctype="multipart/form-data">
    <div class="form-group">
        <label class="col-sm-5 control-label">信息标题</label>
        <div class="col-sm-3">
            <input name="title" type="text" class="form-control" placeholder="如寻找失物">
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
                <input name="lostday" type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class="form-group">
        <label class="col-sm-5 control-label">丢失地址</label>
        <div class="col-sm-3">
            <input name="address" type="address" class="form-control" placeholder="如广场">
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
            <textarea name="detail" class="form-control" rows="3"></textarea>
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
