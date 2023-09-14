public with sharing class SharingAccount {
    public void SharingAccount(List<Account> account) {
        User u = new User();
        u = [Select Name, Id from User where name = 'Jay Patel' LIMIT 1];
        for (Account acc : account) {
            if(acc.Rating == 'Hot'){
                AccountShare ash = new AccountShare();
                ash.AccountId = acc.Id;
                // ash.UserOrGroupId = '0055j000008WtJmAAK';
                ash.UserOrGroupId = u.Id;
                ash.AccountAccessLevel = 'Edit';
                ash.CaseAccessLevel = 'Edit';
                ash.OpportunityAccessLevel = 'Edit';
                // ash.ContactAccessLevel = 'Edit';
                ash.RowCause = Schema.AccountShare.RowCause.Manual;
                // Database.SaveResult dsr = Database.insert(ash, false);
                insert ash;
            }
        }
    }
}