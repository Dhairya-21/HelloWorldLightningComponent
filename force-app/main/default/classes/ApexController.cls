public class ApexController {
  @AuraEnabled
  public static List<Contact> getContacts() {
    List<Contact> con = new List<Contact>();
    con = [
      SELECT Id, LastName, Phone, Email, Account.Name
      FROM Contact
      WHERE AccountId != NULL
    ];
    return con;
  }

  @AuraEnabled
  public static List<Contact> getByName(String searchKey) {
    String name = '%' + searchKey + '%';
    List<Contact> con = new List<Contact>();
    con = [
      SELECT Id, Lastname, Phone, Email, Account.Name
      FROM Contact
      WHERE AccountId != NULL AND Name LIKE :name
    ];
    return con;
  }
}
