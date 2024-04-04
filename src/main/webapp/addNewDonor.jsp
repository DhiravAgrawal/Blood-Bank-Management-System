<%@page import="Project.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@include file="header.html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <link rel="stylesheet" href="style.css" type="text/css" media="screen">
<style>
input[type="text"], input[type="password"], input[type="email"], select,input[type="number"]
{
    border: none;
    background:silver;
    height: 50px;
    font-size: 16px;
	padding:15px;
	width:60%;	
	border-radius: 25px;
	margin-left:20%;
}
h2,h1
{	
	margin-left:20%;
}
hr
{
width:60%;	
}
</style>
</head>
<body>
<%
	String msg = request.getParameter("msg");
	if("valid".equals(msg)){
		%>
		<center><font color="red" size="5">Successfully Updated</font></center>
		<%
	}
%>
<%
	if("invalid".equals(msg)){
		%>
		<center><font color="red" size="5">Some thing Went Wrong! Try Again.</font></center>
		<%
	}
%>



	<%
		int id=1;
		try{
			Connection con = ConnectionProvider.getCon();
			Statement st = con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_UPDATABLE);
			ResultSet rs = st.executeQuery("select max(id) from doner");
			System.out.println("done exe");
			if(rs.first()){
				id = rs.getInt(1);
				id = id+1;
			}	
		}
		catch(Exception e){
			System.out.println(e);
		}
	%>
<div class="container">
<h1 style="color:red;">Doner Id: <% out.println(id); %></h1>
</div>


<div class="container">
<form action="addNewDonorAction.jsp" method="post">
	<input type="hidden" name="id" value="<% out.println(id);%>"/>
	<h2>Name</h2>
	<input type="text" placeholder="Enter Name" name="name">
	<hr>
	<h2>Father Name</h2>
	<input type="text" placeholder="Father Name" name="father">
	<hr>
	<h2>Mother Name</h2>
	<input type="text" placeholder="Mother Name" name="mother">
	<h2>Mobile Number</h2>
	<input type="number" placeholder="Mobile Number" name="mobilenumber">
	<hr>
	<h2>Gender</h2>
	<select name="gender">
	<option value="male">Male</option>
	<option value="female">Female</option>
	<option value="other">Other</option>
	</select>
	<hr>
	<h2>Email</h2>
	<input type="email" placeholder="Enter Email" name="email">
	<hr>
	<h2>Blood Group</h2>
	<select name="bloodgroup">
	<option value="A+">A+</option>
	<option value="A-">A-</option>
	<option value="B+">B+</option>
	<option value="B-">B-</option>
	<option value="O+">O+</option>
	<option value="O-">O-</option>
	<option value="AB+">AB+</option>
	<option value="AB-">AB-</option>
	</select>
	<hr>
	<h2>Address</h2>
	<input type="text" placeholder="Enter Address" name="address">
	<br>
	<center><button type="submit" class="button">Save</button></center>
</form>


</div>

<br>
<br>
<br>
<br>
<h3><center>All Right Reserved :: 2023  </center></h3>

</body>
</html>