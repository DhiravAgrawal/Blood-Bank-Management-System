<%@page import="Project.ConnectionProvider"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%@include file="header.html"%>
<%
String mobilenumber=request.getParameter("mobilenumber");
try
{
Connection con= ConnectionProvider.getCon();
PreparedStatement ps = con.prepareStatement("update bloodrequest set status ='completed' where mobilenumber=? ");
ps.setString(1,mobilenumber);
ps.executeUpdate();
response.sendRedirect("requestForBlood.jsp");
}
catch(Exception e)
{
	response.sendRedirect("requestForBlood.jsp");
}
%>