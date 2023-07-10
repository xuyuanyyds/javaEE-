package chhhppt.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login")
public class LoginController extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	    HttpSession session = req.getSession();
	    req.setCharacterEncoding("utf-8");
	    resp.setContentType("text/html;charset=utf-8");
	    String username = req.getParameter("username");
	    String psw = req.getParameter("psw");
	    try {
	        Class.forName("com.mysql.jdbc.Driver");
	        Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stu", "root", "root");
	        PreparedStatement st = con.prepareStatement("SELECT * FROM student WHERE username = ? AND password = ?");
	        st.setString(1, username);
	        st.setString(2, psw);
	        ResultSet rs = st.executeQuery();

	        if (rs.next()) {
	        	String adminPassword = getAdminPasswordFromDatabase();

	            if (adminPassword != null && username.equals("admin") && psw.equals(adminPassword)) {
	                resp.sendRedirect("admin.html");
	            } else {
	            	resp.sendRedirect("users_Welcome.html");

	            }
	        } else {
	            req.getRequestDispatcher("login.jsp?flag=fail").forward(req, resp);
	        }

	        rs.close();
	        st.close();
	        con.close();
	    } catch (Exception e) {
	        System.out.println("Failed to connect to the database.");
	        e.printStackTrace();
	    }
	}

    private String getAdminPasswordFromDatabase() throws SQLException {
        Connection con = null;
        PreparedStatement st = null;
        ResultSet rs = null;
        String adminPassword = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stu", "root", "root");
            st = con.prepareStatement("SELECT password FROM student WHERE username = 'admin'");
            rs = st.executeQuery();

            if (rs.next()) {
                adminPassword = rs.getString("password");
            }
        } catch (ClassNotFoundException e) {
            System.out.println("Failed to load database driver.");
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (st != null) {
                st.close();
            }
            if (con != null) {
                con.close();
            }
        }

        return adminPassword;
    }
}

