@isTest
public class DeleteSameRecords_Test {
    @isTest static void DeleteSameRecords_Test() {
        List<Account> Account = new List<Account>();
        Account acc = new Account(Name = 'Dhairya');
        insert acc;
        Account.add(acc);
        Account acc2 = new Account(Name = 'Dhairya');
        insert acc2;
        Account.add(acc2);
        test.startTest();
        DeleteSameRecords DSR = new DeleteSameRecords();
        DSR.DeleteSameRecords(Account);
        test.stopTest();
    }
}