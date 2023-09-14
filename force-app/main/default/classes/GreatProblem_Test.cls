@isTest
public class GreatProblem_Test {
    @isTest static void GreatProblem_Test() {
        Account acc = new Account(Name = 'Acc', Max_Amount__c = 25);
        insert acc;
        List<Contact> Con = new List<Contact>();
        Contact c = new Contact(LastName = 'Dhairya', Amount__c = 30, AccountId = acc.Id);
        insert c;
        Con.add(c);
        Test.startTest();
        GreatProblem GP = new GreatProblem();
        GP.GreatProblem(Con);
        Test.stopTest();
    }
}