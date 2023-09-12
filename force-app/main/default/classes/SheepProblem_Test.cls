@isTest
public class SheepProblem_Test {
    @isTest static void SheepProblem_Test() {
        Account acc = new Account(Name = 'Acc');
        insert acc;
        List<Contact> Con1 = new List<Contact>();
        List<Contact> Con2 = new List<Contact>();
        Contact c = new Contact(LastName = 'Dhairya', AccountId = acc.Id);
        insert c;
        Con1.add(c);
        Test.startTest();
        SheepProblem SP = new SheepProblem();
        SP.SheepProblem(Con1, Con2);
        Test.stopTest();
    }
}