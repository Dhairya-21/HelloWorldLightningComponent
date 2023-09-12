global class UpdateAccNameBatch implements Database.Batchable<SObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        // String query = 'Select AccountId, Id, Amount, CloseDate, Name,Account.Name from Opportunity Where AccountId <> null';
        String query = 'Select Id,(Select Name from opportunities) from account';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Account> scope){
        Integer i = 1;
        // for (Opportunity op : scope) {
            // op.Account.Name = 'hi';
            // op.CloseDate = Date.today()+6;
            // op.Account.Name = op.Name;
            // op.Name = op.Account.Name + i;
            // i++;
        // }
        List<Account> accn = new List<Account>();
        for (Account acc : scope) {
            if(acc.Id != null && acc.opportunities.size()>0){

                acc.Name = acc.opportunities[0].Name;
                accn.add(acc);
            }
        }
        update accn;
        }
    global void finish(Database.BatchableContext BC){
    }
}