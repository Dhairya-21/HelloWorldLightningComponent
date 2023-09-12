public with sharing class CreateContactAccount {
    public void CreateContactAccount(List<Account> account) {
        Contact con = new Contact();
        for (Account acc : account) {   
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            con.AccountId = acc.Id;
            con.Email = acc.Email__c;
        }
        insert con;
    }
}