<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dbproj.pkg.*,com.AuctionSite.*"%>
    
 <%@ page import="java.io.*,java.util.*,java.sql.*,jakarta.servlet.ServletException.*,jakarta.servlet.annotation.WebServlet.*,jakarta.servlet.http.HttpServlet.*,jakarta.servlet.http.HttpServletRequest.*,jakarta.servlet.http.HttpServletResponse.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>

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
					display: flex;
					flex-direction: row;
					align-items: center;
					justify-content: center;
				}
				.filter-items {
					flex: 1;
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
				
				.outer-sub-container {
					flex: 1;
				}
				
				.description-container {
					marginTop: 8px;
					marginBottom: 8px;
					
				}
					
				.fit-picture {
				    width: 100px;
				}
				
				.right-align-sub-container{
					margin-left: 50px ;
				
				}
				
				.button {
					margin-top: 10px;
				}
				
				.header {
					font-size: 14px;
					font-weight: bold;
				}
				
				.description {
					font-size: 14px;
					font-weight: normal;
				}
				
				.shrink-img {
					height: 90px;
					width: 90px;
				}
				
			</style> 
		</head>

	<body BGCOLOR="#e6e6e6">
	<%
		String userName = (String) session.getAttribute("userName");
		String pass = (String) session.getAttribute("pass");
	%>
	<a href="Dashboard.jsp?username=<%=userName%>&pass=<%=pass%>"> <button>Back To Dash Board</button></a> 
		<CENTER>     
			<H1>Browse Items</H1>
			<div > 
				<img class="shrink-img" src="https://i.imgur.com/ybxg3v2.png" />
			</div>
				<form  method="get">
					<div class='container'>
						<div class='filter-items'>	
							<H3>Sort By Item Type </H3>    
								<select name="itemType" >  
									<option value="null"> All </option>       
									<option value="bike"> Bike </option>     
									<option value="truck"> Truck </option>         
									<option value="car"> Car </option>  
								</select>    
						</div>
						
						<div class='filter-items'>	
							<H3>Sort Availability </H3>    
								<select name="availability" >  
									<option value="null"> All </option>       
									<option value="true"> In Auction </option>     
									<option value="false"> Not In Auction </option>         
								</select>    
						</div>
						
						<div class='filter-items'>	
							<H3>Sort By Criteria</H3>    
								<select name="sortBy" >  
									<option value="null"> Any </option>         
									<option value="lowest"> Lowest Bid Price </option> 
									<option value="highest"> Highest Bid Price </option>          
								</select>    
						</div>
					</div>
					<div class="button">
						<input type="submit" value="Submit"/> 
					</div>
				</form> 
			
		</CENTER>
	  
	<% 
		try {
			
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();

			// Get All Items From Database
			if ( request.getParameter("itemType") != null ){
				String query = " select i.item_type, i.model, i.item_id, i.item_year, i.color, i.img, i.location, i.transmission, i.mpg, i.miles, a.isOpen, a.currentBidPrice from items i inner join auction a on i.item_id = a.itemID ";
				String itemType = request.getParameter("itemType");
				
				if ( itemType.equals("All") ) {					// Get requested item
					// Do Nothing? 
				} else if ( itemType.equals("bike") ){
					query = query + " WHERE i.item_type = 'bike' ";
				} else if ( itemType.equals("truck") ) {
					query = query + " WHERE i.item_type = 'truck' ";
				} else if ( itemType.equals("car") ){
					query = query + " WHERE i.item_type = 'car' ";
				} 
					
				String auctionCriteria = request.getParameter("availability");
				if ( !auctionCriteria.equals("null" )){			// If there is a scenario where we want to filter by availability
					if ( itemType.equals("All")){					// Case where we select all so no item filter
						query = query + "WHERE ";
					} else {
						query = query + "AND ";					// Where is already applied
					}
					
					if ( auctionCriteria.equals("true") ){
						query = query + "a.isOpen = true";
					} 	else if ( auctionCriteria.equals("false") ){
						query = query + "a.isOpen = false";
					}
					
				}

				String sortBy = request.getParameter("sortBy");
				
				if ( !sortBy.equals("null" )){			// If there is a scenario where we want to filter by availability
					query = query + " order by ";
					
					if ( sortBy.equals("lowest") ){
						query = query + "a.currentBidPrice ASC ";
					} 	else if ( sortBy.equals("highest") ){
						query = query + "a.currentBidPrice DESC ";
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
					String model = rs.getString("model"); 
					String color = rs.getString("color");
					String currBid = "$" + String.valueOf(rs.getInt("currentBidPrice"));
					int item_id = rs.getInt("item_id");
					int itemID = rs.getInt("item_id");
					int item_year = rs.getInt("item_year");
					String location = rs.getString("location"); 
					String transmission = rs.getString("transmission");
					String mpg = rs.getString("mpg"); 
					String miles = rs.getString("miles");

					boolean inAuction = rs.getBoolean("isOpen");
					String img = rs.getString("img");
					if ( img.equals("null") ){
						if (item_type.equals("car")){
							img = "https://i.imgur.com/DOVgfjE.png";
						}	else if (item_type.equals("bike")){
							img = "https://i.imgur.com/f0gjT3e.gif";
						}	else if (item_type.equals("truck")){
							img = "https://i.imgur.com/PPtmo88.jpg";
						}
					} 
					
					
					%>
						<li  > 
								<div class='item-container' >
									<div class="outer-sub-container">
		     							<div class='sub-container'>
												<img class="fit-picture"
												     src=<%= img %>
												     alt="">
										</div>
									</div>
									<div class="outer-sub-container">			
										<div class='sub-container'>
											<div class='description-container'>
												<div class="header"> Model: <a class="description"> <%= model %></a></div>
											</div>
											<div class='description-container'>
												<div class="header"> Color: <a class="description"> <%= color %></a></div>
											</div>
											<div class='description-container'>
												<div class="header"> Year: <a class="description"> <%= String.valueOf(item_year) %></a></div>
											</div>
										</div>
									</div>	

									<div class="outer-sub-container">
										<div class='sub-container'>
											<div class='description-container'>
												<div class="header"> Transmission: <a class="description"> <%= transmission %></a></div>
											</div>
											<div class='description-container'>
												<div class="header"> MPG: <a class="description"> <%= mpg %></a></div>
											</div>
											<div class='description-container'>
												<div class="header"> Miles: <a class="description"> <%= miles %></a></div> 
											</div>
										</div>
									</div>
									
									<div class="outer-sub-container">
										<div class='sub-container'>
											<div class='description-container'>
												<div class="header"> Item ID: <a class="description"> <%= String.valueOf(item_id) %></a></div> 
											</div>
											<div class='description-container'>
												<div class="header"> Bid: <a class="description"> <%= currBid %></a></div>
											</div>
											<div class='description-container'>
												<div class="header"> In Auction: <a class="description"> <%= inAuction %></a></div>
											</div>
										</div>
									</div>
									
									<div class="outer-sub-container">
									 
											<div class='right-align-sub-container'>										
												<a href="Auction.jsp?itemID=<%=itemID%>"> <button type="submit">View Auction</button></a> 
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
