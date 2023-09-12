@isTest
public class EmailAlert_Test {
    @isTest static void EmailAlert_Test() {
        List<Account> Account = new List<Account>();
        Account acc = new Account(Name = 'Dhairya');
        Account.add(acc);
        EmailAlert EA = new EmailAlert();
        EA.EmailAlert(Account);
    }
}