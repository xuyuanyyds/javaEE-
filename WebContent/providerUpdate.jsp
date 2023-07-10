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
  String no= request.getParameter("no");
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=utf-8", "root", "root");
	  PreparedStatement ps =con.prepareStatement("select * from jjk where id=?");
      ps.setString(1, no);
      ResultSet rs =ps.executeQuery();
      rs.next();//判断有没有记录并指向当前记录
      String sno= rs.getString("id");
      String sname=rs.getString("name");
      String sdep=rs.getString("li");
      String phone = rs.getString("phone");
      String shijian = rs.getString("shijian");
      String bei = rs.getString("bei");
      rs.close();
      ps.close();
      con.close();
%>
 
            <form action="proupdateStu.jsp" method="post">
                <fieldset>
      				<label>用户编码:<input type="text" name="sno" value="<%=sno%>" readonly="readonly"></label><br>
     				<label>酒店名称:<input type="text" name="sname" value="<%=sname%>"></label><br>
      				<label>联系人:<input type="text" name="li" value="<%=sdep%>"></label><br>
      
      
      <label>用户电话:<input type="text" name="phone" value="<%=phone%>"></label><br>
      <label>入住时间:<input type="text" name="shijian" value="<%=shijian%>"></label><br>
      <label>备注描述:<input type="text" name="bei" value="<%=bei%>"></label><br>
     
      <label><input type="submit" value="提交"></label>
    </fieldset>
            </form>
    <%}catch(Exception e){
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