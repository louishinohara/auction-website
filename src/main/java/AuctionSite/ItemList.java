package AuctionSite;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.dbproj.pkg.ApplicationDB;

public class ItemList {
    private List<Item> itemList;

    public ItemList(){
        this.itemList = new ArrayList<Item>();   
    }

    public void addItemToList(Object obj, String itemType){
        Item item = null;
        if (itemType.equals("bike")){
            item = (Bike) obj;
        } else if (itemType.equals("truck")){
            item = (Truck) obj;
        } else if (itemType.equals("car")){
            item = (Car) obj;
        }
        this.itemList.add(item);
    }

    public List<Item> getItemList(){
    	getItemsFromSQL();
    	System.out.println("Temp");
    	return this.itemList;
    }
    
    public void getItemsFromSQL(){
    	ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();
		try {
			
			String query = "SELECT * FROM items";
			
			//Create a Prepared SQL statement allowing you to introduce the parameters of the query
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				String item_type = rs.getString("item_type");
				int model_number = rs.getInt("model_number");
				int item_id = rs.getInt("item_id");
				boolean inAuction = rs.getBoolean("in_auction");
				int item_year = rs.getInt("item_year");
				String color = rs.getString("color");
				
				// Put Into Items List To Render On Page
				
			}

		
		}catch(Exception E) {
			E.printStackTrace();
		}
    }
    
    public void removeItemFromList(Item item){
        // Code to remove item to list
    }

    public void storeAuctionToSQL(){
        // Remove Item From SQL
    }

    public void removeItemFromSQL(Item item){
        // Remove Item From SQL Table
    }



}
