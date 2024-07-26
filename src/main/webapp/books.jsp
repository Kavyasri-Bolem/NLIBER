<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%ResultSet resultset =null;%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>    
<%@page import ="java.util.concurrent.TimeUnit" %>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.Period"%>
<%@page import="java.time.Duration"%>
<%@ page import="java.time.format.DateTimeFormatter" %>
<%@page import="com.ils.dao.ilsdata"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>books</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<style>
.alert{
  background-color:#F1F1F1;
  
  color:black;
  display:block;
  margin:0 auto;
  float:center;
  width:30%;
  hright:100%;
  }
  .alert .btnclose{
  float:right;
  marign-left:50px;
  background-color:#45b6fe;
  color:white;
  font-weight:bolder;
  width:50px;
  border-radius:5px;
  border:2px solid #3792cb;
  box-shadow:0px 15px 20px white;
  }
  .alert .cross{
  float:top;
  font-size:20px;
  text-align:align-right;
  }
  .alert .cross strong{
  font-size:20px;
  color:blue;
  }
table{
border:1px solid black;
font-family:cursive;
font-size:16px;
}
.center3{
position:absolute;
top:40%;
left:50%;
transform:translate(-50%,-50%);
}
.center1{
position:absolute;
top:5%;
left:50%;
transform:translate(-50%,-50%);
}
.center4{
position:absolute;
top:15%;
left:50%;
transform:translate(-50%,-50%);
}
.center2{
position:absolute;
top:150%;
left:30%;
transform:translate(-50%,-50%);
}
::-webkit-scrollbar{
width:0px;
background:transparent;
}
</style>
</head>
<body>

<%
ilsdata dao=new ilsdata();
String id = request.getParameter("id");
if(id!=null){
session.setAttribute("id",id);
}
else{
	id=(String)session.getAttribute("id");
	if (id==null){
		session.setAttribute("select","Select any Employee ID");
		response.sendRedirect("return.jsp");
	}
}
try{
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/liber","root","");
	Statement st = connection.createStatement() ;
	Statement st3 = connection.createStatement() ;
	Statement st2 = connection.createStatement() ;
	ResultSet rs1=st2.executeQuery("select * from "+dao.emptable+" where eid='"+id+"'");
	ResultSet rs=st.executeQuery("select * from "+dao.issuetable+" where empid='"+id+"'");
	while(rs1.next()){
		%>
		<div class="center1">
		<h1><%=rs1.getString(1) %></h1>
		</div>
		<div class="center4">
		<h1><%=rs1.getString(2) %></h1>
		<% String ename=rs1.getString(2);
		session.setAttribute("ename",ename);
		%>
		</div>
		<%
String retur=(String)session.getAttribute("retur");
String error=(String)session.getAttribute("error");
String empty=(String)session.getAttribute("empty");
if(empty==null){
}
else{
	%>
	<span class="alert alert-warning alert-dismissible fade show" role="alert">
	<div class="cross"><strong>Message</strong>
	<button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
	<br><br>
	</div>
	                <%out.println(empty); %>
	                <button type="button" class="btnclose" data-bs-dismiss="alert" aria-label="Close">OK</button>
	               
	            </span> 
	  <% 
	  session.removeAttribute("empty");
}
if(retur==null){
}
else{
	%>
	<span class="alert alert-warning alert-dismissible fade show" role="alert">
	<div class="cross"><strong>Message</strong>
	<button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
	<br><br>
	</div>
	                <%out.println(retur); %>
	                <button type="button" class="btnclose" data-bs-dismiss="alert" aria-label="Close">OK</button>
	               
	            </span> 
	  <% 
	  session.removeAttribute("retur");
}
if(error==null){
}
else{
	%>
	<span class="alert alert-warning alert-dismissible fade show" role="alert">
	<div class="cross"><strong>Message</strong>
	<button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
	<br><br>
	</div>
	                <%out.println(error); %>
	                <button type="button" class="btnclose" data-bs-dismiss="alert" aria-label="Close">OK</button>
	               
	            </span> 
	  <% 
	  session.removeAttribute("error");
}%>
		<center>
		<form action="delete.jsp">
  <%}%>
	<div class="center3">
	<div style="overflow-y:auto">
	<table align="center" bgcolor="white" border="1" cellspacing="0" height="20%">
    <tr height="25%">

    <th width="20%" >ISBN</th>
    <th width="20%" >BOOK NAME</th>
    <th width="20%" >AUTHOR</th>
    <th width="20%" >ISSUED DATE</th>
    <th width="20%">DURATION</th>
    </tr>
    <%
    int k=0;
	while(rs.next()){
		int c=Integer.parseInt(rs.getString("count"));
		if(c>=1){
			k+=1;
		%>
		
		<tr align="center" style="height:90px">
		<td width="20%" ><%=rs.getString("isbn") %></td>
		
		<td width="20%" ><%=rs.getString("bname") %></td>
		<td width="20%" ><%=rs.getString("author") %></td>
		<td width="20%" height="20%"><%=rs.getString("idate") %></div></td>
        <td with="20"><%
        String date=rs.getString("idate");
        LocalDate dateObj = LocalDate.now();
       SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
       DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
       String ndate = dateObj.format(formatter);
       java.util.Date odate=sdf.parse(date);
       java.sql.Date sodate=new java.sql.Date(odate.getTime());
       java.util.Date nedate=sdf.parse(ndate);
       java.sql.Date newdate=new java.sql.Date(nedate.getTime());
       int days=(int)((newdate.getTime()-sodate.getTime())/(1000*60*60*24));
       if(days==1){
    	   out.println(days+" day");
       }
       else{
        out.println(days+" days");
        }%>
		</td>
		</tr>
		<%
		}
	}
	%><tr>
	<h2>Total number of books to be returned:<%out.println(k);%></h2>
	</tr><%
}
    catch(Exception e)
    {
         out.println("wrong entry"+e);
    }
%>
        
</table>
</div>
<%
    try{
Connection connection = 
         DriverManager.getConnection
            ("jdbc:mysql://localhost:3306/liber","root","");

       Statement statement = connection.createStatement() ;

       resultset =statement.executeQuery("select * from "+dao.issuetable+" where empid='"+id+"'") ;
 
%>
<div class="center2">
<center>
    
        <select class="dropbtn" value="isbn" id="select1" name="isbn" >
        <%  while(resultset.next()){
        	int c=Integer.parseInt(resultset.getString("count"));
       if(c>=1){%>
        
            <option value="" disabled selected hidden>ISBN NO</option>
            <option  ><%= resultset.getString(3) %></option> 
       <% 
       }
       } %>
        </select>
        <label> #Comments:</label><input type="text" name="comment" id="comment"></input>
        <input type="submit" value="submit" >
      
</center>
</div>
		</form>
		<%
    }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>
</center>
</body>
</html>
