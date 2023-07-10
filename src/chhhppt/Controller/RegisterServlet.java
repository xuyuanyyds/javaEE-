package chhhppt.Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chhhppt.model.user;
@WebServlet("/registeres")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		String userId= req.getParameter("userId");
		String userName=req.getParameter("userName");
		String userpassword= req.getParameter("userpassword");
		String sex= req.getParameter("sex");
		String age = req.getParameter("age");
		int ageInt = Integer.parseInt(age);
		String data = req.getParameter("data");
		String userphone = req.getParameter("userphone");
		String userAddress = req.getParameter("userAddress");
		user u= new user();
		u.setUserId(userId);
		u.setUserName(userName);
		u.setUserpassword(userpassword);
		u.setSex(sex);
		u.setAge(ageInt);
		u.setData(data);
		u.setUserphone(userphone);
		u.setUserAddress(userAddress);
		u.register();
		PrintWriter pw = resp.getWriter();
		pw.print("注册成功!<a href='index.html'>返回首页</a>");
	}
	

}
