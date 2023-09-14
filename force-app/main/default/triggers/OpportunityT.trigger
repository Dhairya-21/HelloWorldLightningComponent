trigger OpportunityT on Opportunity (after insert) {
    TaskOnOpportunity td = new TaskOnOpportunity();
    td.TaskOnOpportunity();
    // ProspectingOpportunity prOpp = new ProspectingOpportunity();
    // prOpp.ProspectingOpportunity(Trigger.new);
}