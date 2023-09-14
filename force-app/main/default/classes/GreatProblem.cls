public class GreatProblem {
    public void GreatProblem(List<Contact> contact){
        List<Contact> conAdd = new List<Contact>();
        Contact cn = [SELECT LastName, Amount__c, Id, AccountId FROM Contact WHERE Id = : contact[0].Id];
        Account acc = [SELECT Id, Max_Amount__c, Name FROM Account WHERE Id = :contact[0].AccountId];
        Integer Max = Integer.valueOf(acc.Max_Amount__c);
        Integer Amt = Integer.valueOf(contact[0].Amount__c);
        if (Max < Amt) {
            Integer num = Integer.valueOf(Amt / Max);
            for (Integer i = 1; i <= num; i++) {
                Contact c = new Contact();
                c.LastName = 'Contact ' + i;
                c.Amount__c = Max;
                c.AccountId = cn.AccountId;
                conAdd.add(c);
            }
            cn.Amount__c = Amt - (Max * num);
            System.debug(conAdd);
            System.debug(cn);
            insert conAdd;
            update cn;
        }
    }
}