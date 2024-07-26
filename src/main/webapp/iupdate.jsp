<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*"%>
<%@page import="com.ils.dao.ilsdata"%>
<%ResultSet resultset =null;%>
<html>
<head>
<!--  
<script>
function same(){
	window.location.href = "details.jsp";
	window.alert("same book will not be provided again");
	
}
function books(){
	alert("We don't have that book");
	window.location.href = "add.jsp";
}
function sample(){
	alert("OOPS! something went wrong..");
	window.location.href = "details.jsp";
}
function issue(){
	alert("Book issued successfully");
	window.location.href = "details.jsp";
}
</script>
-->
</head>
<body>
<%
ilsdata dao=new ilsdata();
try{

String id=(String)session.getAttribute("id");

String ename=(String)session.getAttribute("ename");

if(id!=null && ename!=null){
String isbn=request.getParameter("isbn");
String next="details.jsp";
String next2="add.jsp";


    Class.forName("com.mysql.jdbc.Driver");
   Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/liber","root","");
   Statement st = con.createStatement() ;
   Statement st1 = con.createStatement() ;
   ResultSet rs1=st1.executeQuery("select * from "+dao.booktable+" where isbn='"+isbn+"'");
   if(rs1.next()){
	   String bnamee=rs1.getString("bname");
	   String bname = bnamee.replace("'", "");
	   
	   String author=rs1.getString("author");
   	   ResultSet rs=st.executeQuery("select * from "+dao.issuetable+" where empid='"+id+"' and isbn='"+isbn+"'");
   		if(rs.next()){
   			
   			int c=Integer.parseInt(rs.getString("count"));
   			if(c>=1){
	   			String same="Same Book will not be provided again";
   				session.setAttribute("same",same);
   				response.sendRedirect(next2);
	   /**
	   PreparedStatement ps= con.prepareStatement("update issue set count=(select sum(count+1) from issue where empid='"+id+"' and isbn='"+isbn+"') where empid='"+id+"' and isbn='"+isbn+"'");
	   ps.executeUpdate();
   		**/
   			}
   			else if(rs.getString("rdate")!=null){
   		/**	PreparedStatement ps= con.prepareStatement("update "+dao.issuetable+" set count=(select sum(count+1) from issue where empid='"+id+"' and isbn='"+isbn+"') where empid='"+id+"' and isbn='"+isbn+"'");
   			   ps.executeUpdate();
   		
   			   int k=1;
   			PreparedStatement ps3= con.prepareStatement("update "+dao.issuetable+" set nft=(select sum(nft+?) from issue where empid='"+id+"' and isbn='"+isbn+"') where empid='"+id+"' and isbn='"+isbn+"'");
   			ps3.setInt(1,k);
  	   		ps3.executeUpdate();
  	   		**/
  	   		int count=1;
  	     	Statement st2 = con.createStatement() ;
  	   		st2.executeUpdate("insert into "+dao.issuetable+" (empid,empname,isbn,bname,author,count) values ('"+id+"','"+ename+"','"+isbn+"','"+bname+"','"+author+"','"+count+"')");
   			PreparedStatement ps2= con.prepareStatement("update "+dao.booktable+" set quantity=(select sum(quantity-1) from books where isbn='"+isbn+"') where isbn='"+isbn+"'");
  	  		ps2.executeUpdate();
  	  		
  	  	String issue="Book issued successfully";
			session.setAttribute("issue",issue);
			
  			response.sendRedirect(next);
   				}
   			}
  	 	else{
  			int count=1;
  			PreparedStatement ps4= con.prepareStatement("update "+dao.emptable+" set nob=(select sum(nob+1) from employee where eid='"+id+"') where eid='"+id+"'");
		    ps4.executeUpdate();
		    PreparedStatement ps5= con.prepareStatement("update "+dao.booktable+" set nop=(select sum(nop+1) from books where isbn='"+isbn+"') where isbn='"+isbn+"'");
		    ps5.executeUpdate();
		    
   			st.executeUpdate("insert into "+dao.issuetable+" (empid,empname,isbn,bname,author,count) values ('"+id+"','"+ename+"','"+isbn+"','"+bname+"','"+author+"','"+count+"')");
       		session.setAttribute("id",id);
   			PreparedStatement ps1= con.prepareStatement("update "+dao.booktable+" set quantity=(select sum(quantity-1) from books where isbn='"+isbn+"') where isbn='"+isbn+"'");
  	  		ps1.executeUpdate();
  	  	String issue="Book issed successfully";
			session.setAttribute("issue",issue);
  			response.sendRedirect(next); 
  	 		}
   	}
   else{
	   String book="We don't have that book";
		session.setAttribute("book",book);
		response.sendRedirect(next2);
   }
}
else{
	response.sendRedirect("issue.jsp");
}
}
catch (Exception e) {
	/**String error="OOPS! something went wrong";
			session.setAttribute("error",error);
			response.sendRedirect("details.jsp");**/
			out.println(e);
}

%>
</body>
</html>