@isTest
public class lwcClass_Test {
  @isTest
  public static void lwcClass_Test() {
    Account acc = new Account(Name = 'Account');
    insert acc;
    List<Account> accs = new List<Account>();
    accs.add(acc);

    Contact con = new Contact(LastName = 'Koshti' , AccountId = acc.Id);
    insert con;
    List<Contact> cons = new List<Contact>();
    cons.add(con);

    Lead L = new Lead(
      LastName = 'Lead 1',
      Company = 'xyz',
      Status = 'Open - Not Contacted'
    );
    insert L;
    List<Lead> leads = new List<Lead>();
    leads.add(L);

    List<String> emails = new List<String>();
    emails.add('d@gmail.com');

    Test.startTest();
    lwcClass.getAccounts();
    lwcClass.getAllContacts();
    lwcClass.getAllLead();
    lwcClass.getAllContacts();
    // lwcClass.getCon(con.Id);
    // lwcClass.sendEmail(emails, 'Hello', 'Dhairya');

    // System.assertEquals(accs, lwcClass.getAccounts());
    // System.assertEquals(cons, lwcClass.getAllContacts());
    // System.assertEquals(leads, lwcClass.getAllLead());
    // System.assertEquals(cons, lwcClass.getContacts(acc.Id));
    System.assertEquals(
      'Success ',
      lwcClass.sendEmail(emails, 'Hello', 'Dhairya')
    );
    System.assertEquals('Failed ', lwcClass.sendEmail(emails, '', ''));

    System.assertEquals(
      'Success ',
      lwcClass.sendEmail1(emails, 'Hello', 'Dhairya', '12324924723')
    );
    System.assertEquals('Failed ', lwcClass.sendEmail1(emails, '', '', ''));
    System.assertEquals(con, lwcClass.getCon(con.Id));
    Test.stopTest();
  }
}
