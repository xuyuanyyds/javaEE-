<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="chhhppt.Controller.*"%>
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
                <span>旅游景区账单管理页面</span>
            </div>
            <div class="search">
            <form action="billListServlet" method="post">
                <span>商品名称：</span>
                <input type="text" placeholder="请输入商品的名称" name="productName"/>

                <span>入住酒店：</span>
                <select name="tigong" >
                    <option value="">--请选择--</option>
                    <option value="全季酒店(泰州凤城河景区店)">全季酒店(泰州凤城河景区店)</option>
                    <option value="全季酒店(泰州万象城店)">全季酒店(泰州万象城店)</option>
                </select>

                <span>是否付款：</span>
                <select name="fukuan">
                    <option value="">--请选择--</option>
                    <option value="已付款">已付款</option>
                    <option value="未付款">未付款</option>
                </select>

                <input type="submit" value="查询" class="button"/>
                </form>
                <a href="billAdd.html">添加订单</a>
            </div>
            <!--账单表格 样式和供应商公用-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">账单编码</th>
                    <th width="20%">商品名称</th>
                    <th width="10%">入住酒店</th>
                    <th width="10%">账单金额</th>
                    <th width="10%">是否付款</th>
                    <th width="30%">操作</th>
                </tr>
                <%
            ResultSet rs = (ResultSet) request.getAttribute("billList");
            rs.beforeFirst();
            while (rs.next()) {
                String id = rs.getString("id");
                String name = rs.getString("name");
                String ru = rs.getString("ru");
                String money = rs.getString("money");
                String qian = rs.getString("qian");
                String number = rs.getString("number");
        %>
                <tr>
                    <td><%=id %></td>
            		<td><%=name %></td>
            		<td><%=ru %></td>
            		<td><%=money %></td>
            		<td><%=qian %></td>
            		<td><%=number %></td>
            <td>
    <a href="billView.jsp?no=<%=id%>"><img src="img/read.png" alt="查看" title="查看"/></a>
    <a href="billUpdate.jsp?no=<%=id%>&id=<%=id%>"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
    <a href="billdelete.jsp?no=<%=id%>" class="removeBill"><img src="img/schu.png" alt="删除" title="删除"/></a>
</td>

                </tr>
                <%
            }
            rs.close();
        %>
            </table>
        </div>
    </section>

<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeBi">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该订单吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>

    <footer class="footer">
    </footer>

<script src="js/jquery.js"></script>
<script src="js/js.js"></script>
<script src="js/time.js"></script>

</body>
</html>