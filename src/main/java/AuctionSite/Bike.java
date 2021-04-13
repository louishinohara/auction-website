package AuctionSite;

public class Bike extends Item {
    
    public Bike(int itemID, String modelNumber, boolean inAuction, int year, String color){
        super(itemID, "bike", modelNumber, inAuction, year, color);
    }

    @Override
    public int getItemID(){
        return super.getItemID();
    }

    @Override
    public void addToSQL(){
        super.addToSQL();
    }
    
}
