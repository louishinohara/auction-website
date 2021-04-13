package AuctionSite;

public class CustomerRep extends Person {

    private int customerRepID;

    public CustomerRep(String firstName, String lastName, String SSN, String email, String address, int customerRepID){
        super( firstName,  lastName,  SSN,  email, address);
        this.customerRepID = customerRepID;

    }
}
