<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.AuctionSite.*"%>
<%@ page import="java.util.stream.Collectors" %>
<%@ page language="java" import="com.dbproj.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<style type="text/css">
		.body {
			background-color: #ffe5e5;
		}
		</style>
	</head>
	<body class ="body">
	<br>
	REMOVE AUCTION:
	<br>
		<form method="get" action="RemoveAuction.jsp">
					<label for="AuctionID">Auction ID:</label><br>
					<input type="text" id="AuctionID" name="AuctionID">
					<input type="submit" value="Remove Auction">
		</form>
	<br>
	REMOVE BID:
	<br>
		<form method="get" action="RemoveBid.jsp">
				<label for="BidID">Bid ID:</label><br>   
				<input type="text" id=BidID name="BidID">
				<input type="submit" value="Remove Bid">
		</form>
	<br>
	REMOVE ACCOUNT:
	<br>
		<form method="get" action="RemoveAccount.jsp">
				<label for="accountID">Account ID:</label><br>   
				<input type="text" id ="accountID" name="accountID">
				<input type="submit" value="Remove Account">
		</form>
	<br>
	EDIT ACCOUNT:
	<br>
		<form method="get" action="EditAccount.jsp">    
			<label for="accountID">Account ID:</label><br>   
			<input type="text" id ="accountID" name="accountID"><br>
			<label for="newusername">New Username:</label><br> <input type="text" id ="newusername" name="newusername"><br>
			<label for="pass">New Password:</label><br> <input type="text" id = "pass" name="pass"><br>
			<label for="type">Change Type:</label><br><input type="text" id="type" name="type"><br>
			<br>
			<input type="submit" value="Edit Account">
		</form>
	<br>
	
	ACCESS FORUM:
	
	<br>
	
	<input type="button" value="Forum" onclick=location.href="Forum.jsp">
	
	<br>
	<br>
	
	<input type="button" value="Log Out" onclick=location.href="InfoPage.jsp">
	
	</body>

</html>