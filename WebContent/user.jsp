<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page import="chhhppt.model.user" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线旅游平台管理系统</title>
<link rel="stylesheet" href="css/public.css"/>
<link rel="stylesheet" href="css/style.css"/>
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>在线旅游平台管理系统</h1>
        <div class="publicHeaderR">
            <p><span>下午好！</span><span style="color: #fff21b"> 管理员Admin</span> , 欢迎你！</p>
            <a href="login.jsp">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
<!--主体内容-->
    <section class="publicMian ">
        <div class="left">
            <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
            <nav>
                <ul class="list">
                    <li><a href="billList.jsp">旅游景区账单管理</a></li>
                    <li><a href="providerList.jsp">酒店账单管理</a></li>
                    <li  id="active"><a href="userList.jsp">用户管理</a></li>
                    <li><a href="password.html">密码修改</a></li>
                    <li><a href="login.jsp">退出系统</a></li>
                </ul>
            </nav>
        </div>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
            <form action="UserServlet" method="post">
                    <span>用户名：</span>
                    <input type="text" placeholder="请输入用户名" name="name"/>
                    <input type="submit" value="查询" class="button"/>
                </form>
                <a href="userAdd.html">添加用户</a>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户编码</th>
                    <th width="20%">用户名称</th>
                    <th width="10%">性别</th>
                    <th width="10%">年龄</th>
                    <th width="10%">电话</th>
                    <th width="10%">用户类型</th>
                    <th width="30%">操作</th>
                </tr>
                <%
user u = (user) request.getAttribute("user");
%>
                
                <tr>
            <td><%= u.getUserId() %></td>
<td><%= u.getUserName() %></td>
<td><%= u.getSex() %></td>
<td><%= u.getAge() %></td>
<td><%= u.getUserphone() %></td>
<td><%= u.getA() %></td>
<td>
<a href="userView.jsp?no=<%= u.getUserId() %>"><img src="img/read.png" alt="查看" title="查看"/></a>
<a href="userUpdate.jsp?no=<%= u.getUserId() %>"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
<a href="#" onclick="confirmRemove('<%= u.getUserId() %>')"><img src="img/schu.png" alt="删除" title="删除"/></a>

</td>

        </tr>
                
            </table>
       </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUser">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="confirmYes">确定</a>
            <a href="#" id="confirmNo">取消</a>
        </div>
    </div>
</div>

<footer class="footer">
</footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>
<script>
    function confirmRemove(userId) {
        var confirmYes = document.getElementById("confirmYes");
        var confirmNo = document.getElementById("confirmNo");
        var removeUser = document.getElementById("removeUser");
        confirmYes.setAttribute("href", "deleteStu.jsp?no=" + userId);

        removeUser.style.display = "block";

        confirmYes.onclick = function() {
            removeUser.style.display = "none";
        }

        confirmNo.onclick = function() {
            removeUser.style.display = "none";
        }
    }
</script>

</body>
</html>
