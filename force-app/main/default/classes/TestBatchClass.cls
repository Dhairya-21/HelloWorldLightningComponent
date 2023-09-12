global class TestBatchClass implements Database.Batchable<sObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id,Name, Description FROM Account';
       
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope)
    {
        for(Account a : scope)
        {
            // a.Name = a.Name + '1';
            a.Description = String.valueOf(DateTime.Now());
        }
        update scope;
    }
    global void finish(Database.BatchableContext BC) {
    }
}