package com.AuctionSite;

import com.dbproj.pkg.ApplicationDB;
//import com.dbproj.pkg.Connection;
//import com.dbproj.pkg.ResultSet;
//import com.dbproj.pkg.Statement;
import java.sql.*;

public class Item {
    protected int itemID; 
    protected String itemType;
    protected String model;
    protected boolean inAuction; 
    protected int year;
    protected String color; 
    protected String img;


    public Item( int itemID, String itemType, String model, boolean inAuction, int year, String color, String img){
        this.itemID = itemID;
        this.itemType = itemType;
        this.model = model;
        this.inAuction = inAuction;
        this.year = year;
        this.color = color;
        this.img = img;
    }

    public int getItemID(){
        return this.itemID;
    }

    public void addToSQL(){
    	ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
        try {
            Statement stmt = con.createStatement();
  
            String insert = "INSERT INTO items(item_type, model, item_id, in_auction, item_year, color, img)"
                    + "VALUES (?, ?, ?, ?,?,?,?)";
            //Create a Prepared SQL statement allowing you to introduce the parameters of the query
            PreparedStatement ps = con.prepareStatement(insert);

            //Add parameters of the query. Start with 1, the 0-parameter is the INSERT statement itself
            ps.setString(1, this.itemType);
            ps.setString(2, this.model);
            ps.setInt(3, this.itemID);
            ps.setBoolean(4, false);
            ps.setInt(5, this.year);
            ps.setString(6, this.color);
            ps.setString(7,this.img);

            //Run the query against the DB
            ps.executeUpdate();
        }catch(Exception E) {
            E.printStackTrace();
        }
    }

    public void removeFromSQL(){
        // Code to remove item from SQL
    }
    
    public String getItemType() {
    	return this.itemType;
    }
    
    public String getModelNumber() {
    	return this.model;
    }
    
    public int getYear() {
    	return this.year;
    }
    
    public String getColor() {
    	return this.color;
    }
    
    public String getImg(){
        return this.img;
    }
    public boolean getInAuction() {
    	return this.inAuction;
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
    
    public String toString() {
    	String output = "";
    	output += "Type: " + this.itemType + ", ";
    	output += "ID: " + this.itemID + ", ";
    	output += "Model: " + this.model + ", ";
    	output += "Year: " + this.year + ", ";
    	output += "Color: " + this.color;
    	return output;
    }

}
