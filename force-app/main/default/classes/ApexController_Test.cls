@isTest
public class ApexController_Test {
  @isTest
  public static void ApexController_Test() {
    Contact c = new Contact(LastName = 'Dhairya');
    insert c;
    List<Contact> con = new List<Contact>();
    con.add(c);

    Test.startTest();
    ApexController.getContacts();
    System.assertEquals(ApexController.getByName('D'), con);
    Test.stopTest();
  }
}