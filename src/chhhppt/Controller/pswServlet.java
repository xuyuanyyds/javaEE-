package chhhppt.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/psw")
public class pswServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String oldPassword = req.getParameter("oldPassword");
        String newPassword = req.getParameter("newPassword");
        String reNewPassword = req.getParameter("reNewPassword");

        // 检查新密码和确认新密码是否匹配
        if (!newPassword.equals(reNewPassword)) {
            PrintWriter out = resp.getWriter();
            out.println("<script>alert('新密码和确认新密码不匹配');window.location.href='password.html';</script>");
            return;
        }

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/stu", "root", "root");

            // 先检查原密码是否正确
            PreparedStatement checkPasswordStmt = con.prepareStatement("SELECT * FROM student WHERE username = ? AND password = ?");
            checkPasswordStmt.setString(1, "admin");
            checkPasswordStmt.setString(2, oldPassword);
            ResultSet checkPasswordRs = checkPasswordStmt.executeQuery();

            if (checkPasswordRs.next()) {
                // 原密码正确，执行密码更新
                String updateQuery = "UPDATE student SET password = ? WHERE username = ?";
                PreparedStatement updateStmt = con.prepareStatement(updateQuery);
                updateStmt.setString(1, newPassword);
                updateStmt.setString(2, "admin");

                int rowsUpdated = updateStmt.executeUpdate();

                if (rowsUpdated > 0) {
                    resp.sendRedirect("login.jsp"); // 密码修改成功后跳转到 admin.html 页面
                } else {
                    PrintWriter out = resp.getWriter();
                    out.println("<script>alert('密码修改失败');</script>");
                }

                updateStmt.close();
            } else {
                // 原密码不正确
                PrintWriter out = resp.getWriter();
       
                out.println("<script>alert('原密码不正确'); window.location.href='password.html';</script>");
            }

            checkPasswordRs.close();
            checkPasswordStmt.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
