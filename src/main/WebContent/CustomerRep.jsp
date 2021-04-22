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
	REMOVE AUCTION: 
	</head>
	<body>
	<br>
		<form method="get" action="RemoveAuction.jsp">   
				<td>AuctionID</td><td><input type="text" name="auctionID"></td>
				<input type="submit" value="Remove Auction" onclick=location.href="RemoveAuction.jsp">
		</form>
	<br>
	REMOVE BID:
	<br>
		<form method="get" action="RemoveBid.jsp">   
				<td>BidID</td><td><input type="text" name="bidID"></td>
				<input type="submit" value="Remove Bid" onclick=location.href="RemoveBid.jsp">
		</form>
	<br>
	REMOVE ACCOUNT INFO:
	<br>
		<form method="get" action="RemoveAccount.jsp">   
				<td>username</td><td><input type="text" name="username"></td>
				<input type="submit" value="Remove Account" onclick=location.href="RemoveAccount.jsp">
		</form>
	<br>
	EDIT ACCOUNT:
	<br>
		<form method="get" action="EditAccount.jsp">   
				<td>username</td><td><input type="text" name="username"></td>
				<td>pass</td><td><input type="text" name="pass"></td>
				<td>type</td><td><input type="text" name="type"></td>
				<input type="submit" value="Edit Account" onclick=location.href="EditAccount.jsp">
		</form>
	<br>
	
	
	</body>

</html>
