@isTest
public class DeleteAccountRecords_Test {
    @isTest static void DeleteAccountRecords_Test() {
        List<Contact> Contact = new List<Contact>();
        Account acc = new Account(Name = 'Account');
        insert acc;
        Contact con = new Contact(LastName = 'Dhairya', AccountId = acc.Id);
        insert con;
        Contact.add(con);
        test.startTest();
        DeleteAccountRecords DAR = new DeleteAccountRecords();
        DAR.DeleteAccountRecords(Contact);
        test.stopTest();
    }
}