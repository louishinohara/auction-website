<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="AuctionSite.*"%>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
      <title>Customer Rep Portal<title>
	</head>
	<body>
		<%
		
		<input type="button" value="Remove Bid" onclick=location.href="RemoveBid.jsp">
		
		<input type="button" value="Remove Auction" onclick=location.href="RemoveAuction.jsp">
		
		<input type="button" value="Edit User Account" onclick=location.href="EditUser.jsp">
		
		<input type="button" value="Remove User" onclick=location.href="RemoveUser.jsp">
		
		<input type="button" value="Enter Forum" onclick=location.href="Forum.jsp">
		
		<input type="button" value="Return" onclick=location.href="Login.jsp">
		
		%>
		
	</body>
	
</html>
