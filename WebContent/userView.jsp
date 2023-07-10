<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>在线旅游平台管理系统</title>
    <link rel="stylesheet" href="css/public.css"/>
    <link rel="stylesheet" href="css/style.css"/>
<style>
    .providerTable {
        border-collapse: collapse;
        width: 100%;
        margin-bottom: 20px; /* 添加表格底部间距 */
    }

    .providerTable th,
    .providerTable td {
        padding: 8px; /* 添加单元格内边距 */
        text-align: left;
        border-bottom: 1px solid #ddd; /* 添加底部边框 */
    }

    .providerTable th {
        background-color: #f2f2f2; /* 设置表头背景颜色 */
    }
</style>
</head>
<body>
<!--头部-->
<header class="publicHeader">
    <h1>在线旅游平台管理系统</h1>
    <div class="publicHeaderR">
        <p><span>下午好！</span><span style="color: #fff21b">管理员Admin</span>，欢迎你！</p>
        <a href="login.jsp">退出</a>
    </div>
</header>
<!--时间-->
<section class="publicTime">
    <span id="time">2015年1月1日 11:11 星期一</span>
    <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
</section>
<!--主体内容-->
<section class="publicMian">
    <div class="left">
        <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
        <nav>
            <ul class="list">
                <li><a href="billList.jsp">旅游景区账单管理</a></li>
                <li><a href="providerList.jsp">酒店账单管理</a></li>
                <li><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户信息查看页面</span>
        </div>
        <div class="providerView">
            <%@ page import="java.sql.*" %>
            <%@ page import="java.util.*" %>

            <% 
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stu?useUnicode=true&characterEncoding=UTF-8", "root", "root");
                    String id = request.getParameter("no");
                    PreparedStatement st = con.prepareStatement("SELECT * FROM student WHERE id = ?");
                    st.setString(1, id);
                    ResultSet rs = st.executeQuery();
                    if (rs.next()) {
                        String Id = rs.getString("id");
                        String name = rs.getString("username");
                        String sex = rs.getString("sex");
                        int age = rs.getInt("age");
                        String phone = rs.getString("phone");
                        String userfff = rs.getString("userfff");
                        String birthDate = rs.getString("data");
                        String address = rs.getString("Address");
            %>
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr>
                    <td>用户编号: <%= Id %></td>
                    <td>用户名: <%= name %></td>
                    <td>性别: <%= sex %></td>
                    <td>年龄: <%= age %></td>
                    <td>手机: <%= phone %></td>
                    <td>用户类型: <%= userfff %></td>
                    <td>出生日期: <%= birthDate %></td>
                    <td>地址: <%= address %></td>
                </tr>
            </table>
            <% } else { %>
            <p>未找到该用户信息。</p>
            <% }
                rs.close();
                st.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>

            <a href="userList.jsp">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>

</body>
</html>
