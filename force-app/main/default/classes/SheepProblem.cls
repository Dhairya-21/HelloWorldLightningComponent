public with sharing class SheepProblem {
    public void SheepProblem(List<Contact> oldAcc, List<Contact> newAcc) {
        List<Contact> AllConts = new List<Contact>();
        for (Contact c : [SELECT Id, LastName, AccountId FROM Contact WHERE AccountId = :oldAcc[0].AccountId]) {
            AllConts.add(c);
        }
        for (Contact c : AllConts) {
            c.AccountId = newAcc[0].AccountId;
        }
        System.debug(AllConts);
        update allConts;
        }
    }