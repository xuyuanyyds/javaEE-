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
  request.setCharacterEncoding("utf-8");
String a = request.getParameter("providerId");
String b = request.getParameter("providerName");
String c = request.getParameter("people");
String d = request.getParameter("phone");
String e = request.getParameter("fax");
String f = request.getParameter("describe");

  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=utf-8", "root", "root");
	  PreparedStatement st = con.prepareStatement("insert into jjk(id,name,li,phone,shijian,bei) values(?,?,?,?,?,?)");
	  st.setString(1, a);
      st.setString(2, b);
      st.setString(3, c);
      
      st.setString(4, d);
      st.setString(5, e);
      st.setString(6, f);
      
	  st.executeUpdate();
	  st.close();
	  con.close();
	  request.getRequestDispatcher("providerList.jsp").forward(request, response);
  }catch(Exception ex){
	  ex.printStackTrace();
  }




%>
</body>
</html>