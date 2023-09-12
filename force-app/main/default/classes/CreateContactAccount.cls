public with sharing class CreateContactAccount {
    public void CreateContactAccount(List<Account> account) {
        Contact con = new Contact();
        List<Contact> Contact = new List<Contact>();
        for (Account acc : account) {   
            con.LastName = acc.Name;
            con.Phone = acc.Phone;
            con.AccountId = acc.Id;
            con.Email = acc.Email__c;
            Contact.add(con);
        }
        insert Contact;
    }
}