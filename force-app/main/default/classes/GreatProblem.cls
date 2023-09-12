public class GreatProblem {
    public void GreatProblem(List<Contact> contact) {
        List<Account> acc = new List<Account>();
        List<Contact> NewContacts = new List<Contact>();
        Integer amt = 0;
        acc.add([SELECT Max_Amount__c FROM Account WHERE Id = :contact[0].AccountId]);
        for (Contact c : contact) {
            amt = Integer.valueOf(c.Amount__c / acc[0].Max_Amount__c);
                NewContacts.addAll(CreateContact(amt, acc[0], c));
            // c.Amount__c = math.mod(Integer.valueOf(c.Amount__c), Integer.valueOf(acc[0].Max_Amount__c));
        }
        update NewContacts;
    }
    public static List<Contact> CreateContact(Integer NoOfContact, Account ParentAcc, Contact con) {
        List<Contact> AllConts = new List<Contact>();
        for (Integer i = 1; i < NoOfContact; i++) {
            Contact c = new Contact();
            c = [SELECT Amount__c, LastName, AccountId FROM Contact Where Id = :con.Id];
            c.Amount__c = ParentAcc.Max_Amount__c;
            c.LastName = 'Name' + i;
			c.AccountId = ParentAcc.Id;
            AllConts.add(c);
        }
        return AllConts;
    }
}