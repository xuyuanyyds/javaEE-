package chhhppt.Controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chhhppt.model.provider;

import chhhppt.utl.DBhelp;
@WebServlet("/providerServlet")
public class providerServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userName = request.getParameter("name"); // 鑾峰彇鏌ヨ鏉′欢锛氱敤鎴峰悕
        provider u = getproviderByName(userName); // 璋冪敤鏌ヨ鏂规硶鑾峰彇鐢ㄦ埛瀵硅薄
        request.setAttribute("provider", u); // 灏嗙敤鎴峰璞″瓨鍌ㄥ湪璇锋眰灞炴�涓�
        request.getRequestDispatcher("provider.jsp").forward(request, response); // 杞彂鍒�user.jsp 椤甸潰
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    private provider getproviderByName(String userName) {
    	provider u = new provider();
        Connection con = DBhelp.getConn();
        try {
            PreparedStatement ps = con.prepareStatement("SELECT * FROM jjk WHERE name = ?");
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
            	u.setId(rs.getString("id"));
                u.setName(rs.getString("name"));
                u.setLi(rs.getString("li"));
                u.setPhone(rs.getString("phone"));
                u.setShijian(rs.getString("shijian"));
                u.setBei(rs.getString("bei"));
            }
            DBhelp.close(rs, ps, con);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

}
