@isTest
public class ProspectingOpportunity_Test {
    @isTest static void ProspectingOpportunity(){
        List<Opportunity> Opportunities = new List<Opportunity>();
        Opportunity opp = new Opportunity(Name = 'Dhairya', StageName = 'Prospecting');
        Opportunities.add(opp);
        Opportunity opp1 = new Opportunity(Name = 'Dhairya', StageName = 'Qualification');
        Opportunities.add(opp1);
        ProspectingOpportunity PO = new ProspectingOpportunity();
        PO.ProspectingOpportunity(Opportunities);
    }
}