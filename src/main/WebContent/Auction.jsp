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
				.item-container {
					display: flex;
					flex-direction: row;
					align-items: center;
					background: #ffe5e5;
				  	margin-left: 20px;
				  	margin-bottom: 20px;
				  	padding: 8;
				  	height: 200px;
				}
				
				.container { 
					width:100% ; 
					background-color: lightblue;
				}
				
				.sub-container {
					display: 'flex';
					flex-direction: 'column';
					padding-left: 20px;
				}
				.right-align-sub-container{
					margin-left: auto;
					margin-right: 20px;
				}
				
				.fit-picture {
			    	width: 200px;
				}
			</style> 

		</head>

	<body BGCOLOR="#e6e6e6">
		<CENTER>     
			<H2>Item</H2>
			
			<div class='container'>
				<form  method="get">



				</form> 
			</div>



		</CENTER>
	  
	<% 
		try {
			
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
		
			// TO DO => GET ITEM ID FROM FROM BROWSEITEMS.JSP
			int item_id = 1;
			int auction_id = 1;
			
			// Query to get information abbout item and auction
			String query = "select * from items i inner join auction a where i.item_id = a.itemID and a.itemID =" + String.valueOf(item_id);
			
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			
			String item_type = null;
			String model_number = null;
			String color = null;
			int item_year = 0;
			boolean inAuction = false;
			String img = null;
			
			int auctionID = 0;
			int sellerID = 0;
			int buyerInLeadID = 0;
			double initialPrice = 0;
			double currentBidPrice = 0;
			double reservePrice = 0;
			double incrementVal = 0;
			boolean isOpen = false;

			while (rs.next()){
				 item_type = rs.getString("item_type");
				 model_number = String.valueOf(rs.getInt("model_number"));
				 color = rs.getString("color");
				 item_year = rs.getInt("item_year");
				 inAuction = rs.getBoolean("in_auction");
				 img = null;
				 
				if (item_type.equals("car")){
					img = "https://i.imgur.com/DOVgfjE.png";
				}	else if (item_type.equals("bike")){
					img = "https://i.imgur.com/f0gjT3e.gif";
				}	else if (item_type.equals("truck")){
					img = "https://i.imgur.com/PPtmo88.jpg";
				}
				
				 auctionID = rs.getInt("auctionID");
				 sellerID = rs.getInt("sellerID");
				 buyerInLeadID = rs.getInt("buyerInLeaderID");
				 initialPrice = rs.getFloat("initialPrice");
				 currentBidPrice = rs.getFloat("currentBidPrice");
				 reservePrice = rs.getFloat("reservePrice");
				 incrementVal = rs.getFloat("incrementVal");
				 isOpen = rs.getBoolean("isOpen");
				 
			}
			%>
			<div class='item-container'>		
				<div class='sub-container'>
					<div class='description-container'>
						Item ID: <%= String.valueOf(item_id) %>
					</div>
					<div class='description-container'>
						Seller ID:  <%= String.valueOf(sellerID) %>
					</div>
					<div class='description-container'>
						Current Bid:  $<%= String.valueOf(currentBidPrice) %>
					</div>
					<div class='description-container'>
						Current Bidder:  <%= String.valueOf(buyerInLeadID) %>
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
						<img class="fit-picture"
						     src= <%= img %>
						     alt=""
					     >
				</div>				
			</div>
			<% 
						
			
		} catch (Exception e) {
			System.err.println(e);
		}
	%>
			<div>
				<div>
					<h2> Create A Bid </h2>
					<form method="get">
					  <label for="bidPrice">Bid Price:</label><br>
					  <input type="text" id="bidPrice" name="bidPrice" value=""><br>
					  <label for="bidUpperLimit">Bid Upper Limit:</label><br>
					  <input type="text" id="bidUpperLimit" name="bidUpperLimit" value=""><br>
					   <input type="checkbox" id="automaticBid" name="automaticBid" value="true"> Automatic Bid </input> <br>
					  <input type="submit" value="Place Bid">
					</form> 
				</div>
			<div>
		</div>
	</div>
	
	<%
	// Form For The Bidder To Place Bid 
	try {
			Random rand = new Random();
			int item_id = 1;		// Get from Previous Page (Item List)
			int buyerID = 2;		// Get from the currently Signed In User. Again passing in data
			int bidID = rand.nextInt(1000);			// Get unique value from somewhere
			// Date/Time
			String date = "10/11/1996";
			String time = "9:00";
		if ( request.getParameter("bidPrice") != null & request.getParameter("bidUpperLimit") != null ) {
			// Get Data From Form
			double bidPrice = Double.parseDouble(request.getParameter("bidPrice"));
			double upperBidLimit = Double.parseDouble(request.getParameter("bidUpperLimit"));
			String automaticBid = request.getParameter("automaticBid");
			boolean automaticBidBool = false;
			if ("true".equals(automaticBid)){
				automaticBidBool = true;
			} 
			Bid bid1 = new Bid( buyerID, item_id,  bidID,  bidPrice,  upperBidLimit,  date,  time, automaticBidBool); 
			
			try {
		    	ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				
				Statement stmt = con.createStatement();
				//String query = "INSERT INTO items VALUES(\"" + this.itemType + "\", " + this.modelNumber + ", " + this.itemID + ", false, " + this.year + ", \"" + this.color + "\");";
				String insert = "INSERT INTO bid(buyerID, itemID, bidID, bidPrice, upperBidLimit, date, time, automaticBid, isActive)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setInt(1, buyerID);
				ps.setInt(2, item_id);
				ps.setInt(3, bidID);
				ps.setDouble(4, bidPrice);
				ps.setDouble(5, upperBidLimit);
				ps.setString(6, date);
				ps.setString(7, time);
				ps.setBoolean(8, automaticBidBool);
				ps.setBoolean(9, true);
				//Run the query against the DB
				ps.executeUpdate();
				
			} catch (Exception e){
				System.err.println(e);
			}
		}

		
		
		
		
		
		
		
		
	} catch (Exception e){
		System.err.println(e);
	}
	
	
	%>
	
	
	
	</body>
</html>
