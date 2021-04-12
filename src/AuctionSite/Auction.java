package AuctionSite;

import java.util.List;

public class Auction {
    private BidSystem bidSystem;
    private int auctionID;
    private double initialPrice;
    private int sellerID;
    private int itemID;
    private boolean isOpen;
    private String closeTime;
    private Customer auctionWinner; 
    private double currentBidPrice;
    private int buyerInLeadID;

    public Auction(int auctionID, double initialPrice, int sellerID, int itemID, boolean isOpen, String closeTime, int incrementVal){
        this.auctionID = auctionID;
        this.initialPrice = initialPrice; 
        this.sellerID = sellerID;
        this.itemID = itemID;
        this.isOpen = isOpen;
        this.closeTime = closeTime;
        this.bidSystem = new BidSystem(initialPrice, incrementVal);
    }

    public void addBid(Bid bid){
        // Check if this is a valid bid to place
        this.bidSystem.addBidToList(bid);
        List<Integer> customerToAlert = this.bidSystem.calculateCurrentPrice(); // The customer that lost due to automatic bidding 
        System.out.println("These customers have lost and we must send them an alert " + customerToAlert);
        this.currentBidPrice = this.bidSystem.getCurrItemPrice();
        this.buyerInLeadID = this.bidSystem.getBuyerInLeadID();
    }

    public int createBidID(){
        return this.bidSystem.createBidID();
    }

    public int getBuyerInLeadID(){
        int buyerInLead = this.bidSystem.getBuyerInLeadID();
        System.out.println("This is the current buyer in lead " + buyerInLead );
        return buyerInLead;
    }

    private void setAuctionWinner(){
        // Notify Customer
    }

    private void sendAlertToCustomer(){
        // Send Alert To Customer
    }

    public void closeAuction(){
        this.isOpen = false;
    }


    public static void main(String[] args) {
        // Create Person Object

        AuctionSite auctionSite = new AuctionSite();

        Customer customer1 = new Customer( "Louis",  "H",  "111-11-1111",  "Louis@gmail.com",  "",  1,  true,  true,  1, 1,  999);
        Customer customer2 = new Customer( "Josh",  "H",  "111-11-1111",  "Josh@gmail.com",  "",  2,  true,  true,  2, 2,  999);
        Customer customer3 = new Customer( "Sha",  "H",  "111-11-1111",  "Sha@gmail.com",  "",  3,  true,  true,  3, 3,  999);
        Customer customer4 = new Customer( "Ben",  "H",  "111-11-1111",  "Ben@gmail.com",  "",  4,  true,  true,  4, 4,  999);
        Customer customer5 = new Customer( "Evan",  "H",  "111-11-1111",  "Evan@gmail.com",  "",  5,  true,  true,  4, 4,  999);


        // Create the item and store it in the auction site
        Bike item = new Bike(666, "Haro", true, 1994, "Red" );

        String closeTime = "9:00";

        // Create the auction item and place it on the auction. This will also add it to the SQL table
        Auction auction = new Auction(1, 100, 1, 666, true, closeTime, 10);

        // Let's say the buyer has found an item that they like. itemID # 666

        int itemIDForBid = 666;
        int BID_ID = auction.createBidID(); // Some random number
        double UPPER_BID_LIMIT = 1000;
        String date = "10/11/2021";
        String time = "9:00 AM";
        double CURR_PRICE = 200;
        boolean automaticBid = true;


        Bid joshBid = new Bid(  2, itemIDForBid,  BID_ID,  CURR_PRICE,  UPPER_BID_LIMIT,  date,  time, automaticBid); // Buyer is Josh 
        Bid shaBid = new Bid(  3, itemIDForBid,  auction.createBidID(),  100, 2000, date,  time, true); // Buyer is Sha. Since Sha's upper bid limit is biggest, he should win
        Bid benBid = new Bid(  4, itemIDForBid,  auction.createBidID(),  300,  900,  date,  time, false); // Buyer is Ben 
        Bid evanBid = new Bid(  5, itemIDForBid,  auction.createBidID(),  300,  1000,  date,  time, true); // Buyer is Ben 

        // Adding bids to auction

        // ================= Case where Automatic Bid vs Non Auto Bid =====================
        
        auction.addBid(benBid);
        auction.addBid(joshBid);
        auction.getBuyerInLeadID();

        // ================================================================================

        // auction.addBid(shaBid);
        // auction.addBid(evanBid);

	}




}
