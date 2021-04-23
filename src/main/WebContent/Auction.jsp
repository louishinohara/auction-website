  
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.AuctionSite.*"%>
    
<%@ page language="java" import="com.dbproj.pkg.*"%>
    
<%@ page import="java.io.*,java.util.*,java.sql.*,java.text.SimpleDateFormat.*"%>
<%@ page import="java.util.Date.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<html>
		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
			<title>View Items Page</title>
			<style>
				ol {
				  background: #9b9b9b;
				  padding: 8px;
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
				.right-align-sub-container {
					margin-left: auto;
					margin-right: 20px;
				}
				
				.fit-picture {
			    	width: 200px;
				}
				
				.bid-container {
					display: 'flex';
					flex-direction: 'row';
					align-items: center;
				}
				
				.bid-container-left {
					float: left;
					width: 50%;
				}
				
				.bid-container-right {
					float: right;
					height: 500px; 
					width: 50%;
					overflow: hidden; 
					overflow-y:scroll; 
				}
				
				.bid-history-item {
					display: 'flex';
					flex-direction: 'row';
					height: 55px;
					background-color: #ffe5e5;
					padding: 8px;
					margin-bottom: 8px;
				}
				
				.bid-history-item-sub-container-left {
					float: left;
					display: 'flex';
					flex-direction: 'column';
					width: 50;
				}
				
				.bid-history-item-sub-container-right {
					float: right;
					display: 'flex';
					flex-direction: 'column';
					width: 50;
				}
			</style> 
		</head>

	<body BGCOLOR="#e6e6e6">
	
	<%
		// Global Variables For The Page
		String userName = (String) session.getAttribute("userName");
		String pass = (String) session.getAttribute("pass");
		int accountID = (Integer) session.getAttribute("accountID");
		int itemID = Integer.parseInt(request.getParameter("itemID"));
		boolean globalInAuction = true;
		boolean notCurrentBidder = false;
		boolean notSeller = false;
	%>
		<a href="Dashboard.jsp?username=<%=userName%>&pass=<%=pass%>"> <button>Back To Dash Board</button></a> 
		<CENTER>     
			<H2>Item <%=itemID%></H2>			
		</CENTER>
	<% 
		try {
			// Get Item Details From SQL
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
		
			int item_id = itemID;
			
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
				 inAuction = rs.getBoolean("isOpen");
				 globalInAuction = inAuction;
				 notSeller = accountID == sellerID;
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
				 notCurrentBidder = buyerInLeadID == accountID;
				 initialPrice = rs.getFloat("initialPrice");
				 currentBidPrice = rs.getFloat("currentBidPrice");
				 reservePrice = rs.getFloat("reservePrice");
				 incrementVal = rs.getFloat("incrementVal");
				 isOpen = rs.getBoolean("isOpen");
				 
			}	// Create the Pane On Top Which Displays The Items And It's Details
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
					<img class="fit-picture" src= <%= img %> alt="" >
				</div>				
			</div>
			
			<div class="bid-container">
				<div class="bid-container-left">
		<%
		if ( globalInAuction & !notCurrentBidder & !notSeller) {
		%>
			<h2> Create A Bid </h2>
			<h3> Current Price To Beat $<%= String.valueOf(currentBidPrice + incrementVal) %> </h3>
			<form method="get">
				<label for="itemID">Item ID:</label><br>
			  	<input type="text" id="itemID" name="itemID" value=<%= itemID%> ><br>
			  	<label for="bidPrice">Bid Price:</label><br>
			  	<input type="text" id="bidPrice" name="bidPrice" value=""><br>
			  	<input type="checkbox" id="automaticBid" name="automaticBid" value="true"> Automatic Bid </input> <br>
			  	<label for="bidUpperLimit">Bid Upper Limit:</label><br>
			  	<input type="text" id="bidUpperLimit" name="bidUpperLimit" value="0"><br>
			  	<input type="submit" value="Place Bid">
			</form> 
		<% 
		}
		%>
		</div>
			<h2> Bid History </h2>
			<div class="bid-container-right">
		       
		<%
	        try {
	        	// Get Bid History Information
				String bidQuery = String.format("select itemID, buyerID, bidID, bidPrice, date, time FROM bid WHERE itemID = %s ORDER BY bidPrice DESC", String.valueOf(item_id));
				ResultSet qrs = stmt.executeQuery(bidQuery);		
			%>
				<ol>
			<%
					while (qrs.next()){
						String buyerID = String.valueOf(qrs.getInt("buyerID"));
						String bidID = String.valueOf(qrs.getInt("bidID"));
						String bidPrice = String.valueOf(qrs.getInt("bidPrice"));
						String date =  qrs.getString("date") ;
						String time = qrs.getString("time");
			%>
						<li>
							<div class="bid-history-item">
								<div class="bid-history-item-sub-container-left">
									<div>
										Bid ID: <%= bidID %>
									</div>
									<div>
										Buyer ID: <%= buyerID %>
									</div>
									<div>
										Bid Price: $<%= bidPrice %>
									</div>
								</div>
								<div class="bid-history-item-sub-container-right">
									<div>
										Date: <%= date %>
									</div>
									<div>
										Time: <%= time %>
									</div>
								</div>
							</div>
						</li>
			<% 				
			}
			%>
			</ol>
			<%
		        } catch (Exception e){
		        	System.out.print(e);
		        }
		    %>
			</div>
		</div>
	
	<% 				
		} catch (Exception e) {
			System.err.println(e);
	}
	%>

	<%
	// Form For The Bidder To Place Bid 
		try {

			int item_id = itemID;						// Get from Previous Page (Item List)
			int buyerID = accountID;						// Get from the currently Signed In User. Again passing in data
			int bidID = 0;
			// Date/Time
			String date = String.valueOf(java.time.LocalDate.now());
		    java.util.Date day = new java.util.Date();
		    String strDateFormat = "HH:mm:ss a";
		    java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(strDateFormat);
			String time = String.valueOf(sdf.format(day));
			try {
				// Get the maxBid to create bidID
		    	ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();
				String query = "select max(bidID) from bid";
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()) {
					bidID = rs.getInt("max(bidID)") + 1;
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// If Bid Is Valid
			if ( request.getParameter("bidPrice") != null ) {
				
				// Get Data From Form
				double bidPrice = Double.parseDouble(request.getParameter("bidPrice"));
				double upperBidLimit = Double.parseDouble(request.getParameter("bidUpperLimit"));
				String automaticBid = request.getParameter("automaticBid");
				boolean automaticBidBool = false;
				
				// User has picked to use automaticBid
				if ("true".equals(automaticBid)){
					automaticBidBool = true;
				} 
				
				// Create New Bid
				Bid bid = new Bid( buyerID, item_id,  bidID,  bidPrice,  upperBidLimit,  date,  time, automaticBidBool); 
			 	
				// Add To Automatic Bidder and SQL
				// Create Automatic Bidding System
				AutomaticBidder automaticBidder = new AutomaticBidder(item_id, bidID);
				// Add the current bid with date and time
				automaticBidder.addBid(bid, item_id, date, time);
				// Contact Losers
				int customerToContact = automaticBidder.findBidWinner();
			}
			
		} catch (Exception e){
			System.err.println(e);
	}	
//=======================================================================================================================================================================================================================================
	%>

	<%!
		// Code For The Automatic Bid System
		public class AutomaticBidder {
	    private List<Bid> BidList; 
	    private Bid currBid;
	    private Bid newBid;
	    private int itemID;
	    private int bidID = 0;
	    private double currItemPrice;
	    private int buyerInLeaderID;
	    private double buyerInLeaderIDUpperLimit = 0;
	    private double incrementVal;
	    private int reservePrice; 
	    private int sellerID;
	    
	    public AutomaticBidder(int itemID, int bidID){
	        this.BidList = new ArrayList<Bid>();
	        this.itemID = itemID;
	        this.bidID = bidID;
	        getAuctionDetails();
	    }
	    

	    // Create a unique BIDID for this auction
	    public int createBidID(){ // This Code Is Good
	        this.bidID += 1;
	        return this.bidID;
	    }
	    
	    // Set Active Bid Inactive
	    public void setBidInactive(int bidID){
	    	ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			try {
				Statement stmt = con.createStatement();
				
		         String query = "UPDATE bid SET isActive=0 WHERE bidID=?";
		         PreparedStatement ps = con.prepareStatement(query);
		         ps.setInt(1, bidID);
		         ps.executeUpdate();
		        
		    } catch (Exception e){
		    	System.out.println(e);
		    }
	    }
	    
	    // Get details about auction
	    public void getAuctionDetails(){ // This Code Is Good
	    	
	    	ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			// Get Auction Details
			try {
				Statement stmt = con.createStatement();
				String query = "select * from auction where itemID = " + String.valueOf(this.itemID);
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()){
					this.buyerInLeaderID = rs.getInt("buyerInLeaderID");
					this.incrementVal = rs.getInt("incrementVal");
					this.reservePrice = rs.getInt("reservePrice");
					this.currItemPrice = rs.getInt("currentBidPrice");
				}
				
				// Get Bid Details
				query = "SELECT * FROM bid WHERE itemID = " + String.valueOf(this.itemID) + " AND isActive = 1";
				rs = stmt.executeQuery(query);
				// Add only the active bid to the list
				while (rs.next()){
					int buyerID = rs.getInt("buyerID");
					int itemID = rs.getInt("itemID");
					int bidID = rs.getInt("bidID");
					double bidPrice = rs.getFloat("bidPrice");
					double upperBidLimit = rs.getInt("upperBidLimit");
					String date = rs.getString("date");
					String time = rs.getString("time");
					boolean automaticBid = rs.getBoolean("automaticBid");
					Bid bid = new Bid(buyerID, itemID, bidID, bidPrice, upperBidLimit, date, time, automaticBid);
					this.currBid = bid;
				}

			} catch (Exception e){
				e.printStackTrace();
			}
	    }
	    
	    // Add Bid to list
	    public void addBid(Bid bid, int itemID, String date, String time){	// This Code Is Good
	    	// If bid is not the current top bidder which it won't be
	    	if (bid.getBuyerID() != this.buyerInLeaderID) {
	    		 //this.BidList.add(bid);
	    		 this.newBid = bid;
	 	    	ApplicationDB db = new ApplicationDB();	
	 			Connection con = db.getConnection();
	 			
	 			try {
	 				Statement stmt = con.createStatement();
	 				String insert = "INSERT INTO bid(buyerID, itemID, bidID, bidPrice, upperBidLimit, date, time, automaticBid, isActive)" + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	 				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
	 				PreparedStatement ps = con.prepareStatement(insert);
	 				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
	 				ps.setInt(1, bid.getBuyerID());
	 				ps.setInt(2, itemID);
	 				ps.setInt(3, bid.getBidID());
	 				ps.setDouble(4, bid.getCurrPrice());
	 				ps.setDouble(5, bid.getUpperBidLimit());
	 				ps.setString(6, date);
	 				ps.setString(7, time);
	 				ps.setBoolean(8, bid.getAllowAutomaticBidding());
	 				ps.setBoolean(9, true);
	 				ps.executeUpdate();
	 				
	 			} catch (Exception e){
	 				System.out.print(e);
	 			}
	    	}
	    }
		
	    // Update the auction in SQL
	    public void updateAuctionDetailsInSQL(double priceToBeat, int buyerID){
            this.currItemPrice = priceToBeat;
            this.buyerInLeaderID = buyerID;
            
	    	ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			try {
				Statement stmt = con.createStatement();
				
		         String query = "UPDATE auction SET buyerInLeaderID=?, currentBidPrice=? WHERE itemID=" + String.valueOf(this.itemID);;
		         PreparedStatement ps = con.prepareStatement(query);
		         ps.setInt(1, buyerID);
		         ps.setDouble(2, priceToBeat);
		         ps.executeUpdate();
		        
		    } catch (Exception e){
		    	System.out.println(e);
		    }
		}
	    
	    
	    // Automatic Bidding 
	    public int findBidWinner(){
			int loserBidVal = 0;
			boolean currBidAutomaticBiddingEnabled = this.currBid.getAllowAutomaticBidding();
			boolean newBidAutomaticBiddingEnabled = this.newBid.getAllowAutomaticBidding();
			
			if (!currBidAutomaticBiddingEnabled & !newBidAutomaticBiddingEnabled ) {				// Both Don't Have Automatic Bidding
				if ( this.newBid.getCurrPrice() > ( this.currItemPrice + this.incrementVal ) ) {	// New Bid Is Greater Than Old Bid
					// New Bid Wins
					// Update Auction With Bid Price and ID
					updateAuctionDetailsInSQL(this.newBid.getCurrPrice(), this.newBid.getBuyerID());
					// Set the current bid id as inactive
					setBidInactive(this.currBid.getBidID());
					// Send Alert That Buyer has been outbid
					String msg = "You have been outbid for item " + String.valueOf(this.itemID);
					sendAlert( this.currBid.getBuyerID(), msg );
				}
			} else if ( ( currBidAutomaticBiddingEnabled & !newBidAutomaticBiddingEnabled)  || ( !currBidAutomaticBiddingEnabled & newBidAutomaticBiddingEnabled ) ) {	// One of them has automatic
				
			} else {																		// They both have automatic bid
				
			}
			
			
			return loserBidVal;
	    }

	  public void checkReserveMet(){
		  if ( this.reservePrice <= this.currItemPrice ){
			  String msgForWinner = "Congrats. You have won item " + String.valueOf(this.itemID);
			  sendAlert(this.buyerInLeaderID, msgForWinner);
		  } else {
			  String reservePriceNotMetMsg = "Reserve price was not been met for " + String.valueOf(this.itemID) + ". Item not purchased.";
			  sendAlert(this.buyerInLeaderID, reservePriceNotMetMsg);
					  
			  String msgToSeller = "Reserve price was not been met for " + String.valueOf(this.itemID) + ". Item not sold.";
			  sendAlert(this.sellerID, msgToSeller);
		  }
	  }
		   
	  private int getAlertID(){
		  	ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			int alertID = 0;
			try {
				Statement stmt = con.createStatement();
				String query = "select max(alertID) from alert";
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()){
					alertID = rs.getInt("max(AlertID)")+ 1;
				}
				
			} catch (Exception e){
				System.out.println("6");
				System.out.println(e);
			}
			return alertID;
	  }
	  
	  public void sendAlert(int ID, String msg){
		  ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			try {
				Statement stmt = con.createStatement();
				String date = String.valueOf(java.time.LocalDate.now());
			     java.util.Date day = new java.util.Date();
			     String strDateFormat = "HH:mm:ss a";
			     java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat(strDateFormat);
				String time = String.valueOf(sdf.format(day));
				String insert = "INSERT INTO alert(alertID, itemID, buyerID, acknowledgedAlert, date, time, message)"
						+ "VALUES (?, ?, ?, ?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);
				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setInt(1, getAlertID());
				ps.setInt(2, this.itemID);
				ps.setInt(3, ID);
				ps.setBoolean(4, false);
				ps.setString(5, date);
				ps.setString(6, time);
				ps.setString(7,  msg );
				ps.executeUpdate();
				
			} catch (Exception e){
				System.out.println("7");
				System.err.println(e.getMessage());
				
			}
	  }
		

	    
	}
	

	%>
	</body>
</html>