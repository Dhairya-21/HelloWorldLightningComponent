public with sharing class lwcClass {
  @AuraEnabled(cacheable=true)
  public static List<Account> getAccounts() {
    return [SELECT Id, Name, Email__c FROM Account];
  }
  @AuraEnabled(cacheable=true)
  public static List<Contact> getAllContacts() {
    return [SELECT Id, Name, Email FROM Contact];
  }
  @AuraEnabled(cacheable=true)
  public static List<Lead> getAllLead() {
    return [SELECT Id, Name, Email FROM Lead];
  }

  @AuraEnabled(cacheable=true)
  public static List<Contact> getContacts(String accIds) {
    return [
      SELECT Id, AccountId, LastName
      FROM Contact
      WHERE Account.Id = :accIds
    ];
  }

  @AuraEnabled(cacheable=true)
  public static string sendEmail(List<String> emails, String sub, String body){
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    List<String> st = new List<String>();
      mail.setToAddresses(emails);
      mail.setSubject(sub);
      mail.setPlainTextBody(body);
      Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    return 'Success ';
  }
}
