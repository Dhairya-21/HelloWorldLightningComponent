@isTest
public class ApprovalAccount_Test {
    @isTest static void ApprovalAccount1() {
        List<Account> ListAcc = new List<Account>();
        Test.startTest();
        ApprovalAccount appAcc = new ApprovalAccount();
        appAcc.ApprovalAccount(ListAcc);
        Test.stopTest();
    }
}