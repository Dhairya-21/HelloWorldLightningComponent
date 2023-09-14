public with sharing class TaskOnOpportunity {
    public void TaskOnOpportunity() {
        Task td = new Task();
        td.Subject = 'Opportunity Update';
        td.Description = 'A Opportunity has been modified. Please have a look.';
        // Id i = 0055j000008Wn3OAAS;
        td.ownerId = UserInfo.getUserId();
        td.Priority = 'High';
        insert td;
    }
}