<%@ page import="com.model.Lost" %>
<%@ page import="com.dao.LostDao" %>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="com.model.User" %>
<%@ page import="com.dao.UserDao" %>
<%@ page import="com.model.Comment" %>
<%@ page import="com.dao.CommentDao" %>
<%@ page import="java.util.ArrayList" %>
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
        #objectid{
             text-align:center;
             width:80px;
             border:none;
         }
        #pubtime{
            text-align:center;
            width:120px;
            border:none;
        }
        #state{
            text-align:center;
            width:48px;
            border:none;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-default">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="javascript:history.back(-1)">返回</a>
        </div>
        <div id="icon" class="navbar-brand">详细信息</div>
    </div>
</nav>
<%
    HttpSession Session = request.getSession();
    String currentUser = (String)Session.getAttribute("currentUser");
    Lost lost=new Lost();
    LostDao lostdao=new LostDao();
    int id=Integer.valueOf(request.getParameter("id")).intValue();
    lost=lostdao.findLostById(id);
    Timestamp time1 = Timestamp.valueOf(lost.getLostday());
    SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    String timeFormat1 = sdf1.format(time1);
    Timestamp time2 = Timestamp.valueOf(lost.getPubtime());
    SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    String timeFormat2 = sdf2.format(time2);
    User user=new User();
    UserDao userdao=new UserDao();
    user=userdao.findUserByName(lost.getUsername());
    CommentDao commentdao=new CommentDao();
    ArrayList<Comment> list=commentdao.findAllCommentByName(lost.getId());
    System.out.println(list.size());
%>
<form method="post" action="/CommentLostServlet">
    <div class="container">
        <div class="jumbotron">
            <p align="center"><span style="font-size: 22px"><b><%=lost.getTitle()%></b></span></p>
            <p align="center"><span style="font-size:12px;"><b>发布时间：</b><input id="pubtime" type="text" value="<%=timeFormat2%>" readonly="readonly"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>失物编号：</b><input type="text" id="objectid" name="objectid" value="<%=lost.getId()%>" readonly="readonly"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>物品状态：</b><input id="state" type="text" value="<%=lost.getState()%>" readonly="readonly"/></span></p>
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
                    <% if(list.size()>0){ %>
                            <%
                                for(int i=0; i<list.size();i++){
                            %>
                            <%
                                Timestamp time = Timestamp.valueOf(list.get(i).getPubtime());
                                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                                String timeFormat = sdf.format(time);
                            %>
                            <div>
                                <p></p>
                                <p style="font-size: 15px">用户 <font color="#a52a2a"> <%=list.get(i).getVisitor()%></font> 回复：<span style="position:relative;left:70%"><%=timeFormat%></span></p>
                                <div style="font-size: 15px;word-wrap:break-word; overflow:hidden;"><%=list.get(i).getContent()%></div>
                            </div>
                            <%
                                }
                            %>
                            <p></p>
                            <p style="font-size: 15px"><b>期待您的回复：</b></p>
                            <div class="form-group">
                                 <textarea name="content" class="form-control" rows="5"></textarea>
                            </div>
                            <p align="center"><button type="submit" class="btn btn-default">提交</button></p>
                        <%}else{ %>
                            <div>
                                <p></p>
                                <p><span><b>温馨提示Tips：</b></span></p>
                                <p><span>暂无网友回复，祝您早日找回遗失物品。</span></p>
                                <p><span>请点击上方“我要提供线索”留言，谢谢。</span></p>
                                <p><span><font color="red"><b>诚信，从你我做起！请给这个社会多一份爱心。</b></font></span></p>
                                <p><span><b>期待您的回复：</b></span></p>
                                <div class="form-group">
                                    <textarea name="content" class="form-control" rows="5"></textarea>
                                </div>
                                <p align="center"><button type="submit" class="btn btn-default">提交</button></p>
                            </div>
                       <% } %>
                </div>
                <div class="tab-pane fade" id="provide">
                    <div>
                        <p></p>
                        <p><span><b>期待您的回复：</b></span></p>
                        <div class="form-group">
                            <textarea name="content" class="form-control" rows="5"></textarea>
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