<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="com.ils.dao.ilsdata"%>
<%ResultSet rs =null;%>
<%
try{
ilsdata dao=new ilsdata();
String id=(String)session.getAttribute("id");
String isbn=request.getParameter("isbn");
String comment=request.getParameter("comment");
String next="books.jsp";
if(isbn==null){
	session.setAttribute("empty","No book is selected");
	response.sendRedirect(next);
}
else{
    Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/liber","root","");
   Statement st = con.createStatement() ;
   rs =st.executeQuery("select * from issue where empid='"+id+"' and isbn='"+isbn+"'");
  while(rs.next()){
	   if(rs.getInt("count")>0){
   PreparedStatement ps1= con.prepareStatement("update "+dao.booktable+" set quantity=(select sum(quantity+1) from books where isbn='"+isbn+"') where isbn='"+isbn+"'");
   ps1.executeUpdate();
   
   PreparedStatement ps3= con.prepareStatement("update "+dao.issuetable+" set comment='"+comment+"' where empid='"+id+"' and isbn='"+isbn+"' and count=?");
   ps3.setInt(1,1);
   out.println(ps3);
  ps3.executeUpdate();
   PreparedStatement ps2=con.prepareStatement("update "+dao.issuetable+" set rdate=? where empid='"+id+"' and isbn='"+isbn+"' and count=?");
   ps2.setInt(2,1);
   ps2.setTimestamp(1,new java.sql.Timestamp(new java.util.Date().getTime()));
  
   ps2.executeUpdate();
   PreparedStatement ps= con.prepareStatement("update "+dao.issuetable+" set count=? where empid='"+id+"' and isbn='"+isbn+"' and count=?");
   ps.setInt(1,0);
   ps.setInt(2,1);
   ps.executeUpdate();
   session.setAttribute("id",id);
  
	   }
   }
  
  String retur="Book returned succesfully";
  session.setAttribute("retur",retur);
  response.sendRedirect(next); 
}
}
catch (Exception e) {
	/**String error="oops! something went wrong";
	  session.setAttribute("error",error);
	  response.sendRedirect("books.jsp"); **/
	  out.println(e);
}
%>
   