<%@page import="Project.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
	String id = request.getParameter("id");
	String name = request.getParameter("name");
	String father = request.getParameter("father");
	String mother = request.getParameter("mother");
	String mobilenumber = request.getParameter("mobilenumber");
	String gender = request.getParameter("gender");
	String email = request.getParameter("email");
	String bloodgroup = request.getParameter("bloodgroup");
	String address = request.getParameter("address");
	
	try{
		Connection con = ConnectionProvider.getCon();
		PreparedStatement ps = con.prepareStatement("insert into doner values(?,?,?,?,?,?,?,?,?)");
		ps.setString(1,id);
		ps.setString(2,name);
		ps.setString(3,father);
		ps.setString(4,mother);
		ps.setString(5,mobilenumber);
		ps.setString(6,gender);
		ps.setString(7,email);
		ps.setString(8,bloodgroup);
		ps.setString(9,address);
		ps.executeUpdate();
		response.sendRedirect("addNewDonor.jsp?msg=valid");
	}
	catch(Exception e){
		System.out.println(e);
		response.sendRedirect("addNewDonor.jsp?msg=invalid");
	}
%>