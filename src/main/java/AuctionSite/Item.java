package AuctionSite;

import com.dbproj.pkg.ApplicationDB;
//import com.dbproj.pkg.Connection;
//import com.dbproj.pkg.ResultSet;
//import com.dbproj.pkg.Statement;
import java.sql.*;

public class Item {
    protected int itemID; 
    protected String itemType;
    protected String modelNumber;
    protected boolean inAuction; 
    protected int year;
    protected String color; 


    public Item( int itemID, String itemType, String modelNumber, boolean inAuction, int year, String color){
        this.itemID = itemID;
        this.itemType = itemType;
        this.modelNumber = modelNumber;
        this.inAuction = inAuction;
        this.year = year;
        this.color = color;
    }

    public int getItemID(){
        return this.itemID;
    }

    public void addToSQL(){
        // Add Itself To SQL 
    }

    public void removeFromSQL(){
        // Code to remove item from SQL
    }
    
    public static int generateItemID() {
    	ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
	try {
		Statement stmt = con.createStatement();
		String query = "SELECT MAX(item_id) as latest FROM items;";
		
		ResultSet result = stmt.executeQuery(query);
		
		result.next();
		
		int id = result.getInt("latest");
		return id+1;
	}catch(Exception E) {
		E.printStackTrace();
		return -1;
	}
		
    }

}
