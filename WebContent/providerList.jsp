<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.sql.PreparedStatement"%>
<%@ page import="java.sql.DriverManager"%>
<%@ page import="java.sql.Connection"%>
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
            <p><span>下午好！</span><span style="color: #fff21b">管理员Admin</span> , 欢迎你！</p>
            <a href="login.jsp">退出</a>
        </div>
    </header>
    <!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
    <!--主体内容-->
    <section class="publicMian">
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
                <span>酒店账单管理页面</span>
            </div>
            <div class="search">
                <form action="providerServlet" method="post">
                    <span>酒店名称：</span>
                    <input type="text" placeholder="请输入酒店的名称" name="name"/>
                    <input type="submit" value="查询" class="button"/>
                </form>
                <a href="providerAdd.html">添加入住旅客</a>
            </div>
            <!--操作表格-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">账单编号</th>
                    <th width="20%">酒店名称</th>
                    <th width="10%">联系人</th>
                    <th width="10%">联系电话</th>
                    <th width="10%">入住时间</th>
                    <th width="30%">操作</th>
                </tr>
                <%
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu", "root", "root");
                    PreparedStatement st = con.prepareStatement("SELECT * FROM jjk");
                    ResultSet rs = st.executeQuery();
                    while (rs.next()) {
                        String id = rs.getString("id");
                        String name = rs.getString("name");
                        String li = rs.getString("li");
                        String phone = rs.getString("phone");
                        String shijian = rs.getString("shijian");
                %>
                <tr>
                    <td><%=id %></td>
                    <td><%=name %></td>
                    <td><%=li %></td>
                    <td><%=phone %></td>
                    <td><%=shijian %></td>
                    <td>
                        <a href="providerView.jsp?no=<%=id%>"><img src="img/read.png" alt="查看" title="查看"/></a>
                        <a href="providerUpdate.jsp?no=<%=id%>"><img src="img/xiugai.png" alt="修改" title="修改"/></a>
                        <a href="#" onclick="confirmRemove('<%=id%>')"><img src="img/schu.png" alt="删除" title="删除"/></a>
                    </td>
                </tr>
                <%}
                    rs.close();
                    st.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
            </table>
        </div>
    </section>

    <!--点击删除按钮后弹出的页面-->
    <div class="zhezhao"></div>
    <div class="remove" id="removeProv">
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
        var removeUser = document.getElementById("removeProv");
        confirmYes.setAttribute("href", "deleteKll.jsp?no=" + userId);

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
