@isTest
public class CreateContactAccount_Test {
    @isTest static void CreateContactAccount_Test() {
        List<Account> Account = new List<Account>();
        Account acc = new Account(Name = 'Dhairya');
        Account.add(acc);
        test.startTest();
        CreateContactAccount CCA = new CreateContactAccount();
        CCA.CreateContactAccount(Account);
        test.stopTest();
    }
}