@isTest
public class DisplayAccs_Test {
    @isTest
    public static void DisplayAccs_Test() {
        Account acc = new Account(Name = 'Account 1');
        insert acc;
        Test.startTest();
        DisplayAccs.AccountD();
        Test.stopTest();
    }
}