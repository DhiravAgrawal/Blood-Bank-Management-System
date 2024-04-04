<%@page import="Project.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@include file="header.html"%>
<%
String id = request.getParameter("id");
String name = request.getParameter("name");
String father = request.getParameter("father");
String mother = request.getParameter("mother");
String mobilenumber = request.getParameter("mobilenumber");
String email = request.getParameter("email");
String address = request.getParameter("address");
try{
	Connection con = ConnectionProvider.getCon();
	PreparedStatement ps = con.prepareStatement("update doner set name=?,father=?,mother=?,mobilenumber=?,email=?,address=? where id=?");
	ps.setString(1, name);
	ps.setString(2, father);
	ps.setString(3, mother);
	ps.setString(4, mobilenumber);
	ps.setString(5, email);
	ps.setString(6, address);
	ps.setString(7, id);
	ps.executeUpdate();
	response.sendRedirect("editDeleteList.jsp?msg=valid");
}
catch(Exception e){
	response.sendRedirect("editDeleteList.jsp?msg=invaild");
}

%>