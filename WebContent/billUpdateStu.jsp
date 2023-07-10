<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  try {
      request.setCharacterEncoding("utf-8");
      String sno = request.getParameter("providerId");
      String sname = request.getParameter("providerName");
      String address = request.getParameter("address");
      String fax = request.getParameter("fax");
      String phone = request.getParameter("phone");
      String zhifu = request.getParameter("zhifu");


      Class.forName("com.mysql.jdbc.Driver");
      Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=UTF-8", "root", "root");
      PreparedStatement ps = con.prepareStatement("UPDATE kll SET name=?, ru=?, money=?, qian=?, number=? WHERE id=?");
      ps.setString(1, sname);
      ps.setString(2, fax);
      ps.setString(3, address);
      ps.setString(4, zhifu);
      ps.setString(5, phone);
      ps.setString(6, sno);

      ps.executeUpdate();
      ps.close();
      con.close();
      response.sendRedirect("billList.jsp");
  } catch (Exception e) {
      e.printStackTrace();
  }
%>
</body>
</html>
