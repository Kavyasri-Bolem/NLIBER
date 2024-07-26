<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.ils.dao.ilsdata"%>
<%ResultSet resultset =null;%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>adding</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<style>
body{
background-color:#F1F1F1;}
table{
border:1px solid black;
font-family:cursive;
font-size:16px;
border-collapse: collapse;
padding:10px;
}
.center3{
position:absolute;
top:50%;
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
top:90%;
left:34%;
transform:translate(-50%,-50%);
}
::-webkit-scrollbar{
width:0px;
background:transparent;
}
.alert{
  background-color:#F1F1F1;
  position:fixed;
  top: 0;
  margin-left: 35%;
  color:black;
  display:block;
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

</style>
</head>
<body>
<%
ilsdata dao=new ilsdata();
String id=(String)session.getAttribute("id");
String ename=(String)session.getAttribute("ename");
String same=(String)session.getAttribute("same");
String book=(String)session.getAttribute("book");
if(id!=null && ename!=null){
%> <div class="center1">
<h1><%out.println(id);%></h1>
</div>
<div class="center4">
<h1><%out.println(ename);%></h1>
</div>
<%
if(same==null){
}
else{
	%>
	<span class="alert alert-warning alert-dismissible fade show" role="alert">
	<div class="cross"><strong>Message</strong>
	<button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
	<br><br>
	</div>
	                <%out.println(same); %>
	                <button type="button" class="btnclose" data-bs-dismiss="alert" aria-label="Close">OK</button>
	               
	            </span> 
	  <% 
	  session.removeAttribute("same");
}
if(book==null){
}
else{
	%>
	<span class="alert alert-warning alert-dismissible fade show" role="alert">
	<div class="cross"><strong>Message</strong>
	<button type="button" class="btn-close btn-sm" data-bs-dismiss="alert" aria-label="Close"></button>
	<br><br>
	</div>
	                <%out.println(book); %>
	                <button type="button" class="btnclose" data-bs-dismiss="alert" aria-label="Close">OK</button>
	               
	            </span> 
	  <% 
	  session.removeAttribute("book");
}
try{
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/liber","root","");
	Statement st = connection.createStatement() ;
	ResultSet rs=st.executeQuery("select * from "+dao.booktable);
	%>
	<div class="center3">
	<div style="height:450px; overflow-y: scroll; margin:0;padding:0">
	<table align="center" bgcolor="white" border="1" cellspacing="0" height="20%">
    <tr height="25%">

    <th width="20%" >ISBN</th>
    <th width="20%" >BOOK NAME</th>
    <th width="20%" >AUTHOR</th>
    <th width="20%" >COUNT</th>
    </tr>
    <%
	while(rs.next()){
		int c=Integer.parseInt(rs.getString("quantity"));
		if(c>=1){
		%>
		
		<tr align="center" style="height:90px">
		<td width="20%" ><%=rs.getString("isbn") %></td>
		<td width="20%" ><%=rs.getString("bname") %></td>
		<td width="20%" ><%=rs.getString("author") %></td>
		<td width="20%" ><%=rs.getString("quantity") %></td>
		</tr>
		<%
		}
	}
    
}
    catch(Exception e)
    {
         out.println("wrong entry"+e);
    }
}
else{
	response.sendRedirect("issue.jsp");
}
%>
</table>
</div>
</div>
<div class="center2">
<form action="iupdate.jsp">
<label>ISBN:</label><input type="text" id="isbn" name="isbn" required>
<input type="submit" value="ok">
</form>
</div>
</body>
</html>