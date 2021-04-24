package com.AuctionSite;

public class Truck extends Item {

    private int miles;

    public Truck( int itemID, String modelNumber, boolean inAuction, int year, String color, int miles){
        super(itemID, "truck", modelNumber, inAuction, year, color);
        this.miles = miles;
        
    }

    @Override
    public int getItemID(){
        return super.getItemID();
    }
    

    public String getItemType() {
    	return super.getItemType();
    }

    @Override
    public void addToSQL(){
        super.addToSQL();
    }
    
}
