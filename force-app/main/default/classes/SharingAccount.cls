public with sharing class SharingAccount {
    public void SharingAccount(List<Account> account) {
        for (Account acc : account) {
            if(acc.Rating == 'Hot'){
                AccountShare ash = new AccountShare();
                ash.AccountId = '0015j000019HqnGAAS';
                ash.UserOrGroupId = '0055j000008WtJmAAK';
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