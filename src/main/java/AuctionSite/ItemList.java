package AuctionSite;

import java.util.ArrayList;
import java.util.List;

public class ItemList {
    private List<Item> itemList;

    public ItemList(){
        this.itemList = new ArrayList<Item>();   
    }

    public void addItemToList(Object obj, String itemType){
        Item item = null;
        if (itemType.equals("Bike")){
            item = (Bike) obj;
        } else if (itemType.equals("Truck")){
            item = (Truck) obj;
        } else if (itemType.equals("Car")){
            item = (Car) obj;
        }
        this.itemList.add(item);
    }

    public List<Item> getItemList(){
    	return this.itemList;
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
