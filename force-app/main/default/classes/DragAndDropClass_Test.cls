@isTest
public class DragAndDropClass_Test {
  @isTest
  public static void DragAndDropClass_Test() {
    Account acc = new Account();
    acc.Name = 'Account Test';
    insert acc;

    Account acc2 = new Account();
    acc2.Name = 'Dhairya Test';
    insert acc2;

    Test.startTest();
    
    DragAndDropClass.getAccounts('A');
    
    DragAndDropClass.getContactsValue(acc.Id);
    
    DragAndDropClass.getContacts(acc.Name);
    
    DragAndDropClass.getAccId('D');
    System.assertEquals(acc2.Id, DragAndDropClass.getAccId('D'));

    DragAndDropClass.TransferCon(acc.Id, acc2.Id);
    System.assertEquals(acc2.Id, DragAndDropClass.TransferCon(acc.Id, acc2.Id));
    
    test.stopTest();
  }
}
