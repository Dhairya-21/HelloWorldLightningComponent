public with sharing class EmailAlert {
    public void EmailAlert(List<Account> account) {
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        for (Account acc : account) {
            String[] add1 = new String[]{String.valueOf(acc.Email__c)};
            mail.setToAddresses(add1);
            mail.setSubject('Update to account');
            mail.setPlainTextBody('Hello '+ add1+', Account has been updated.');
            Messaging.SendEmail(new Messaging.SingleEmailMessage[]{mail});
        }
    }
}