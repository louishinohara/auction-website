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
    private int incrementVal;


    public BidSystem(double initialPrice, int incrementVal){
        this.BidList = new ArrayList<Bid>();
        this.currItemPrice =  initialPrice;
        this.incrementVal = incrementVal;
        // At the constructor, look into the database and get all items and place into array
    }

    public List<Bid> getBidList(){
        return this.BidList;
    }

    public void addBidToList(Bid bid){
        double wagerPrice = bid.getCurrPrice();
        // If the wager is greater than the current price, change it 
        if (wagerPrice > currItemPrice){
            this.currItemPrice = wagerPrice;
            this.buyerInLeadID = bid.getBuyerID();
        }
        // Add bid to list
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
                if (bid.getIsActive()){                             // Ignore bids that have already been closed
                    double priceToBeat = this.currItemPrice + this.incrementVal;
                    if ( bid.getCurrPrice() > priceToBeat ) {       // Bid is greater than current price. 
                        this.currItemPrice = priceToBeat;
                        this.buyerInLeadID = bid.getBidID();
                    } else {                                        // Bid is less than current price
                        if (bid.getAllowAutomaticBidding() & bid.getUpperBidLimit() < priceToBeat ){        // If bidder wants to automatic bid and curr price is less than price to beat
                            // Generate New Bid 
                            this.currItemPrice = priceToBeat;
                            this.buyerInLeadID = bid.getBidID();

                            String date = "4/10/21";
                            String time = "1:00 AM";

                            // Use copy constructor to create new bid with buyer credentials but different price
                            Bid newBid = new Bid(bid, createBidID(), priceToBeat, date, time );
                            addBidToList(newBid);
                        } else {                                    // Bid is dead. Close it and contact customer                     
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
            
            if (numActiveBids <= 1){                        // There should only be one active bid (buyerInLeadID)
                keepGoing = false;                          // Break loop if that is the case. Otherwise keep going (Automatic Bidding)
            }

            }
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
