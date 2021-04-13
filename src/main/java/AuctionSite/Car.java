package AuctionSite;

public class Car extends Item {
    
    private int miles;


    public Car( int itemID, String modelNumber, boolean inAuction, int year, String color, int miles, String itemType){
        super(itemID, modelNumber, inAuction, year, color, itemType);
        this.miles = miles;
    }

    @Override
    public int getItemID(){
        return super.getItemID();
    }
    
}
