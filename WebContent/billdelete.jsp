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
  String no= request.getParameter("no");
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu", "root", "root");
	  PreparedStatement ps =  con.prepareStatement("delete from kll where id=?");
      ps.setString(1,no);
      ps.executeUpdate();
      ps.close();
      con.close();
      request.getRequestDispatcher("billList.jsp").forward(request, response);
  }catch(Exception e){
	  e.printStackTrace();
  }
%>
</body>
</html>