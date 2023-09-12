@isTest
public class ApprovalAccount_Test {
    @isTest static void ApprovalAccount1() {
        List<Account> ListAcc = new List<Account>();
        Account acc = new Account(Name = 'Dhairya');
        ListAcc.add(acc);
        ApprovalAccount appAcc = new ApprovalAccount();
        appAcc.ApprovalAccount(ListAcc);
    }
}