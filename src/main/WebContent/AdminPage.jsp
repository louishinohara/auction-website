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
      <title>Admin<title>
	</head>
	<body>
		<%
		
		<input type="button" value="Create CustomerRep" onclick=location.href="Register.jsp">
		
		<input type="button" value="Total Earnings" onclick=location.href="TotalEarnings.jsp">
		
		<input type="button" value="Total Earnings Per Item" onclick=location.href="EarningsPerItem.jsp">
		
		<input type="button" value="Total Earnings Per Type" onclick=location.href="EarningsPerType.jsp">
		
		<input type="button" value="Total Earnings Per User" onclick=location.href="EarningsPerUser.jsp">
		
		<input type="button" value="Best Selling" onclick=location.href="BestSelling.jsp">
		
		<input type="button" value="Best Selling" onclick=location.href="BestBuyers.jsp">
		
		<input type="button" value="Return" onclick=location.href="Login.jsp">
		
	</body>
	
</html>
		  
        
