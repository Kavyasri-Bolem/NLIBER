package com.ils.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServlet;



/**
 * Servlet implementation class ilsdata
 */
public class ilsdata extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String url="jdbc:mysql://localhost:3306/liber";
	public String username="root";
	public String pass="";
	public String emptable="employee";
	public String booktable="books";
	public String logintable="login";
	public String issuetable="issue"; 
	public boolean check(String uname,String password)
	{
		try {
			String sql="select * from login where username=? and password=?";
			Class.forName("com.mysql.jdbc.Driver");
			Connection con=DriverManager.getConnection(url,username,pass);
			PreparedStatement st=con.prepareStatement(sql);
			st.setString(1, uname);
			st.setString(2, password);
			ResultSet rs=st.executeQuery();
			if(rs.next()) {
				return true;
			}
			}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
