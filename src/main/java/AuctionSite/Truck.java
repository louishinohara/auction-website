package AuctionSite;

public class Truck extends Item {

    private int miles;

    public Truck( int itemID, String modelNumber, boolean inAuction, int year, String color, int miles){
        super(itemID, modelNumber, inAuction, year, color);
        this.miles = miles;
        
    }

    @Override
    public int getItemID(){
        return super.getItemID();
    }
    
}
