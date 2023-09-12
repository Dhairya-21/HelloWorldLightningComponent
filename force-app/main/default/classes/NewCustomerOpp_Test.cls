@isTest
public class NewCustomerOpp_Test {
    @isTest static void NewCustomerOpp_Test() {
        List<Opportunity> opp = new List<Opportunity>();
        Opportunity o = new Opportunity(Name = 'Dhairya',StageName = 'Prospecting');
        opp.add(o);
        NewCustomerOpp NCO = new NewCustomerOpp();
        NCO.NewCustomerOpp(opp);
        System.assertEquals('New Customer', opp[0].Type);
    }
}