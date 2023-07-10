<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>登录</title>
    <!-- for-mobile-apps -->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

    <!-- //for-mobile-apps -->
    <link href="./css/login_style.css" rel="stylesheet" type="text/css" media="all" />
    <script>
    function login(){
    	var username = document.getElementById("username").value;
    	sessionStorage.setItem('username',username);
    }
    </script>

</head>
<body>
    <!-- main -->
    <div class="main">
        <h1>
            登录系统
        </h1>
        <form action="login" method="post">
            <input type="text" value="" name="username" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '用户名';}"
                   required="">
            <input type="password" value="" name="psw" onFocus="this.value = '';" onBlur="if (this.value == '') {this.value = '';}"
                   required="">
            <input type="submit" value="登录">&nbsp;&nbsp;
            <%if(request.getParameter("flag")!=null&&request.getParameter("flag").equals("fail")){ %>
							   <font color="red">
							     用户名或密码错误！
							   </font>
							   <%} %>
        </form>
        <a href="register.jsp"><input type="submit" value="用户注册"></a>
    </div>
    <div class="footer">
        <p>
          在线旅游平台 2023 Welcome Login Form. All rights reserved 吴华迅小组
        </p>
    </div>
    <!-- //main -->
</body>
</html>