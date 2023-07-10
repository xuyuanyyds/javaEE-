<%@page import="java.sql.ResultSet"%>
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
        <p><span>下午好！</span><span style="color: #fff21b"> Admin</span> , 欢迎你！</p>
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
                <li id="active"><a href="billList.jsp">旅游景区账单管理</a></li>
                <li ><a href="providerList.jsp">酒店账单管理</a></li>
                <li><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>旅游景区账单管理 >> 订单信息查看</span>
        </div>
        <div class="providerView">
            <%
            try{
            	Class.forName("com.mysql.jdbc.Driver");
            	Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stu?useUnicode=true&characterEncoding=UTF-8","root","root");
            	String id = request.getParameter("no");
            	PreparedStatement st = con.prepareStatement("SELECT * FROM kll WHERE id = ?");
            	st.setString(1, id);
            	ResultSet rs = st.executeQuery();
            	while(rs.next()){
            		String Id = rs.getString("id");
            		String name = rs.getString("name");
            		String ru = rs.getString("ru");
            		String money = rs.getString("money");
            		String qian = rs.getString("qian");
            		String number = rs.getString("number");
            		
            	%>
            	<table class="providerTable" cellpadding="0" cellspacing="0">
                <tr>
                    <td>账单编号:<%=id %></td>
                    <td>酒店名称:<%=name %></td>
                    <td>联系人:<%=ru %></td>
                    <td>联系电话:<%=money %></td>
                    <td>入住时间:<%=qian %></td>
                    <td>备注描述:<%=number %></td>
                  </tr>  
                   </table> 
            <%} 
            	rs.close();
            	st.close();
            	con.close();
            	%>
               
            <%}catch(Exception e){
            	e.printStackTrace();
            }
            %>

            <a href="billList.jsp">返回</a>
        </div>
    </div>
</section>
<footer class="footer">
</footer>
<script src="js/time.js"></script>

</body>
</html>