package chhhppt.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import chhhppt.utl.DBhelp;

import chhhppt.model.user;


public class user {
	private String userId;
	private String userName;
	private String userpassword;
	private String sex;
	private String data;
	private String userphone;
	private String userAddress;
	private int age;
	private String a;
	public String getA() {
		return a;
	}
	public void setA(String a) {
		this.a = a;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserpassword() {
		return userpassword;
	}
	public void setUserpassword(String userpassword) {
		this.userpassword = userpassword;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getUserphone() {
		return userphone;
	}
	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}
	public String getUserAddress() {
		return userAddress;
	}
	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}
	public void register() {
    	Connection con=DBhelp.getConn();
    	try {
			PreparedStatement ps = con.prepareStatement("insert into student(id,username,password,sex,age,data,phone,Address,userfff) values(?,?,?,?,?,?,?,?,?)");
			ps.setString(1, this.userId);
			ps.setString(2, this.userName);
			ps.setString(3, this.userpassword);
			ps.setString(4, this.sex);
			ps.setInt(5, this.age);
			ps.setString(6, this.data);
			ps.setString(7, this.userphone);
			ps.setString(8, this.userAddress);
			ps.setString(9, "普通用户");
			ps.executeUpdate();
			DBhelp.close(null, ps, con);
		} catch (SQLException e) {
			System.out.println("Failed to connect to the database.");
			e.printStackTrace();
		}
    
    }
	public user getProductById(String gg){
		user pd = new user();
		Connection con = DBhelp.getConn();
		try {
			PreparedStatement ps = con.prepareStatement("select * from student where username=?");
			ps.setString(2, gg);
			ResultSet rs = ps.executeQuery();
			rs.next();
			pd.setUserId(rs.getString("id"));
			pd.setUserName(rs.getString("username"));
			pd.setSex(rs.getString("sex"));
			pd.setAge(rs.getInt("age"));
			pd.setUserphone(rs.getString("phone"));
			pd.setA(rs.getString("userfff"));
			DBhelp.close(rs, ps, con);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return pd;
	}
	public user getUserByName(String userName) {
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
	 
	//修改商品
		public void updateUser() {
			Connection con = DBhelp.getConn();
			try {
				PreparedStatement ps = con.prepareStatement("update student set username=?,sex=?,age=?,data=?,phone=?,Address=?,userfff=? where id=?");
				ps.setString(1, this.userName);
				ps.setString(2, this.sex);
				ps.setInt(3, this.age);
				ps.setString(4, this.data);
				ps.setString(5, this.userphone);
				ps.setString(6, this.userAddress);
				ps.setString(7, this.a);
				ps.setString(8, this.userId);
				ps.executeUpdate();
				DBhelp.close(null, ps, con);
			} catch (SQLException e) {
				System.out.println("Failed to connect to the database.");
				e.printStackTrace();
			}
			
		}

}
