<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.Connection" %>
<%@page import="com.ils.dao.ilsdata"%>

<%
	ilsdata dao=new ilsdata();
	Statement stmt=null;
	ResultSet resultset=null;
	String username=request.getParameter("username");
	username=username.toLowerCase();
	String password=request.getParameter("password");
	String sql="";
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(dao.url,dao.username,dao.pass);
		stmt=con.createStatement();
		sql="SELECT * FROM "+dao.logintable+" WHERE username='"+username+"'";
		resultset=stmt.executeQuery(sql);
		int st=0;
		while(resultset.next())
		{
			if((resultset.getString("username").equals(username))&&(resultset.getString("password").equals(password)))
			{
				response.sendRedirect("index.jsp");
			}
			else{
				st=1;
				session.setAttribute("error", "username and password does't match");
				//throw new Exception("username and password does't match");
				response.sendRedirect("login.jsp");
			} 
		} 
		if(st==0)
		{
		session.setAttribute("error", "No such user found");
		response.sendRedirect("login.jsp");
		}
		//throw new Exception("No such user found");
		//out.println("DELETE FROM "+dao.emptable+" WHERE eid="+eid);
	}
	catch(Exception e)
	{
		e.printStackTrace();
		//session.setAttribute("error", "No such user found");
		//response.sendRedirect("login.jsp");
		out.println(e);
		
	}

%>
</body>
</html>