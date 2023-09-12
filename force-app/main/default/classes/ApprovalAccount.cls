public with sharing class ApprovalAccount {
    public void ApprovalAccount(List<Account> account) {
        Approval.ProcessSubmitRequest app = new Approval.ProcessSubmitRequest();
        app.setComments('Approval sent');
        for (Account acc : account) {
            app.setObjectId(acc.Id);
            Approval.ProcessResult res = Approval.process(app);
        }
    }
}