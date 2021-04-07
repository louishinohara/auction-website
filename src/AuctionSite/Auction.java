package AuctionSite;

public class Auction {
    private int auctionID;
    private int initialPrice;
    private int sellerID;
    private int itemID;
    private Bid currentBid;
    private boolean isOpen;
    private String closeTime;
    private int incrementVal;
    private Customer auctionWinner; 
    private BidSystem bidSystem;



    public Auction(int auctionID, int initialPrice, int sellerID, int itemID, boolean isOpen, String closeTime, int incrementVal){
        this.auctionID = auctionID;
        this.initialPrice = initialPrice; 
        this.sellerID = sellerID;
        this.itemID = itemID;
        this.isOpen = isOpen;
        this.closeTime = closeTime;
        this.incrementVal = incrementVal;
        this.bidSystem = new BidSystem();
    }

    public boolean addBid(Bid bid){
        // Check if this is a valid bid to place
        this.bidSystem.addBidToList(bid);
        return true;
    }

    private void setAuctionWinner(){

    }

    public void closeAuction(){
        this.isOpen = false;
    }





}
