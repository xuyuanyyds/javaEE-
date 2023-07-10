package chhhppt.Controller;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/UserUpdate")
public class UserUpdateServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        String sno = request.getParameter("sno");
        String sname = request.getParameter("sname");
        String sdep = request.getParameter("data");
        int sage = Integer.parseInt(request.getParameter("sage"));
        String ssex = request.getParameter("ssex");
        String userphone = request.getParameter("userphone");
        String userAddress = request.getParameter("userAddress");
        String userfff = request.getParameter("userfff");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/stu?useUnicode=true&characterEncoding=utf-8", "root", "root");
            PreparedStatement ps = con.prepareStatement("UPDATE student SET username=?, data=?, age=?, sex=?, phone=?, Address=?, userfff=? WHERE id=?");
            ps.setString(1, sname);
            ps.setString(2, sdep);
            ps.setInt(3, sage);
            ps.setString(4, ssex);
            ps.setString(5, userphone);
            ps.setString(6, userAddress);
            ps.setString(7, userfff);
            ps.setString(8, sno);
            int result = ps.executeUpdate();
            ps.close();
            con.close();

            if (result > 0) {
                response.sendRedirect("userList.jsp");
            } else {
                response.getWriter().println("修改失败");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
