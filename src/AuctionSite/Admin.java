package AuctionSite;

public class Admin extends Person {
    private int adminID;
    private double totalEarnings;
    private double totalBike;
    private double totalCar;
    private double 

    public Admin(String firstName, String lastName, String SSN, String email, String address, int adminID){
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
       return this.totalEarnings;
    }

    
    
    
                                 
}
