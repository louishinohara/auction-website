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
		<CENTER>     
			<H2>Item</H2>			

		</CENTER>
	  
	<% 
		try {
			
		    ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
		
			// TO DO => GET ITEM ID FROM FROM BROWSEITEMS.JSP
			int item_id = 2;
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
					<h2> Create A Bid </h2>
					<h3> Current Price To Beat $<%= String.valueOf(currentBidPrice + incrementVal) %> </h3>
					<form method="get">
					  <label for="bidPrice">Bid Price:</label><br>
					  <input type="text" id="bidPrice" name="bidPrice" value=""><br>
					   <input type="checkbox" id="automaticBid" name="automaticBid" value="true"> Automatic Bid </input> <br>
					   <label for="bidUpperLimit">Bid Upper Limit:</label><br>
					  <input type="text" id="bidUpperLimit" name="bidUpperLimit" value="0"><br>
					  <input type="submit" value="Place Bid">
					</form> 
				</div>
				
			<h2> Bid History </h2>
			<div class="bid-container-right">
		       
			<%
		        try {
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
										Buyer ID: <%= time %>
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
			Random rand = new Random();				// Temp til we get get unique bidID
			int item_id = 2;						// Get from Previous Page (Item List)
			int buyerID = rand.nextInt(1000);						// Get from the currently Signed In User. Again passing in data
			int bidID = 0;
			// Date/Time
			String date = "10/11/1996";
			String time = "9:00";
			try {
				// Get the maxBid to create bidID
		    	ApplicationDB db = new ApplicationDB();	
				Connection con = db.getConnection();
				Statement stmt = con.createStatement();
				String query = "select max(bidID) from bid";
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()){
					bidID = rs.getInt("max(bidID)") + 1;
				}
			} catch (Exception e){
				
			}
			if ( request.getParameter("bidPrice") != null ) {
				
				// Get Data From Form
				double bidPrice = Double.parseDouble(request.getParameter("bidPrice"));
				double upperBidLimit = Double.parseDouble(request.getParameter("bidUpperLimit"));
				String automaticBid = request.getParameter("automaticBid");
				boolean automaticBidBool = false;
				
				if ("true".equals(automaticBid)){
					automaticBidBool = true;
				} 
				// Idk if we'll need this
				Bid bid = new Bid( buyerID, item_id,  bidID,  bidPrice,  upperBidLimit,  date,  time, automaticBidBool); 
			 	
				// Add To Automatic Bidder and SQL
				AutomaticBidder automaticBidder = new AutomaticBidder(item_id, bidID);
				automaticBidder.addBid(bid, item_id, date, time);	//TODO Not sure why it gives me method error for these last 3 fields.
				automaticBidder.findBidWinner();
						
				if ( true ){
					automaticBidder.checkReserveMet();
				}
				
			}
			

					
		} catch (Exception e){
			System.err.println(e);
	}
	%>
	<%!
	
		public class AutomaticBidder {
	    private List<Bid> BidList; 
	    private int itemID;
	    private double currItemPrice;
	    private int buyerInLeaderID;
	    private int bidID = 0;
	    private double incrementVal;
	    private int reservePrice; 
		private int sellerID;
		
	    public AutomaticBidder(int itemID, int bidID){
	        this.BidList = new ArrayList<Bid>();
	        this.itemID = itemID;
	        this.bidID = bidID;
	        getAuctionDetails();
	   //     this.currItemPrice =  initialPrice;
	     //   this.incrementVal = incrementVal;
	    }

	    // Add Bid to list
	    public void addBid(Bid bid, int itemID, String date, String time){
	    	if (bid.getBuyerID() != this.buyerInLeaderID) {
	    		 this.BidList.add(bid);
	 	    	ApplicationDB db = new ApplicationDB();	
	 			Connection con = db.getConnection();
	 			try {
	 				Statement stmt = con.createStatement();
	 				//String query = "INSERT INTO items VALUES(\"" + this.itemType + "\", " + this.modelNumber + ", " + this.itemID + ", false, " + this.year + ", \"" + this.color + "\");";
	 				String insert = "INSERT INTO bid(buyerID, itemID, bidID, bidPrice, upperBidLimit, date, time, automaticBid, isActive)"
	 						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
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

	    // Get details about auction
	    public void getAuctionDetails(){
	    	ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			try {
				Statement stmt = con.createStatement();
				String query = "select * from auction where itemID = " + String.valueOf(this.itemID);
				ResultSet rs = stmt.executeQuery(query);
				
				while (rs.next()){
					this.buyerInLeaderID = rs.getInt("buyerInLeaderID");
					this.incrementVal = rs.getInt("incrementVal");
					this.reservePrice = rs.getInt("reservePrice");
					this.currItemPrice = rs.getInt("currentBidPrice");
					this.sellerID = rs.getInt("sellerID");
				}
				
				query = "SELECT * FROM bid WHERE itemID = " + String.valueOf(this.itemID) + " AND isActive = 1";
				rs = stmt.executeQuery(query);
				
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
					this.BidList.add(bid);
				}
				
			} catch (Exception e){
				System.out.println(e);
				
				
			}
	    }
	    // Automatic Bidding 
	    public void findBidWinner(){
	        List<Integer> customerToContact = new ArrayList<Integer>();
	        boolean keepGoing = true ;                                                                  // Keep Going terminates when there is only one active bid
	        while ( keepGoing ){
	            for ( int i = 0; i < this.BidList.size(); i++ ) {                                       // For every single active bid
	                Bid bid = this.BidList.get(i);
	                if ( bid.getIsActive() & bid.getBuyerID() != this.buyerInLeaderID ){                  // Active Bid Unless The Active Bid Is The Current Leading Bid
	                    double bidPrice = bid.getCurrPrice();                                           // Get the bid price
	                    double priceToBeat = this.currItemPrice + this.incrementVal;                    // Find the price that needs to be beaten 
	                    System.out.println("This is the price to beat " + priceToBeat);
	                    System.out.println("This is " + bid.getBuyerID() + "'s Bid price " + bid.getCurrPrice());

	                    if ( bidPrice >= priceToBeat) {    // Bid is greater than current price. 
	                        System.out.println("Bid is greater than current price. Setting as new bid price");
	                        double newBidPrice = Math.max( bidPrice , priceToBeat );        // Set the new bid price as which ever is larger -> Probably always bidPrice
	                        updateAuctionDetailsInSQL(newBidPrice, bid.getBuyerID());
	                        // If this bidder has an upper limit, then save it
	                    } else {                            // Bid is less than current price
	                        
	                        System.out.println("Checking for automatic bidding for " + bid.getBuyerID() + ": " + bid.getAllowAutomaticBidding());
	                        System.out.println("Checking bid upper limit " + bid.getUpperBidLimit() + ", Price To Beat: " + priceToBeat);
	                        
	                        if ( bid.getAllowAutomaticBidding() & bid.getUpperBidLimit() >= priceToBeat ){        // If bidder has automatic bid set and upper limit is greater than price to beat
	                            System.out.println("Bid is less than current price. Automatic bidding is set. Setting this bid inactive and creating new bid... \n");
	                            // Generate New Bid 
	                            String date = "4/10/21";
	                            String time = "1:00 AM";

	                            // Use copy constructor to create new bid with buyer credentials but different price
	                            bid.setInActive();
	                            setBidInactive(bid.getBidID());
	                            Bid newBid = new Bid(bid, createBidID(), priceToBeat, date, time );
	                            // Add Bid To This List and SQL
								addBid(newBid, this.itemID, date, time);
								
								// Set current bid winner
								updateAuctionDetailsInSQL(priceToBeat, bid.getBuyerID());
	                            
								
	                            
	                            
	                        } else {                                    // Bid lost. Close it and add buyer ID to list of customers to notify     
	                            System.out.println("Bid is less than current price. Setting bid inactive and adding customer to list to contact \n");
	                            customerToContact.add(bid.getBuyerID());
	                        }
	                        bid.setInActive();      // Within this scope, we need to set the current bid as inactive (Created new bid or lost)
	                        setBidInactive(bid.getBidID());
	                    }
	                }
	            }

	            int numActiveBids = 0;                              // Check how many active bids are there
	            for ( int j = 0; j < this.BidList.size(); j++ ){
	                Bid bidToCheck = this.BidList.get(j);
	                if ( bidToCheck.getIsActive() ){
	                    numActiveBids += 1;
	                }
	            }

	            if ( numActiveBids <= 1 ){                        // There should only be one active bid (buyerInLeadID)
	                keepGoing = false;                          // Break loop if that is the case. Otherwise keep going (Automatic Bidding)
	            }

	        }
	        System.out.println("\n");

	        List<Bid> removedDuplicatesList = this.BidList.stream().distinct().collect(Collectors.toList());
	        // Alert the loser that they have been outbid
	        for (int k = 0; k < removedDuplicatesList.size(); k++){
	        	Bid bid = removedDuplicatesList.get(k);
	        	if ( !bid.getIsActive() ){
		        	String msgForLoser = "You have been outbid for item " + String.valueOf(this.itemID) + ". Price to beat is now " + String.valueOf(this.currItemPrice + this.incrementVal);
		        	sendAlert(bid.getBuyerID(), msgForLoser);
	        	}

	        }
	    }


	    // Create a unique BIDID for this auction
	    public int createBidID(){
	        this.bidID += 1;
	        return this.bidID;
	    }
	    public void setBidInactive(int bidID){
	    	ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			try {
				Statement stmt = con.createStatement();
		         String query = "update bid set isActive=0 where bidID=?";
		         PreparedStatement ps = con.prepareStatement(query);
		         ps.setInt(1, bidID);
		         ps.executeUpdate();
		        
	    } catch (Exception e){
	    	System.out.println(e);
	    }
			
	    }
	    
	    public void updateAuctionDetailsInSQL(double priceToBeat, int buyerID){
            this.currItemPrice = priceToBeat;
            this.buyerInLeaderID = buyerID;
            
	    	ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			try {
				Statement stmt = con.createStatement();
				
		         String query = "update auction set buyerInLeaderID=?, currentBidPrice=? where itemID=" + String.valueOf(this.itemID);;
		         PreparedStatement ps = con.prepareStatement(query);
		         ps.setInt(1, buyerID);
		         ps.setDouble(2, priceToBeat);
		         ps.executeUpdate();
		        
	    } catch (Exception e){
	    	System.out.println(e);
	    }
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
				System.out.println(e);
			}
			return alertID;
	  }
	  
	  public void sendAlert(int ID, String msg){
		  ApplicationDB db = new ApplicationDB();	
			Connection con = db.getConnection();
			try {
				Statement stmt = con.createStatement();
				
				String insert = "INSERT INTO alert(alertID, buyerID, acknowledgedAlert, message)"
						+ "VALUES (?, ?, ?, ?)";
				//Create a Prepared SQL statement allowing you to introduce the parameters of the query
				PreparedStatement ps = con.prepareStatement(insert);

				//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
				ps.setInt(1, getAlertID());
				ps.setInt(2, ID);
				ps.setBoolean(3, false);
				ps.setString(4,  msg );
				ps.executeUpdate();
				
			} catch (Exception e){
				System.err.println(e.getMessage());
				
			}
	  }
		
	  
	}
	
	%>
	</body>
</html>
