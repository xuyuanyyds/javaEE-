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
  try{
	  request.setCharacterEncoding("utf-8");
	  String sno=request.getParameter("sno");
	  String sname=request.getParameter("sname");
	  String sdep=request.getParameter("sdep");
	  String sage=request.getParameter("sage");
	  String ssex= request.getParameter("ssex");
	  String userphone = request.getParameter("userphone");
	  String userAddress = request.getParameter("userAddress");
	  String userfff = request.getParameter("userfff");
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu", "root", "root");
	  PreparedStatement ps = con.prepareStatement("update student set username=?,sex=?,age=?,data=?,phone=?,Address=?,userfff=? where id=?");
	  ps.setString(1, sname);
	  ps.setString(2, sdep);
	  ps.setInt(3, Integer.parseInt(sage));
	  ps.setString(4, ssex);
	  ps.setString(5, sno);
	  ps.setString(6, userphone);
	  ps.setString(7, userAddress);
	  ps.setString(8, userfff);
	  ps.executeUpdate();
	  ps.close();
	  con.close();
	  request.getRequestDispatcher("userList.jsp").forward(request, response);
  }catch(Exception e){
	  e.printStackTrace();
  }

%>
</body>
</html>