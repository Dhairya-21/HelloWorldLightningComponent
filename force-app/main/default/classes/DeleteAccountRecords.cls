public with sharing class DeleteAccountRecords {
    public void DeleteAccountRecords(List<Contact> contact) {
        List<Contact> newContact = new List<Contact>();
        List<Account> Account = new List<Account>();
        Account NewAcc = new Account();
        NewAcc = [Select Id from Account Where Id <>:Account[0].Id Limit 1];
        for (Contact c : [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId = :contact[0].AccountId]) {
            newContact.add(c);
        }
        for (Contact c : newContact) {
            c.AccountId = NewAcc.Id;
        }
        for (Account ac : [SELECT Id FROM Account WHERE Id = :contact[0].AccountId]) {
            Account.add(ac);
        }
        update newContact;
        delete Account;
    }
}