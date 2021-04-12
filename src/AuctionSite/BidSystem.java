package AuctionSite;
import java.util.ArrayList;
import java.util.List;


// This is where the automatic bid system stuff will happen
// Each auction has this bid system built into it.
// This system has all the bids for the item that is being bid on
public class BidSystem {
    
    private List<Bid> BidList; 

    private double currItemPrice;
    private int buyerInLeadID;
    private int bidID = 0;
    private double incrementVal;


    public BidSystem(double initialPrice, double incrementVal){
        this.BidList = new ArrayList<Bid>();
        this.currItemPrice =  initialPrice;
        this.incrementVal = incrementVal;
        // At the constructor, look into the database and get all items and place into array
    }

    public List<Bid> getBidList(){
        return this.BidList;
    }

    public void addBidToList(Bid bid){
        BidList.add(bid);
        // Add bid to SQL 
    }

    // Automatic Bidding 
    public List<Integer> calculateCurrentPrice(){
        List<Integer> customerToContact = new ArrayList<Integer>();
        boolean keepGoing = true;
        while (keepGoing){
            for (int i = 0; i < this.BidList.size(); i++){
                Bid bid = this.BidList.get(i);
                if (bid.getIsActive() & bid.getBuyerID() != this.buyerInLeadID){                             // Ignore bids that have already been closed
                    double priceToBeat = this.currItemPrice + this.incrementVal;
                    
                    System.out.println("This is the price to beat " + priceToBeat);
                    System.out.println("This is " + bid.getBuyerID() + "'s Bid price " + bid.getCurrPrice());
                    
                    double bidPrice = bid.getCurrPrice();
                    if ( bidPrice > priceToBeat ) {                 // Bid is greater than current price. 
                        System.out.println("Bid is greater than current price. Setting as new bid price");
                        double newBidPrice = Math.max(bidPrice , priceToBeat);
                        this.currItemPrice = newBidPrice;
                        this.buyerInLeadID = bid.getBuyerID();
                        
                    } else {                                        // Bid is less than current price
                        if (bid.getAllowAutomaticBidding() & bid.getUpperBidLimit() < priceToBeat ){        // If bidder wants to automatic bid and curr price is less than price to beat
                            System.out.println("Bid is less than current price. Automatic bidding is set. Setting this bid inactive and creating new bid...");
                            
                            // Generate New Bid 
                            this.currItemPrice = priceToBeat;
                            this.buyerInLeadID = bid.getBidID();

                            String date = "4/10/21";
                            String time = "1:00 AM";

                            // Use copy constructor to create new bid with buyer credentials but different price
                            Bid newBid = new Bid(bid, createBidID(), priceToBeat, date, time );
                            addBidToList(newBid);

                        } else {                                    // Bid is dead. Close it and contact customer        
                            System.out.println("Bid is less than current price. Automatic bidding is not set. Setting bid inactive and adding customer to list to contact");
                            customerToContact.add(bid.getBuyerID());

                        }
                        bid.setInActive();                          // If new bid is created or bidder lost, close that bid
                    }
                }

            int numActiveBids = 0;                              // Check how many active bids are there
            for (int j = 0; j < this.BidList.size(); j++){
                Bid bidToCheck = this.BidList.get(i);
                if (bidToCheck.getIsActive()){
                    numActiveBids += 1;
                }
            }

            System.out.println("Checking for num active bids. Num active bids is " + numActiveBids);
            if (numActiveBids <= 1){                        // There should only be one active bid (buyerInLeadID)
                System.out.println("Ending calculations. There is only one active bid left for the buyerID: " + this.buyerInLeadID);
                keepGoing = false;                          // Break loop if that is the case. Otherwise keep going (Automatic Bidding)
            }

            }
            System.out.println("");
        }


        return customerToContact;
    }

    public double getCurrItemPrice(){
        return this.currItemPrice;
    }

    public int getBuyerInLeadID(){
        return this.buyerInLeadID;
    }

    public int createBidID(){
        this.bidID += 1;
        return this.bidID;
    }

    public void removeBidToList(Bid bid){
        // TODO Add functionality to remove item from bid list
        // Remove bid from SQL 
    }

}
