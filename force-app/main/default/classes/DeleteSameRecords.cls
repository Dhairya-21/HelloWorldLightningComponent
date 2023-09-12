public with sharing class DeleteSameRecords {
    public void DeleteSameRecords(List<Account> account) {
        List<String> Name = new List<String>();
        List<Account> act = new List<Account>();
        for (Account acc : account) {
            Name.add(acc.Name);
        }
        for (Account a : [SELECT Id, Name FROM Account]) {
            if(!(Name.contains(a.Name))){
                act.add(a);
            }
        }
        delete act;
    }
}