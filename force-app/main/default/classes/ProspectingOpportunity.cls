public with sharing class ProspectingOpportunity {
    public void ProspectingOpportunity(List<Opportunity> opportunity) {
        for (Opportunity op : opportunity) {
            if(op.StageName!='Prospecting' || op.CloseDate< Date.TODAY()+15){
                op.StageName = 'Prospecting'; 
                op.CloseDate = Date.TODAY() + 15;
                update op;
            }
        }
    }
}