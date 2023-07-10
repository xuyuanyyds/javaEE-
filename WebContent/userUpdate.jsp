<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<!DOCTYPE html>
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
                <li id="active"><a href="userList.jsp">用户管理</a></li>
                <li><a href="password.html">密码修改</a></li>
                <li><a href="login.jsp">退出系统</a></li>
            </ul>
        </nav>
    </div>
    <div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户修改页面</span>
        </div>
        <div class="providerAdd">
            <%
                String no = request.getParameter("no");
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=utf-8", "root", "root");
                    PreparedStatement ps = con.prepareStatement("select * from student where id=?");
                    ps.setString(1, no);
                    ResultSet rs = ps.executeQuery();
                    rs.next();//判断有没有记录并指向当前记录
                    String sno = rs.getString("id");
                    String sname = rs.getString("username");
                    String sdep = rs.getString("data");
                    int sage = rs.getInt("age");
                    String ssex = rs.getString("sex");
                    String userphone = rs.getString("phone");
                    String userAddress = rs.getString("Address");
                    String userfff = rs.getString("userfff");
                    rs.close();
                    ps.close();
                    con.close();
            %>

            <form action="UserUpdate" method="post">
                <fieldset>
                    <label>用户编码:<input type="text" name="sno" value="<%=sno%>" readonly="readonly"></label><br>
                    <label>姓名:<input type="text" name="sname" value="<%=sname%>"></label><br>
                    <label>出生日期:<input type="text" name="data" value="<%=sdep%>"></label><br>
                    <label>年龄:<input type="text" name="sage" value="<%=sage%>"></label><br>
                    <label>性别:<input type="radio" name="ssex" value="男" <%if(ssex.equals("男")){ %>checked="checked" <%} %>>男
                        <input type="radio" name="ssex" value="女" <%if(ssex.equals("女")){ %>checked="checked" <%} %>>女
                    </label><br>
                    <label>用户电话:<input type="text" name="userphone" value="<%=userphone%>"></label><br>
                    <label>用户地址:<input type="text" name="userAddress" value="<%=userAddress%>"></label><br>
                    <label>用户类别:<input type="radio" name="userfff" value="管理员" <%if(userfff.equals("管理员")){ %>checked="checked" <%} %>>管理员
                        <input type="radio" name="userfff" value="经理" <%if(userfff.equals("经理")){ %>checked="checked" <%} %>>经理
                        <input type="radio" name="userfff" value="普通用户" <%if(userfff.equals("普通用户")){ %>checked="checked" <%} %>>普通用户
                    </label><br>
                    <label><input type="submit" value="保存"></label>
                </fieldset>
            </form>
            <% } catch(Exception e) {
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
