package AuctionSite;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import com.dbproj.pkg.ApplicationDB;

public class Bid {
    private int itemID;
    private int BID_ID;
    private int BUYER_ID;
    private double UPPER_BID_LIMIT;
    private String date;
    private String time;
    private double BID_PRICE;
    private boolean allowAutomaticBidding;
    private boolean isActive;

    // Constructor For Bid
    public Bid(int BUYER_ID, int itemID, int BID_ID, double BID_PRICE, double UPPER_BID_LIMIT, String date, String time, boolean allowAutomaticBidding){
        this.BID_ID = BID_ID;
        this.BID_PRICE = BID_PRICE;
        this.BUYER_ID = BUYER_ID;
        this.UPPER_BID_LIMIT = UPPER_BID_LIMIT;
        this.date = date;
        this.time = time;
        this.allowAutomaticBidding = allowAutomaticBidding;
        this.isActive = true;
    }

    // Copy constructor to create new bid using old fields with changes in BID_ID, BID_PRICE, Date and Time
    public Bid( Bid bid, int BID_ID, double BID_PRICE, String date, String time){
        this.BID_ID = BID_ID;
        this.BID_PRICE = BID_PRICE;
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
        return this.BID_PRICE;
    }

    
    public double setCurrPrice(double price){
       return this.BID_PRICE = price;
    }
    
    public double getUpperBidLimit(){
        return this.UPPER_BID_LIMIT;
    }

    public int getBuyerID(){
        return this.BUYER_ID;
    }

    public String getDate(){
        return this.date;
    }
    
    public String getTime(){
        return this.time;
    }
    
    public boolean getAllowAutomaticBidding(){
        return this.allowAutomaticBidding;
    }

    public void setInActive() {
        this.isActive = false;
    	ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		try {
			Statement stmt = con.createStatement();
			
	         String query = "update bid set isActive=0 where bidID=?";
	         PreparedStatement ps = con.prepareStatement(query);
	         ps.setInt(1, this.BID_ID);
	         ps.executeUpdate();
	         System.out.println("Set Bid Inactive " + String.valueOf(this.BID_ID));
	        
    } catch (Exception e){
    	System.out.println(e);
    }
		
    }
    
    public boolean getIsActive(){
        return this.isActive;
    }


}