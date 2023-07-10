<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>在线旅游平台管理系统</title>
<meta charset="UTF-8">
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
                <li id="active"><a href="providerList.jsp">酒店账单管理</a></li>
                <li><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>酒店账单管理 >> 入住酒店人员【修改】页面</span>
        </div>
        <div class="providerAdd">
            <%
            	request.setCharacterEncoding("utf-8");
            	String sno = request.getParameter("sno");
                String sname = request.getParameter("sname");
                String sdep = request.getParameter("li");
                String phone = request.getParameter("phone");
                String shijian = request.getParameter("shijian");
                String bei = request.getParameter("bei");

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=utf-8", "root", "root");
                    PreparedStatement ps = con.prepareStatement("update jjk set name=?, li=?, phone=?, shijian=?, bei=? where id=?");
                    ps.setString(1, sname);
                    ps.setString(2, sdep);
                    ps.setString(3, phone);
                    ps.setString(4, shijian);
                    ps.setString(5, bei);
                    ps.setString(6, sno);
                    int result = ps.executeUpdate();
                    ps.close();
                    con.close();

                    if (result > 0) {
                        out.println("<h2>数据修改成功！</h2>");
                    } else {
                        out.println("<h2>数据修改失败！</h2>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>
</body>
</html>
