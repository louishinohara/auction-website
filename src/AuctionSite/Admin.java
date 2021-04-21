package AuctionSite;

public class Admin extends Person 
{
    private int adminID;
    
    public Admin(String firstName, String lastName, String SSN, String email, String address, int adminID)
    {
        super( firstName,  lastName,  SSN,  email, address);
        this.adminID = adminID;
        this.totalEarnings = 0;
    
    }
    
    private createCustomerRep(String firstName, String lastName, String SSN, String email, String address, int customerRepID)
    {
        CustomerRep employee = new CustomerRep(firstName,lastName,SSN, email, address,customerRepID);
        return employee;
    }
    
    private void findTotalEarnings()
    {
        int totalEarnings = 0;
        
        for(Auction temp; AuctionList.auctionlist) {
            if(temp.isOpen == false)
            {
                totalEarnings += temp.currenBidPrice - temp.initialPrice;
            }
        }
        System.out.println(totalEarnings);
    }
    
     private void findTotalEarningsCar()
    {
        int totalEarnings = 0;
        
        for(Auction temp; AuctionList.auctionlist) {
            if(temp.isOpen == false)
            {
               for(Item item: ItemList.itemlist) {
                   if(item.itemID.equals(temp.itemID)) {
                       if(item instanceof Car) {
                           totalEarnings+=temp.currentBidPrice - temp.initialPrice;
                       }
                   }
               }
            }
        }
        System.out.println(totalEarnings);
    }
    
     private void findTotalEarningsBike()
    {
        int totalEarnings = 0;
        
        for(Auction temp; AuctionList.auctionlist) {
            if(temp.isOpen == false)
            {
               for(Item item: ItemList.itemlist) {
                   if(item.itemID.equals(temp.itemID)) {
                       if(item instanceof Bike) {
                           totalEarnings+=temp.currentBidPrice - initialPrice;
                       }
                   }
               }
            }
        }
        System.out.println(totalEarnings);
    }
    
       private void findTotalEarningsTruck()
    {
        int totalEarnings = 0;
        
        for(Auction temp; AuctionList.auctionlist) {
            if(temp.isOpen == false)
            {
               for(Item item: ItemList.itemlist) {
                   if(item.itemID.equals(temp.itemID)) {
                       if(item instanceof Truck) {
                           totalEarnings+=temp.currentBidPrice - initialPrice;
                       }
                   }
               }
            }
        }
        System.out.println(totalEarnings);
    }                              
}
