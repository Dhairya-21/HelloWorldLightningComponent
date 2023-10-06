public with sharing class lwcClass {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts() {
    return [SELECT Id, Name FROM Account];
  }

  @AuraEnabled(cacheable=true)
  public static List<Contact> getContacts(String accIds) {
    return [SELECT Id, AccountId, LastName FROM Contact WHERE Account.Id = :accIds];
  }
}
