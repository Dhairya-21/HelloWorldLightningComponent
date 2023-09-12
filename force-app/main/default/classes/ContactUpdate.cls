global class ContactUpdate implements Database.Batchable<SObject>
{
    global Database.QueryLocator start(Database.BatchableContext BC)
    {
        String query = 'SELECT Id, LastName, Description FROM Contact';
        
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC, List<Contact> scope)
    {
        for (Contact con : scope) 
        {
            // con.LastName = con.LastName + '1';
            con.Description = 'Hello';
        }
        update scope;
    }
    global void finish(Database.BatchableContext BC)
    {}
}