package AuctionSite;

public class Bid {
    private int itemID;
    private int BID_ID;
    private double MAX_BID;
    private int BUYER_ID;
    private double UPPER_BID_LIMIT;
    private String date;
    private String time;
    private double CURR_PRICE;

    public Bid( int itemID, int BID_ID, double CURR_PRICE, double MAX_BID, int BUYER_ID, double UPPER_BID_LIMIT, String date, String time     ){
        this.BID_ID = BID_ID;
        this.CURR_PRICE = CURR_PRICE;
        this.MAX_BID = MAX_BID;
        this.BUYER_ID = BUYER_ID;
        this.UPPER_BID_LIMIT = UPPER_BID_LIMIT;
        this.date = date;
        this.time = time;
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

    public double getMaxBid(){
        return this.MAX_BID;
    }




}