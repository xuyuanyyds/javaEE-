<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
</head>
<body>
<% 
    request.setCharacterEncoding("utf-8");
    String a = request.getParameter("billId");
    String b = request.getParameter("billName");
    String c = request.getParameter("billNum");
    String d = request.getParameter("money");
    String e = request.getParameter("supplier");
    String f = request.getParameter("zhifu");

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=UTF-8", "root", "root");
        PreparedStatement st = con.prepareStatement("insert into kll (id, name, ru, money, qian, number) values (?, ?, ?, ?, ?, ?)");
        st.setString(1, a);
        st.setString(2, b);
        st.setString(3, e);
        st.setString(4, d);
        st.setString(5, f);
        st.setString(6, c);

        st.executeUpdate();
        st.close();
        con.close();
        request.getRequestDispatcher("billList.jsp").forward(request, response);
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
</body>
</html>
