@isTest
public class CreateEvent_Test {
    @isTest static void CreateEvent_Test() {
        List<Contact> contact = new List<Contact>();
        Contact con = new Contact(LastName = 'Dhairya');
        contact.add(con);
        test.startTest();
        CreateEvent CE = new CreateEvent();
        CE.CreateEvent(contact);
        test.stopTest();
    }
}