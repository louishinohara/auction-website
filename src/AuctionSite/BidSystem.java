package AuctionSite;
import java.util.ArrayList;
import java.util.List;


// This is where the automatic bid system stuff will happen
// Each auction has this bid system built into it.
// This system has all the bids for the item that is being bid on
public class BidSystem {
    
    private List<Bid> BidList; 

    public BidSystem(){
        this.BidList = new ArrayList<Bid>();
        // At the constructor, look into the database and get all items and place into array

    }

    public List<Bid> getBidList(){
        return this.BidList;
    }

    public void addBidToList(Bid bid){
        // TODO Add functionality to add item to bid list
        // Add bid to SQL 
    }

    public void removeBidToList(Bid bid){
        // TODO Add functionality to remove item from bid list
        // Remove bid from SQL 
    }

}
