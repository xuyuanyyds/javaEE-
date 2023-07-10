package chhhppt.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import chhhppt.model.*;
import chhhppt.utl.DBhelp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UserServlet")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("name"); // 鑾峰彇鏌ヨ鏉′欢锛氱敤鎴峰悕
        user u = getUserByName(userName); // 璋冪敤鏌ヨ鏂规硶鑾峰彇鐢ㄦ埛瀵硅薄
        request.setAttribute("user", u); // 灏嗙敤鎴峰璞″瓨鍌ㄥ湪璇锋眰灞炴�涓�
        request.getRequestDispatcher("user.jsp").forward(request, response); // 杞彂鍒�user.jsp 椤甸潰
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    private user getUserByName(String userName) {
        user u = new user();
        Connection con = DBhelp.getConn();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM student WHERE username = ?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                u.setUserId(rs.getString("id"));
                u.setUserName(rs.getString("username"));
                u.setSex(rs.getString("sex"));
                u.setAge(rs.getInt("age"));
                u.setUserphone(rs.getString("phone"));
                u.setA(rs.getString("userfff"));
            }
            DBhelp.close(rs, ps, con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }
}

