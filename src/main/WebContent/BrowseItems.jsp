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
	  
	<% // Add items to list as test
		try {
			AuctionSite auctionSite = new AuctionSite();

		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			System.out.println("AAA");
			try {
			
			String query = "SELECT * FROM items";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			while (rs.next()) {
				String item_type = rs.getString("item_type");
				String model_number = String.valueOf(rs.getInt("model_number"));
				int item_id = rs.getInt("item_id");
				boolean inAuction = rs.getBoolean("in_auction");
				int item_year = rs.getInt("item_year");
				String color = rs.getString("color");
				
		        if (item_type.equals("bike")){
		            Bike bike = new Bike(item_id, model_number, inAuction, item_year, color);
		            auctionSite.addToItemList(bike, "bike");
		        } else if (item_type.equals("truck")){
		            Truck truck = new Truck(item_id, model_number, inAuction, item_year, color, 0);
		            auctionSite.addToItemList(truck, "truck");
		        } else if (item_type.equals("car")){
		            Car car = new Car(item_id ,model_number, inAuction, item_year, color, 0);
		            auctionSite.addToItemList(car, "car");
		        }
			}

		
		}catch(Exception E) {
			E.printStackTrace();
		}
		
        List<Item> itemList = auctionSite.getItemList();
        String itemTypeToFind = request.getParameter("All");
	%>
		
	
	<ol>
	<%	// Render those items
	for (int i = 0; i < itemList.size(); i++ ){
		Item item = itemList.get(i);
		int itemID = item.getItemID();
		%>
		<li> 
			<a href="#">  
				<div>
				Item ID: <%= itemID %>
				</div>
				<div>
				ItemType: <%= item.getItemType() %>
				</div>
				<div>
				Model: <%= item.getModelNumber() %>
				</div>
				<div>
				Year: <%= String.valueOf(item.getYear()) %>
				</div>
				<div>
				Color: <%= item.getColor() %>
				</div>
				<div>
				In Auction: <%= item.getInAuction() %>
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
