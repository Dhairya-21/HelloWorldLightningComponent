@isTest
public class UpdateAccNameBatch_Test {
    @isTest static void UpdateAccNameBatch_Test() {
        List<Account> AccountT = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            Account acc = new Account();
            acc.Name = 'Acc ' + i;
            System.debug(acc.opportunities);
            AccountT.add(acc);
        }
        insert AccountT;
        Opportunity Opp = new Opportunity(Name = 'Opp ', StageName = 'Prospecting', CloseDate = Date.today()+13);
        Opp.AccountId = AccountT[0].Id;
        insert Opp;
        Test.startTest();
        UpdateAccNameBatch UANB = new UpdateAccNameBatch();
        Database.executeBatch(UANB);
        Test.stopTest();
    }
}