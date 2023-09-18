public with sharing class ApprovalAccount {
    public void ApprovalAccount(List<Account> account) {
        try {
            Approval.ProcessSubmitRequest app = new Approval.ProcessSubmitRequest();
            app.setComments('Approval sent');
            for (Account acc : account) {
                app.setObjectId(acc.Id);
                Approval.ProcessResult res = Approval.process(app);
            }
        } catch (Exception e) {
            System.debug('Error is ' + e.setMessage());
        }
    }
}