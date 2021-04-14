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
				  background: #9b9b9b;
				  padding: 20px;
				}
				
				ol li {
					list-style-type: none;
				}
			</style>
			
			<style type="text/css">	 
				.container { 
					width:100% ; 
					margin-bottom: 200px;
					background-color: lightblue;
				}
					
				.align-left { 	
					float: left ; 
					width:50% ; 
				}
					
				.align-right { 
					float: right ;
					width:50% ; 
				 }
				.item-container {
					display: flex;
					flex-direction: row;
					align-items: center;
					background: #ffe5e5;
				  	margin-left: 20px;
				  	margin-bottom: 20px;
				  	padding: 8;
				  	height: 100px;
				}
				.sub-container {
					display: 'flex';
					flex-direction: 'column';
					padding-left: 20px;
					}
				.description-container {
					marginTop: 8px;
					marginBottom: 8px;
					
					}
				.fit-picture {
				    width: 100px;
				}
				.right-align-sub-container{
					margin-left: auto;
					margin-right: 20px;
				}
			</style> 

		</head>

	<body BGCOLOR="#e6e6e6">
		<CENTER>     
			<H2>Browse Items</H2>
			
			<div class='container'>
			
			<div  class='align-left' >		
				<form action="">
				  <H3>Browse Items</H3>
				<input type="radio" id="all" name="itemType" value="all" checked >
				  	<label for="male">All</label><br>
				<input type="radio" id="bike" name="itemType" value="bike">
				  	<label for="bike">Bike</label><br>
				<input type="radio" id="truck" name="itemType" value="truck">
				  	<label for="truck">Truck</label>
			  	<input type="radio" id="car" name="itemType" value="car">
				  	<label for="car">Car</label>				
				</form>
			</div>

			<div class='align-right'>	
				<H3>Sort Availability </H3>    
					<form action="select" method="POST"> 
							<select name="All" >  
								<option> All </option>       
								<option> In Auction </option>     
								<option> Not In Auction </option>         
							</select>    
						<input type="submit" value="Submit"/> 
					</form> 
			</div>
			
			<div class='align-right'>	
				<H3>Sort By Criteria</H3>    
					<form action="select" method="POST"> 
							<select name="Any" >  
								<option> Any </option>         
								<option> Lowest Bid Price </option> 
								<option> Highest Bid Price </option>          
							</select>    
						<input type="submit" value="Submit"/> 
					</form> 
			</div>
			
			
			</div>



		</CENTER>
	  
	<% 
		try {
			
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			// Get All Items From Database
			String query = "Any";
			String auctionCriteria = "Any";
			
			if ( query.equals("Any") ) {
				query = "SELECT * FROM items";
			} else if ( query.equals("Bike") ){
				query = " SELECT * FROM items WHERE item_type = 'bike' ";
			} else if ( query.equals("Truck") ) {
				query = " SELECT * FROM items WHERE item_type = 'truck'";
			} else if ( query.equals("Car") ){
				query = " SELECT * FROM items WHERE item_type = 'car'";
			} 
						
			if ( auctionCriteria.equals("True") ){
				query = query + " and in_auction = true";
			} 	else if ( auctionCriteria.equals("False") ){
				query = query + " and in_auction = false";
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
				String img = null;
				if (item_type.equals("car")){
					img = "https://i.imgur.com/DOVgfjE.png";
				}	else if (item_type.equals("bike")){
					img = "https://i.imgur.com/f0gjT3e.gif";
				}	else if (item_type.equals("truck")){
					img = "https://i.imgur.com/PPtmo88.jpg";
				}
				
				%>
					<li  > 
							<div class='item-container' >
     							<div class='sub-container'>
										<img class="fit-picture"
										     src=<%= img %>
										     alt="">
								</div>		
								<div class='sub-container'>
									<div class='description-container'>
										Item ID: <%= String.valueOf(item_id) %>
									</div>
									<div class='description-container'>
				
									</div>
								</div>			
								<div class='sub-container'>
									<div class='description-container'>
										Model: <%= model_number %>
									</div>
									<div class='description-container'>
										Color: <%= color %>
										
									</div>
								</div>

								<div class='sub-container'>
									<div class='description-container'>
										Year: <%= String.valueOf(item_year) %>
									</div>
									<div class='description-container'>
										In Auction: <%= inAuction %>
									</div>
								</div>
								
								<div class='right-align-sub-container'> 
								
									<div class='sub-container'>
										<div class='description-container'>
											Bid: ??? 
										</div>
									</div>
									
									<div class='sub-container'>
										<button type="button"> View  </button>
									</div>
								
								</div>
								
							</div>
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
