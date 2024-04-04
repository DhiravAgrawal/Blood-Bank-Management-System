<%@page import="Project.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@include file="header.html"%>
<html>
<head>
<style>
#customers {
  font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 95%;
}

#customers td, #customers th {
  border: 1px solid #ddd;
  padding: 8px;
}

#customers tr:nth-child(even){background-color: #f2f2f2;}

#customers tr:hover {background-color: #ddd;}

#customers th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: #4CAF50;
  color: white;
}
</style>
</head>
<body>
<br>
<center>

<table id="customers">
<tr>
<th>Name</th>
<th>Mobile Number</th>
<th>Email</th>
<th>Blood Group</th>
<th>Done</th>
<th>Delete</th>
</tr>

<%
try 
{
Connection con= ConnectionProvider.getCon();
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from bloodrequest where status='pending'");
 while(rs.next())
{
	
%>
<td><%=rs.getString(1) %>
<td><%=rs.getString(2) %>
<td><%=rs.getString(3) %>
<td><%=rs.getString(4) %>
<td><a href="requestForBloodDone.jsp?mobilenumber=<%=rs.getString(2) %> ">Done</a></td>
<td><a href="requestForBloodDelete.jsp?mobilenumber=<%=rs.getString(2) %> ">Delete</a></td>

</tr>
<%
	}
}
catch(Exception e)
{
	System.out.println(e);
	}
%>

</table>



</center>
<br>
<br>
<br>
<br>
<h3><center>All Right Reserved :: 2023  </center></h3>
</body>
</html>