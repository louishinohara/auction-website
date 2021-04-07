package AuctionSite;

public class Item {
    protected int itemID; 
    protected String modelNumber;
    protected boolean inAuction; 
    protected int year;
    protected String color; 


    public Item( int itemID, String modelNumber, boolean inAuction, int year, String color){
        this.itemID = itemID;
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

}
