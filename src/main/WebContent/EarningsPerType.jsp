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
      		<title>Earning Per Item<title>
       </head>
       <body>
       <%
        	try 
			{
          
				ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();
		
				//craft query
				String totalEarningsCar = "SELECT SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Car FROM items i inner join auction a WHERE i.item_id = a.itemID and i.item_type == "car" and a.isOPen == false";
	
				//Run the query against the database.
				ResultSet result = stmt.executeQuery(totalEarningsCar);
					
				if(result.next()) {
					String sum = result.getString("Total Earnings Car");
					out.println("Total Earnigs Car: " + sum);
				}
						
				out.println(" ");
				out.println(" ");
						
				Statement stmt1 = con.createStatement();
		
				//craft query
				String totalEarningsTruck = "SELECT SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Trucks FROM items i inner join auction a WHERE i.item_id = a.itemID and i.item_type == "truck" and a.isOPen == false";
	
				//Run the query against the database.
				ResultSet result1 = stmt1.executeQuery(totalEarningsTruck);
					
				if(result1.next()) {
					String sum1 = result1.getString("Total Earnings Trucks");
					out.println("Total Earnigs Trucks: " + sum);
				}
					
				out.println(" ");
				out.println(" ");
						
				Statement stmt2 = con.createStatement();
		
				//craft query
				String totalEarningsBike = "SELECT SUM(a.currentBidPrice - a.initialBidPrice) as Total Earnings Bikes FROM items i inner join auction a WHERE i.item_id = a.itemID and i.item_type == "bike" and a.isOPen == false";
	
				//Run the query against the database.
				ResultSet result2 = stmt2.executeQuery(totalEarningsBike);
					
				if(result2.next()) {
					String sum2 = result2.getString("Total Earnings Bikes");
					out.println("Total Earnigs Bikes: " + sum);
				}
						
				out.println(" ");
				out.println(" ");
					
			} catch(Exception ex) {
						out.print(ex);
					}
					
			<input type="button" value="Return" onclick=location.href="AdminPage.jsp">	
				
				
	%>
      
</body>
</html>    
