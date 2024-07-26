<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>deleting book</title>
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
	String isbn=request.getParameter("isbn");
	String bname=request.getParameter("bname");
	String author=request.getParameter("author");
	String quantity=request.getParameter("quantity");
	try{
		if(Integer.parseInt(quantity)<0)
		{
			session.setAttribute("error", "Enter a positive valid number");
			response.sendRedirect("availablebooks.jsp");
			//throw new Exception("Enter a positive valid number");
		}
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(dao.url,dao.username,dao.pass);
		stmt=con.createStatement();
		String sql="SELECT * FROM "+dao.booktable+" WHERE isbn='"+isbn+"'";
		resultset=stmt.executeQuery(sql);
		if(resultset.next())
		{
			int q=resultset.getInt("quantity");
			int intquantity=Integer.parseInt(quantity);
			
			if(intquantity<q)
			{
				int tquantity=q-intquantity;
				int i=stmt.executeUpdate("UPDATE "+dao.booktable+" SET quantity='"+tquantity+"' WHERE isbn='"+isbn+"' AND bname='"+bname+"' AND author='"+author+"'");
				
				if(i>0){
					response.sendRedirect("availablebooks.jsp");
				}
				else{
					session.setAttribute("error", "please enter correct details of book to decrease quantity of book");
					response.sendRedirect("availablebooks.jsp");
					//throw new Exception("please enter correct details of book to increase quantity of book");
				}
			}
			else if(intquantity==q)
			{
				int i=stmt.executeUpdate("DELETE FROM "+dao.booktable+" WHERE isbn='"+isbn+"'"); 
				if(i>0)
				{
					response.sendRedirect("availablebooks.jsp");
				}
			}
			else{
				session.setAttribute("error", "specified quantity no.of books are not available");
				response.sendRedirect("availablebooks.jsp");
				//throw new Exception("specified quantity no.of books are not available");
			}
		}
		else
		{	
			session.setAttribute("error", "Book does't exists");
			response.sendRedirect("availablebooks.jsp");
			//throw new Exception("Book does't exists");
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