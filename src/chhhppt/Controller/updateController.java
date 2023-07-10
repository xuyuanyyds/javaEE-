package chhhppt.Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import chhhppt.model.*;
@WebServlet("/userupdate")
public class updateController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		this.doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		String sno= req.getParameter("sno");
		String sname= req.getParameter("sname");
		String data= req.getParameter("data");
		String sage= req.getParameter("sage");
		String ssex= req.getParameter("ssex");
		String userphone= req.getParameter("userphone");
		String userAddress = req.getParameter("userAddress");
		String userfff= req.getParameter("userfff");
		
		user pd = new user();
		pd.setUserId(sno);
		pd.setUserName(sname);
		pd.setData(data);
		pd.setAge(Integer.parseInt(sage));
		pd.setSex(ssex);
		pd.setUserphone(userphone);
		pd.setUserAddress(userAddress);
		pd.setA(userfff);
		//调用修改的方法
		pd.updateUser();
		req.getRequestDispatcher("userList.jsp").forward(req, resp);
	}
}


