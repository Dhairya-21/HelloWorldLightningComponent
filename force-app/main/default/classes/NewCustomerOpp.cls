public with sharing class NewCustomerOpp {
    public void NewCustomerOpp(List<Opportunity> opportunity) {
        List<Opportunity> opp = new List<Opportunity>();
        for (Opportunity o : opportunity) {
            o.Type = 'New Customer';
            opp.add(o);
        }
        update opp;
    }
}