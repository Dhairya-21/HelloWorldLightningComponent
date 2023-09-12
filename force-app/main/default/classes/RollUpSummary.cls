public with sharing class RollUpSummary {
    public void RollUpSummary(List<Contact> contact) {
        Set<Id> Ids = new Set<Id>();
        Set<Id> ContactId = new Set<Id>();
        Integer amt = 0;
        List<Account> Upd = new List<Account>();
        
        for (Contact con : contact) {
            Ids.add(con.AccountId);
            ContactId.add(con.Id);
        }
        for(Contact c: [SELECT LastName, Amount__c FROM Contact WHERE AccountId IN :Ids]){
            if(c.Amount__c != null){
                amt += Integer.valueOf(c.Amount__c);
            }
        }
        for (Account acc : [SELECT Total_Amount__c FROM Account WHERE Id IN :Ids]) {
            acc.Total_Amount__c = amt;
            Upd.add(acc);
        }
        update Upd;
    }
}
