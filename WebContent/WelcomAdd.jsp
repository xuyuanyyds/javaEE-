<%@ page language="java" contentType="application/json; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="org.json.*" %>
<%@ page isELIgnored="false" trim="true" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
request.setCharacterEncoding("UTF-8");

String providerName = request.getParameter("providerName");
String people = request.getParameter("people");
String phone = request.getParameter("phone");
String fax = request.getParameter("fax");
String describe = request.getParameter("describe");

JSONObject jsonResponse = new JSONObject();
try {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=utf-8", "root", "root");
    PreparedStatement st = con.prepareStatement("insert into jjk(name, li, phone, shijian, bei) values(?, ?, ?, ?, ?)");
    st.setString(1, providerName);
    st.setString(2, people);
    st.setString(3, phone);
    st.setString(4, fax);
    st.setString(5, describe);

    int rowsAffected = st.executeUpdate();
    st.close();
    con.close();

    // 检查受影响的行数，以确定插入是否成功
    if (rowsAffected > 0) {
        // 设置成功响应
        jsonResponse.put("success", true);
        jsonResponse.put("message", "预定成功");
    } else {
        // 设置失败响应
        jsonResponse.put("success", false);
        jsonResponse.put("message", "预定失败");
    }
} catch (Exception ex) {
    ex.printStackTrace();

    // 设置错误响应
    jsonResponse.put("success", false);
    jsonResponse.put("message", "预定失败");
}

response.setContentType("application/json");
response.setCharacterEncoding("UTF-8");

try (PrintWriter s = response.getWriter();) {
    out.println(jsonResponse.toString());
}
%>

</body>
</html>