trigger NewCustomerOpp on Opportunity (after insert, after update) {
    Opportunity op = new Opportunity();
    op = [SELECT Name, StageName, CloseDate, Type FROM Opportunity WHERE Id IN :Trigger.new];
    if(op.Type != 'New Customer'){
        // op = [SELECT Name, StageName, CloseDate, Type FROM Opportunity WHERE LastModifiedDate = this_year LIMIT 1];
        op.Type = 'New Customer';
        update op;
    }
}