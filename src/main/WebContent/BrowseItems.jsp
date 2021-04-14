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
				<form  method="get">
					<div  class='align-left' >		
						
						  <H3>Browse Items</H3>
						<input type="radio" id="all" name="itemType" value="All" checked >
						  	<label for="male">All</label><br>
						<input type="radio" id="bike" name="itemType" value="Bike">
						  	<label for="bike">Bike</label><br>
						<input type="radio" id="truck" name="itemType" value="Truck">
						  	<label for="truck">Truck</label>
					  	<input type="radio" id="car" name="itemType" value="Car">
						  	<label for="car">Car</label>				
					</div>
		
					<div class='align-right'>	
						<H3>Sort Availability </H3>    
							<select name="availability" >  
								<option value="null"> All </option>       
								<option value="true"> In Auction </option>     
								<option value="false"> Not In Auction </option>         
							</select>    
					</div>
					
					<div class='align-right'>	
						<H3>Sort By Criteria</H3>    
							<select name="Any" >  
								<option> Any </option>         
								<option> Lowest Bid Price </option> 
								<option> Highest Bid Price </option>          
							</select>    
						<input type="submit" value="Submit"/> 
					</div>
				</form> 
			</div>



		</CENTER>
	  
	<% 
		try {
			
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			// Get All Items From Database
			if ( request.getParameter("itemType") != null ){
				String query = null;
				String itemType = request.getParameter("itemType");
												
				if ( itemType.equals("All") ) {					// Get requested item
					query = "SELECT * FROM items ";
				} else if ( itemType.equals("Bike") ){
					query = " SELECT * FROM items WHERE item_type = 'bike' ";
				} else if ( itemType.equals("Truck") ) {
					query = " SELECT * FROM items WHERE item_type = 'truck' ";
				} else if ( itemType.equals("Car") ){
					query = " SELECT * FROM items WHERE item_type = 'car' ";
				} 
					
				String auctionCriteria = request.getParameter("availability");
				if ( !auctionCriteria.equals("null" )){			// If there is a scenario where we want to filter by availability
					if ( itemType.equals("All")){					// Case where we select all so no item filter
						query = query + "WHERE ";
					} else {
						query = query + "AND ";					// Where is already applied
					}
					
					if ( auctionCriteria.equals("true") ){
						query = query + "in_auction = true";
					} 	else if ( auctionCriteria.equals("false") ){
						query = query + "in_auction = false";
					}
					
				}

				
				System.out.println(query);
				
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
			
			}
			
		} catch (Exception ex) {
				out.print("Unable To Get Data");
		}
	%>
	
	</body>
</html>
