@isTest
public class TestBatchClass_Test {
    @isTest static void TestBatchClass_Test() {
        List<Account> Acc = new List<Account>();
        for (Integer i = 0; i < 20; i++) {
            Account a = new Account();
            a.Name = 'Account' + i;
            Acc.add(a);
        }
        insert Acc;
        Test.startTest();
        TestBatchClass TBC = new TestBatchClass();
        Database.executeBatch(TBC);
        Test.stopTest();
    }
}