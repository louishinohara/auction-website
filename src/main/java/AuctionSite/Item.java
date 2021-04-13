package AuctionSite;

public class Item {
    protected int itemID; 
    protected String modelNumber;
    protected boolean inAuction; 
    protected int year;
    protected String color; 
    protected String itemType;

    public Item( int itemID, String modelNumber, boolean inAuction, int year, String color, String itemType){
        this.itemID = itemID;
        this.modelNumber = modelNumber;
        this.inAuction = inAuction;
        this.year = year;
        this.color = color;
        this.itemType = itemType;
        
    }

    public int getItemID(){
        return this.itemID;
    }

    public String getItemType() {
    	return this.itemType;
    }
    
    public String getModelNumber() {
    	return this.modelNumber;
    }
    
    public int getYear() {
    	return this.year;
    }
    
    public String getColor() {
    	return this.color;
    }
    
    public boolean getInAuction() {
    	return this.inAuction;
    }
    
    public void addToSQL(){
        // Add Itself To SQL 
    }

    public void removeFromSQL(){
        // Code to remove item from SQL
    }

}
