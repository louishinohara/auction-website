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
    	ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		try {
			Statement stmt = con.createStatement();
			//String query = "INSERT INTO items VALUES(\"" + this.itemType + "\", " + this.modelNumber + ", " + this.itemID + ", false, " + this.year + ", \"" + this.color + "\");";
			String insert = "INSERT INTO items(item_type, model_number, item_id, in_auction, item_year, color)"
					+ "VALUES (?, ?, ?, ?,?,?)";
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			PreparedStatement ps = con.prepareStatement(insert);

			//Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
			ps.setString(1, this.itemType);
			ps.setInt(2, Integer.parseInt(this.modelNumber));
			ps.setInt(3, this.itemID);
			ps.setBoolean(4, false);
			ps.setInt(5, this.year);
			ps.setString(6, this.color);
			//Run the query against the DB
			ps.executeUpdate();
		
		}catch(Exception E) {
			E.printStackTrace();
		}
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
