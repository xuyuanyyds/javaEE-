<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("utf-8");
    String userId = request.getParameter("userId");
    String userName = request.getParameter("userName");
    String userpassword = request.getParameter("userpassword");
    String sex = request.getParameter("sex");
    String data = request.getParameter("data");
    String userphone = request.getParameter("userphone");
    String userAddress = request.getParameter("userAddress");
    String userfff = request.getParameter("userfff");

    Connection con = null;
    PreparedStatement st = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=utf-8", "root", "root");
        st = con.prepareStatement("INSERT INTO student(id, username, password, sex, data, phone, Address, userfff) VALUES (?, ?, ?, ?, ?, ?, ?, ?)");
        st.setString(1, userId);
        st.setString(2, userName);
        st.setString(3, userpassword);
        st.setString(4, sex);
        st.setString(5, data);
        st.setString(6, userphone);
        st.setString(7, userAddress);
        st.setString(8, userfff);
        st.executeUpdate();

        response.sendRedirect("userList.jsp"); // 重定向到用户列表页面
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
