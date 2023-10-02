public class DisplayAccs {
    @AuraEnabled
    public static List<Account> AccountD(){
        List<Account> acc = new List<Account>();
        acc = [SELECT Name, Phone,(SELECT Name FROM Opportunities), (SELECT Name FROM Contacts) FROM Account];
        return acc;
    }
}