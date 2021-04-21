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
      <title>Sales Report<title>
        
    <body>
       <%
        	try {
          
	            	//Get the database connection
					ApplicationDB db = new ApplicationDB();	
					Connection con = db.getConnection();
					//Create a SQL statement
					Statement stmt = con.createStatement();
		
					//craft query
					String totalEarnings = "SELECT SUM(currentBidPrice - initialBidPrice) as Total Earnings FROM auction WHERE auction.isOPen == false";
	
					//Run the query against the database.
					ResultSet result = stmt.executeQuery(totalEarnings);
					
					if(result.next()) {
						String sum = result.getString("Total Earnings");
						out.println("Total Earnigs: " + sum);
						}
						
					out.println(" ");
					out.println(" ");
					
					Statement stmt1 = con.createStatement();
					//craft query
					String totalEarningsItem = "SELECT i.item_ID, SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Item FROM item i inner join auction a WHERE i.item_id = a.itemID and a.isOPen == false";
	
					//Run the query against the database.
					ResultSet result1 = stmt1.executeQuery(totalEarningsItem);
					
					out.println(""ItemID" + " " + "Item Earnings");
					
					while(result1.next()) {
						String sum = result1.getString("Total Earnings Items");
						String itemId = result1.getString("item_ID");
						out.println(itemID + " " + sum);
						}
						
					out.println(" ");
					out.println(" ");
					
					Statement stmt2 = con.createStatement();
		
					//craft query
					String totalEarningsCar = "SELECT SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Car FROM items i inner join auction a WHERE i.item_id = a.itemID and i.item_type == "car" and a.isOPen == false";
	
					//Run the query against the database.
					ResultSet result2 = stmt2.executeQuery(totalEarningsCar);
					
					if(result2.next()) {
						String sum2 = result2.getString("Total Earnings Car");
						out.println("Total Earnigs Car: " + sum);
						}
						
					out.println(" ");
					out.println(" ");
						
					Statement stmt3 = con.createStatement();
		
					//craft query
					String totalEarningsTruck = "SELECT SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Trucks FROM items i inner join auction a WHERE i.item_id = a.itemID and i.item_type == "truck" and a.isOPen == false";
	
					//Run the query against the database.
					ResultSet result3 = stmt3.executeQuery(totalEarningsTruck);
					
					if(result3.next()) {
						String sum3 = result3.getString("Total Earnings Trucks");
						out.println("Total Earnigs Trucks: " + sum);
						}
					
					out.println(" ");
					out.println(" ");
						
					Statement stmt3 = con.createStatement();
		
					//craft query
					String totalEarningsBike = "SELECT SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Bikes FROM items i inner join auction a WHERE i.item_id = a.itemID and i.item_type == "bike" and a.isOPen == false";
	
					//Run the query against the database.
					ResultSet result3 = stmt3.executeQuery(totalEarningsBike);
					
					if(result3.next()) {
						String sum3 = result3.getString("Total Earnings Bikes");
						out.println("Total Earnigs Bikes: " + sum);
						}
						
					out.println(" ");
					out.println(" ");
					
				} catch(Exception ex) {
						out.print(ex);
					}
					%>
      
</body>
</html>    
