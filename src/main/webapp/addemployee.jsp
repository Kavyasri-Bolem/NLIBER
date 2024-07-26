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
	String eid=request.getParameter("eid");
	String ename=request.getParameter("ename");
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(dao.url,dao.username,dao.pass);
		stmt=con.createStatement();
		String sql="SELECT * FROM "+dao.emptable+" WHERE eid='"+eid+"'";
		resultset=stmt.executeQuery(sql);
		if(resultset.next())
		{
			session.setAttribute("error", "Employee id already exists");
			response.sendRedirect("empdetails.jsp");
			//throw new Exception("Employee id already exists");
		}
		else{
			int i=stmt.executeUpdate("insert into "+dao.emptable+" (eid,ename) values('"+eid+"','"+ename+"')"); 
			if(i>0)
			{
				response.sendRedirect("empdetails.jsp");
			}
			//out.println(i);
		}
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println(e);
	}

%>
</body>
</html>