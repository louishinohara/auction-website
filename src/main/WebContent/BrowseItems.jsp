<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="AuctionSite.*"%>
    
<%@ page language="java" import="com.dbproj.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>View Items Page</title>
			<style>
				ol {
				  background: #ff9999;
				  padding: 20px;
				}
				
				ol li {
				  background: #ffe5e5;
				  margin-left: 20px;
				  list-style-type: none;
				  margin-bottom: 20px;
				  padding: 8;
				}
			</style>
		</head>

	<body BGCOLOR="#ffffcc">
		<CENTER>     
			<H2>Browse Items</H2>     
			<form method="POST"> 
					<select id="ItemTypeOptions" name="All" >       
						<option value="All" >All</option>       
						<option value="Bike" >Bike</option>       
						<option value="Car" >Car</option>   
						<option value="Truck" >Truck </option> 
					</select>    
				<input type="submit" value="Select" /> 
			</form> 
			<H2>Sort By Criteria</H2>    
			<form action="select" method="POST"> 
					<select name="In Auction" >       
						<option> In Auction </option>     
						<option> Lowest Bid Price </option> 
						<option> Highest Bid Price </option>          
					</select>    
				<input type="submit"/> 
			</form> 
		</CENTER>
	  
	<% 
		try {
			AuctionSite auctionSite = new AuctionSite();

		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			// Get All Items From Database
			String query = "Bike";
			boolean viewActiveAuctionItems = true;
			
			if ( query.equals("Any") ) {
				query = "SELECT * FROM items";
			} else if ( query.equals("Bike") ){
				query = " SELECT * FROM items WHERE item_type = 'bike' ";
			} else if ( query.equals("Truck") ) {
				query = " SELECT * FROM items WHERE item_type = 'truck'";
			} else if ( query.equals("Car") ){
				query = " SELECT * FROM items WHERE item_type = 'car'";
			} 
						
			if ( viewActiveAuctionItems ){
				query = query + " and in_auction = true";
			}
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
	%>
		<ol>
			<%
			while (rs.next()) {
				String item_type = rs.getString("item_type");
				String model_number = String.valueOf(rs.getInt("model_number"));
				String color = rs.getString("color");
				int item_id = rs.getInt("item_id");
				int item_year = rs.getInt("item_year");
				boolean inAuction = rs.getBoolean("in_auction");
				%>
					<li> 
						<a href="#">  
							<div>
							Item ID: <%= String.valueOf(item_id) %>
							</div>
							<div>
							ItemType: <%= item_type %>
							</div>
							<div>
							Model: <%= model_number %>
							</div>
							<div>
							Year: <%= String.valueOf(item_year) %>
							</div>
							<div>
							Color: <%= color %>
							</div>
							<div>
							In Auction: <%= inAuction %>
							</div>
						  </a>
					</li>
				<% 
			}
			%>
		</ol> 
		<% 
		
		} catch (Exception ex) {
				out.print("Unable To Get Data");
		}
	%>
	
	</body>
</html>
