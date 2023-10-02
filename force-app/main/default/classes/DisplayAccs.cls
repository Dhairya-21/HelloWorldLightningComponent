public class DisplayAccs {
    @AuraEnabled
    public static List<AccountRet> AccountD(){
        List<AccountRet> AR = new List<AccountRet>();
        List<Account> acc = new List<Account>();
        acc = [SELECT Name, Phone,(SELECT Name FROM Opportunities), (SELECT LastName FROM Contacts) FROM Account];
        for (Account a : acc) {
            AccountRet ARN = new AccountRet();
            ARN.ContactList = a.Contacts;
            ARN.OpportunityList = a.Opportunities;
            ARN.Name = a.Name;
            ARN.Phone = a.Phone;
            AR.add(ARN);
        }
        return AR;
    }
    public class AccountRet {
        @AuraEnabled public String Name;
        @AuraEnabled public String Phone;
        @AuraEnabled public List<Opportunity> OpportunityList;
        @AuraEnabled public List<Contact> ContactList;
    }
}