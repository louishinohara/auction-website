package com.AuctionSite;

public class Car extends Item {
    
    private int miles;


    public Car( int itemID, String modelNumber, boolean inAuction, int year, String color, int miles, String img){
        super(itemID, "car",modelNumber, inAuction, year, color, img);
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
