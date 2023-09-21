public class DragAndDropClass {
  @AuraEnabled
  public static Map<String, Integer> getAccounts(String searchKey) {
    String sh = '%' + searchKey + '%';
    List<Account> acc = [
      SELECT Id, Name, Rating
      FROM Account
    //   WHERE Id IN (SELECT AccountId FROM Contact) AND Name LIKE :sh
      WHERE Name LIKE :sh
    ];
    Map<String,Integer> result= new Map<String,Integer>();
    for (Account a : acc) {
        result.put(a.Name, getContactsValue(a.Id));
    }
    return result;
  }

  @AuraEnabled
  public static Integer getContactsValue(String AccId) {
    return [SELECT COUNT() FROM Contact WHERE AccountId = :AccId];
  }

  @AuraEnabled
  public static List<Contact> getContacts(String AccId) {
    return [SELECT Id, LastName FROM Contact WHERE AccountId = :AccId];
  }
}
