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
		int i=stmt.executeUpdate("DELETE FROM "+dao.emptable+" WHERE eid='"+eid+"'"); 
		if(i>0)
		{
			response.sendRedirect("empdetails.jsp");
		}
		else
		{
			session.setAttribute("error", "Employee id does't exists");
			response.sendRedirect("empdetails.jsp");
			//throw new Exception("Employee id does't exists");
		}
		//out.println("DELETE FROM "+dao.emptable+" WHERE eid="+eid);
	}
	catch(Exception e)
	{
		e.printStackTrace();
		out.println(e);
		//out.println("DELETE FROM "+dao.emptable+" WHERE eid="+eid);
	}

%>
</body>
</html>