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

import chhhppt.utl.DBhelp;
@WebServlet("/billListServlet")
public class billListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 获取查询条件参数
		req.setCharacterEncoding("utf-8");
	    resp.setContentType("text/html;charset=utf-8");
        String productName = req.getParameter("productName");
        String hotelName = req.getParameter("tigong");
        String paymentStatus = req.getParameter("fukuan");

        // 获取数据库连接
        Connection con = DBhelp.getConn();
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // 构建SQL查询语句
            StringBuilder sql = new StringBuilder("SELECT * FROM kll WHERE 1=1");
            if (productName != null && !productName.isEmpty()) {
                sql.append(" AND name LIKE ?");
            }
            if (hotelName != null && !hotelName.isEmpty()) {
                sql.append(" AND ru LIKE ?");
            }
            if (paymentStatus != null && !paymentStatus.isEmpty()) {
                sql.append(" AND qian LIKE ?");
            }

            // 创建PreparedStatement对象并设置查询条件参数
            ps = con.prepareStatement(sql.toString());
            int paramIndex = 1;
            if (productName != null && !productName.isEmpty()) {
                ps.setString(paramIndex++, "%" + productName + "%");
            }
            if (hotelName != null && !hotelName.isEmpty()) {
                ps.setString(paramIndex++, "%" + hotelName + "%");
            }
            if (paymentStatus != null && !paymentStatus.isEmpty()) {
                ps.setString(paramIndex++, "%" + paymentStatus + "%");
            }

            // 执行查询操作
            System.out.println("SQL Query: " + ps.toString()); // 输出SQL查询语句
            rs = ps.executeQuery();

            // 将查询结果保存在request中
            req.setAttribute("billList", rs);

            // 跳转到billcha.jsp页面
            req.getRequestDispatcher("billcha.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 关闭数据库连接和资源
            DBhelp.close(rs, ps, con);
        }
    }
	}
	


