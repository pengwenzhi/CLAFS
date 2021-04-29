<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2020/4/8
  Time: 19:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv='refresh' content='3;url=login.jsp'>
    <title>注册成功</title>
    <script type='text/javascript'>
        var i=3;
        function getTime(){
            document.getElementById('num').innerHTML="<font color='red'>"+i+"</font>";
            i-=1;
            var x=setTimeout('getTime()',1000)
            if(i<=0){
                clearTimeout(x);
            }
        }
        window.onload=getTime;
    </script>
</head>
<body>
<h2 align="center">${username},注册成功!页面将在<div id='num' style='display:inline;'>3</div>秒后跳转到登录界面</h2>
</body>
</html>
