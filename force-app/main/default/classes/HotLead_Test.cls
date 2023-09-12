@isTest
public class HotLead_Test {
    @isTest static void HotLead(){
        List<Lead> Lead = new List<Lead>();
        Lead l = new Lead(LastName = 'Dhairya', Status = 'Working - Contacted');
        Lead.add(l);
        HotLead HL = new HotLead();
        HL.HotLead(Lead);
    }
}