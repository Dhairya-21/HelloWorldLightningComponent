public with sharing class DeleteAccountRecords {
    public void DeleteAccountRecords(List<Contact> contact) {
        Set<Id> AccountId = new Set<Id>();
        Set<Id> ContactId = new Set<Id>();
        for (Contact con : contact) {
            AccountId.add(con.AccountId);
        }
        for (Contact con2 : [SELECT Id, AccountId FROM Contact WHERE AccountId IN :AccountId]) {
            con2.AccountId = '';
            ContactId.add(con2.Id);
        }
        update new List<Contact>(Integer.valueOf(ContactId));
        delete new List<Account>(Integer.valueOf(AccountId));
    }
}