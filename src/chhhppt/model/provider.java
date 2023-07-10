package chhhppt.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import chhhppt.utl.DBhelp;

public class provider {
private String id ; 
private String name;
private String li;
private String phone;
private String shijian;
private String bei;
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getLi() {
	return li;
}
public void setLi(String li) {
	this.li = li;
}
public String getPhone() {
	return phone;
}
public void setPhone(String phone) {
	this.phone = phone;
}
public String getShijian() {
	return shijian;
}
public void setShijian(String shijian) {
	this.shijian = shijian;
}
public String getBei() {
	return bei;
}
public void setBei(String bei) {
	this.bei = bei;
}
public provider getproviderByName(String name) {
    provider u = new provider();
    Connection con = DBhelp.getConn();
    try {
        PreparedStatement ps = con.prepareStatement("SELECT * FROM jjk WHERE name = ?");
        ps.setString(1, name);
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
