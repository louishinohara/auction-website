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


    public void addToSQL(){
    	ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		try {
			Statement stmt = con.createStatement();
			//String query = "INSERT INTO items VALUES(\"" + this.itemType + "\", " + this.modelNumber + ", " + this.itemID + ", false, " + this.year + ", \"" + this.color + "\");";
			String insert = "INSERT INTO bid(BUYER_ID, itemID, BID_ID, BID_PRICE, UPPER_BID_LIMIT, date, time, allowAutomaticBidding, isActive)"
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setInt(1, this.BUYER_ID);
			ps.setInt(2, this.itemID);
			ps.setInt(3, this.BID_ID);
			ps.setDouble(4, this.BID_PRICE);
			ps.setDouble(5, this.UPPER_BID_LIMIT);
			ps.setString(6, this.date);
			ps.setString(7, this.time);
			ps.setBoolean(8, this.allowAutomaticBidding);
			ps.setBoolean(9, this.isActive);
			//Run the query against the DB
			ps.executeUpdate();
		
		}catch(Exception E) {
			E.printStackTrace();
		}
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