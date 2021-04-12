package AuctionSite;

public class Bid {
    private int itemID;
    private int BID_ID;
    private int BUYER_ID;
    private double UPPER_BID_LIMIT;
    private String date;
    private String time;
    private double CURR_PRICE;
    private boolean allowAutomaticBidding;
    private boolean isActive;

    public Bid(int BUYER_ID, int itemID, int BID_ID, double CURR_PRICE, double UPPER_BID_LIMIT, String date, String time, boolean allowAutomaticBidding){
        this.BID_ID = BID_ID;
        this.CURR_PRICE = CURR_PRICE;
        this.BUYER_ID = BUYER_ID;
        this.UPPER_BID_LIMIT = UPPER_BID_LIMIT;
        this.date = date;
        this.time = time;
        this.allowAutomaticBidding = allowAutomaticBidding;
        this.isActive = true;
    }

    // Copy constructor to create new bid using old fields with some changes
    public Bid( Bid bid, int BID_ID, double CURR_PRICE, String date, String time){
        this.BID_ID = BID_ID;
        this.CURR_PRICE = CURR_PRICE;
        this.BUYER_ID = bid.BUYER_ID;
        this.UPPER_BID_LIMIT = bid.UPPER_BID_LIMIT;
        this.date = date;
        this.time = time;
        this.allowAutomaticBidding = bid.allowAutomaticBidding;
        this.isActive = true;
    }



    public int getBidID() {
        return this.BID_ID;
    }

    public double getCurrPrice(){
        return this.CURR_PRICE;
    }

    public double setCurrPrice(double price){
       return this.CURR_PRICE = price;
    }

    public double getUpperBidLimit(){
        return this.UPPER_BID_LIMIT;
    }

    public int getBuyerID(){
        return this.BUYER_ID;
    }

    public boolean getAllowAutomaticBidding(){
        return this.allowAutomaticBidding;
    }

    public boolean getIsActive(){
        return this.isActive;
    }

    public void setInActive(){
        this.isActive = false;
    }

}