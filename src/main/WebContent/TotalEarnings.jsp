<<<<<<< HEAD
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
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    	<style type="text/css">
		.body {
			background-color: #ffe5e5;
		}
	</style>
    <title>Total Earnings</title>   
    <body class ="body">
	    <br>
       <%
        	try 
		{
          
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
		
			String totalEarnings = "SELECT SUM(currentBidPrice - initialPrice) as 'Total Earnings' FROM auction WHERE auction.isOPen = false";
	
			ResultSet result = stmt.executeQuery(totalEarnings);
					
			if(result.next()) {
				String sum = result.getString("Total Earnings");
				if(sum == null) {
					sum = "0";
				}
				out.println("Total Earnings: " + sum);
			} 
		} catch(Exception ex) {
			out.print(ex);
		}				
	%>
		<br>
		<br>
	     <input type="button" value="Return" onclick=location.href="AdminPage.jsp">	
	     <br>
      
</body>
=======
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
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    </head>
    	<style type="text/css">
		.body {
			background-color: #ffe5e5;
		}
	</style>
    <title>Total Earnings</title>   
    <body class ="body">
	    <br>
       <%
        	try 
		{
          
			ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			Statement stmt = con.createStatement();
		
			String totalEarnings = "SELECT SUM(currentBidPrice - initialPrice) as 'Total Earnings' FROM auction WHERE auction.isOPen = false";
	
			ResultSet result = stmt.executeQuery(totalEarnings);
					
			if(result.next()) {
				String sum = result.getString("Total Earnings");
				if(sum == null) {
					sum = "0";
				}
				out.println("Total Earnings: " + sum);
			} 
		} catch(Exception ex) {
			out.print(ex);
		}				
	%>
		<br>
		<br>
	     <input type="button" value="Return" onclick=location.href="AdminPage.jsp">	
	     <br>
      
</body>
>>>>>>> 989e22749a936039f0451df7b162f565dde770b7
</html>    