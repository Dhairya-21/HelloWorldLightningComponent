public class DragAndDropClass {
  // Find account using search key
  @AuraEnabled
  public static Map<String, Integer> getAccounts(String searchKey) {
    String sh = '%' + searchKey + '%';
    List<Account> acc = [
      SELECT Id, Name, Rating
      FROM Account
      //   WHERE Id IN (SELECT AccountId FROM Contact) AND Name LIKE :sh
      WHERE Name LIKE :sh
    ];
    Map<String, Integer> result = new Map<String, Integer>();
    for (Account a : acc) {
      result.put(a.Name, getContactsValue(a.Id));
    }
    return result;
  }

  // get contact count for the account
  @AuraEnabled
  public static Integer getContactsValue(String AccId) {
    return [SELECT COUNT() FROM Contact WHERE AccountId = :AccId];
  }

  // get contact from account name
  @AuraEnabled
  public static List<Contact> getContacts(String name) {
    return [
      SELECT Id, LastName, FirstName
      FROM Contact
      WHERE Account.Name = :name
    ];
  }

  // transfer Contact from account 1 to 2
  @AuraEnabled
  public static String TransferCon(String TConId, String FAccId) {
    Contact TransferContact = new Contact();
    TransferContact = [
      SELECT Id, LastName, AccountId
      FROM Contact
      WHERE Id = :TConId
    ];
    TransferContact.AccountId = DragAndDropClass.getAccId(FAccId);
    update TransferContact;
    return TransferContact.AccountId;
  }
  @AuraEnabled
  public static string getAccId(String s) {
    Account a = new Account();
    a = [SELECT Id FROM Account WHERE Name = :s LIMIT 1];
    return a.Id;
  }
}
