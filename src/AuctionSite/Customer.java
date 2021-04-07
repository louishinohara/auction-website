package AuctionSite;

public class Customer extends Person {

    private int accountNumber;
    private boolean isBuyer;
    private boolean isSeller;
    private int buyerID;
    private int sellerID;
    private int customerBalance;


    public Customer(String firstName, String lastName, String SSN, String email, String address, int accountNumber, boolean isBuyer, boolean isSeller, int buyerID, int sellerID, int customerBalance){
        super( firstName,  lastName,  SSN,  email, address);
        this.accountNumber = accountNumber;
        this.isBuyer = isBuyer;
        this.isSeller = isSeller;
        this.buyerID = buyerID;
        this.sellerID = sellerID;
    }


    // public Bid createBid(){
    //     return new Bid();
    // }

    public Item createItem(String itemType, int itemID, String modelNumber, boolean inAuction, int year, String color, int miles ){
        Item item;
        if (itemType.equals("Bike")){
            item = new Bike(itemID,modelNumber, inAuction, year, color);
            return item;
        } else if (itemType.equals("Truck")){
            item = new Truck(itemID,modelNumber, inAuction, year, color, miles);
            return item;
        } else if (itemType.equals("Car")){
            item = new Car(itemID,modelNumber, inAuction, year, color, miles);
            return item;
        }
        return null;
    }

    public int getBuyerID(){
        return this.buyerID;
    }

    public int getSellerID(){
        return this.sellerID;
    }

}
