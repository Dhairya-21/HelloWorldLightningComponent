public class lwcContact {
  @AuraEnabled(cacheable=true)
  public static list<Account> getAccounts() {
    System.debug('get Accs');
    return [SELECT Id, Name FROM Account WHERE Id IN (SELECT AccountId FROM Contact)];
  }
  
  @AuraEnabled
  public static list<Contact> getContacts(String accId) {
    System.debug('get conts');
    return [SELECT Id, Salutation, FirstName, LastName, Email, Phone FROM Contact WHERE Account.Name = :accId];
  }

  @AuraEnabled
  public static string setContacts(List<Contact> cont){
    // for(Contact c:cont){
    //   System.debug(c.id);
    //   System.debug(c.FirstName);
    //   System.debug(c.LastName);
    //   System.debug(c.Email);
    //   System.debug(c.Phone);
    // }
    update cont;
    return 'success';
  }
}
