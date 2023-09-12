@isTest
public class RollUpSummary_test {
    @isTest static void RollUpSummary_test() {
        Account acc = new Account(Name = 'Acc', Total_Amount__c = 10);
        insert acc;
        List<Contact> Con = new List<Contact>();
        Contact c = new Contact(LastName = 'Dhairya', Amount__c = 30, AccountId = acc.Id);
        insert c;
        Con.add(c);
        Test.startTest();
        RollUpSummary RUS = new RollUpSummary();
        RUS.RollUpSummary(Con);
        Test.stopTest();
    }
}