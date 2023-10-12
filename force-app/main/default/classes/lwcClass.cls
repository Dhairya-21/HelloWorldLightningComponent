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
  public static string sendEmail(List<String> emails, String sub, String body) {
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    if (sub != '' && body != '') {
      mail.setToAddresses(emails);
      mail.setSubject(sub);
      mail.setPlainTextBody(body);
      if (Limits.getEmailInvocations() > 0) {
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
      }
    }
    return 'Success ';
  }

  @AuraEnabled(cacheable=true)
  public static string sendEmail1(
    List<String> emails,
    String sub,
    String body,
    String dId
  ) {
    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
    // mail.setFileAttachments(new Id[] {dId});
    // mail.setDocumentAttachments(new List<Id>{ dId });
    if (sub != '' && body != '') {
      mail.setEntityAttachments(new List<String>{ dId });
      mail.setToAddresses(emails);
      mail.setSubject(sub);
      mail.setPlainTextBody(body);
      System.debug(mail);
      if (Limits.getEmailInvocations() > 0) {
        Messaging.sendEmail(new List<Messaging.SingleEmailMessage>{ mail });
      }
    }
    return 'Success ';
  }

  @AuraEnabled(cacheable=true)
  public static Contact getCon(String ids) {
    return [SELECT Id, LastName, Email FROM Contact WHERE Id = :ids];
  }
}
