@isTest
public class DeleteSameRecords_Test {
    @isTest static void DeleteSameRecords_Test() {
        List<Account> Account = new List<Account>();
        Account acc = new Account(Name = 'Dhairya');
        insert acc;
        Account.add(acc);
        test.startTest();
        DeleteSameRecords DSR = new DeleteSameRecords();
        DSR.DeleteSameRecords(Account);
        test.stopTest();
    }
}