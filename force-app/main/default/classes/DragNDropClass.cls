public with sharing class DragNDropClass {
    @AuraEnabled
    public static List<Account> getAccounts(){
        List<Account> accounts = new List<Account>();
        accounts = [SELECT Id, Name, Rating FROM Account WHERE Id IN (SELECT AccountId FROM Contact)];
        return accounts;
    }
    @AuraEnabled
    public static List<Contact> getContacts(String AccId){
        List<Contact> contacts = new List<Contact>();
        contacts = [SELECT Id ,FirstName, LastName FROM Contact WHERE AccountId = :AccId];
        return contacts;
    }
}