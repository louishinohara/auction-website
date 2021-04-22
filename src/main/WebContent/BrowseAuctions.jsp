<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.dbproj.pkg.*,com.AuctionSite.*"%>
    
 <%@ page import="java.io.*,java.util.*,java.sql.*,jakarta.servlet.ServletException.*,jakarta.servlet.annotation.WebServlet.*,jakarta.servlet.http.HttpServlet.*,jakarta.servlet.http.HttpServletRequest.*,jakarta.servlet.http.HttpServletResponse.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>View Auctions Page</title>
			<style>
				ol {
				  background: #9b9b9b;
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
			<H2>Browse Auctions</H2>
			
			<div class='container'>
				<form  method="get">
		
					<div class='align-left'>	
						<H3>Sort Availability </H3>    
							<select name="availability" >  
								<option value="null"> All </option>       
								<option value="open"> Open </option>     
								<option value="closed"> Closed </option>         
							</select>    
					</div>

					<div class='align-right'>	
						<H3>Sort Criteria (Buyer/Seller) </H3>    
							<select name="customerType" >  
								<option value="null"> All </option>       
								<option value="seller"> As Seller </option>     
								<option value="bidder"> As Bidder </option>         
							</select>    
					</div>
					
					<div class='align-right'>	
						<H3>Order By Criteria</H3>    
							<select name="orderBy" >  
								<option value="null"> Any </option>         
								<option value="lowest"> Lowest Bid Price </option> 
								<option value="highest"> Highest Bid Price </option>     
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
			int accountID = (Integer) session.getAttribute("accountID");
			// Get All Items From Database
			if ( request.getParameter("availability") != null ){
				String query = "";
				String availability = request.getParameter("availability");
												
				if ( availability.equals("All") ) {					// Get requested item
					// Do Nothing? 
				} else if ( availability.equals("null") ){
					query =  "SELECT a.auctionID, a.itemID, a.sellerID, a.initialPrice, a.currentBidPrice, a.isOpen, a.time, a.date, i.item_type FROM auction a INNER JOIN items i on i.item_id = a.itemID";
				} else if ( availability.equals("open") ) {
					query = " SELECT a.auctionID, a.itemID, a.sellerID, a.initialPrice, a.currentBidPrice, a.isOpen, a.time, a.date, i.item_type FROM auction a INNER JOIN items i on i.item_id = a.itemID where isOpen = true";
				} else if ( availability.equals("closed") ){
					query = " SELECT a.auctionID, a.itemID, a.sellerID, a.initialPrice, a.currentBidPrice, a.isOpen, a.time, a.date, i.item_type FROM auction a INNER JOIN items i on i.item_id = a.itemID where isOpen = false";
				} 
					
				
				String customerType = request.getParameter("customerType");
				
				if ( customerType.equals("bidder") ){
					 if ( availability.equals("null") ){
						query = "SELECT DISTINCT b.itemID, b.buyerID, a.auctionID, a.itemID, a.sellerID, a.initialPrice, a.currentBidPrice, a.isOpen, a.time, a.date, i.item_type FROM bid b INNER JOIN auction a ON b.itemID = a.itemID INNER JOIN items i ON b.itemID = i.item_ID where buyerID="+ String.valueOf(accountID);
					} else if ( availability.equals("open") ) {
						query = "SELECT DISTINCT b.itemID, a.auctionID, a.itemID, a.sellerID, a.initialPrice, a.currentBidPrice, a.isOpen, a.time, a.date, i.item_type FROM bid b INNER JOIN auction a ON b.itemID = a.itemID INNER JOIN items i ON b.itemID = i.item_ID where a.isOpen = true and buyerID="+ String.valueOf(accountID);
					} else if ( availability.equals("closed") ){
						query = "SELECT DISTINCT b.itemID, a.auctionID, a.itemID, a.sellerID, a.initialPrice, a.currentBidPrice, a.isOpen, a.time, a.date, i.item_type FROM bid b INNER JOIN auction a ON b.itemID = a.itemID INNER JOIN items i ON b.itemID = i.item_ID where a.isOpen = false and buyerID="+ String.valueOf(accountID);
					} 
				} else if (customerType.equals("seller")) {
					if ( availability.equals("null") ){
						query += " where sellerID =" + String.valueOf(accountID);
					} else {
						query += " and sellerID =" + String.valueOf(accountID);
					}
				} else {
					// Do Nothing
				}
				
				String orderBy = request.getParameter("orderBy");
				if ( orderBy.equals("lowest") ) {					// Get requested item
					query += " ORDER BY currentBidPrice ASC" ;
				} else if ( orderBy.equals("highest") ){
					query +=  " ORDER BY currentBidPrice DESC";
				}
				
				
				
				
				Statement stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery(query);
		%>
			<ol>
				<%
				while (rs.next()) {
					String auctionID = String.valueOf(rs.getInt("auctionID"));
					String itemID = String.valueOf(rs.getInt("itemID"));
					String sellerID = String.valueOf(rs.getInt("sellerID"));
					String initialPrice = String.valueOf(rs.getFloat("initialPrice"));
					String currentBidPrice = String.valueOf(rs.getFloat("currentBidPrice"));
					boolean inAuction = rs.getBoolean("isOpen");
					String date = rs.getString("time");
					String time = rs.getString("date");
					String item_type = rs.getString("item_type");
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
											Auction ID: <%= String.valueOf(auctionID) %>
										</div>
										<div class='description-container'>
											Item ID: <%= String.valueOf(itemID) %>
										</div>
									</div>			
									<div class='sub-container'>
										<div class='description-container'>
											SellerID: <%= sellerID %>
										</div>
										<div class='description-container'>
											Initial Price: $<%= initialPrice %>
											
										</div>
									</div>

									<div class='sub-container'>
										<div class='description-container'>
											Current Bid Price: $ <%= currentBidPrice %>
										</div>
										<div class='description-container'>
											In Auction: <%= inAuction %>
										</div>
									</div>
									
									
									<div class='sub-container'>
										<div class='description-container'>
											Date:  <%= date %> 
										</div>
										<div class='description-container'>
											Time:  <%= time %> 
										</div>
									</div>										
									 
									<div class='sub-container' method = "get" action="BrowseItems.jsp" style="cursor: pointer;" onclick=location.href="Auction.jsp">
										<button type="submit" > View  </button>
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
