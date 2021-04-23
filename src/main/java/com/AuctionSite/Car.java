package com.AuctionSite;

public class Car extends Item {
    
    public Car( int itemID, String modelNumber, boolean inAuction, int year, String color, String img, String location, String transmission, String mpg, String miles){
        super(itemID, "car",modelNumber, inAuction, year, color,  img, location, transmission, mpg, miles);
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
