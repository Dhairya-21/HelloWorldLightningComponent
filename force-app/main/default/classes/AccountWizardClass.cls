public with sharing class AccountWizardClass {
@AuraEnabled
public static Account CreateAcc(String name, String phone, String rating){
    Account acc = new Account();
    acc.Name= name;
    acc.Phone = phone;
    acc.Rating = rating;
    insert acc;
    return acc;
}
@AuraEnabled
public static Contact CreateCon(String name, String email, String phone, String accId){
    Contact con = new Contact();
    con.LastName= name;
    con.Email = email;
    con.Phone = phone;
    con.AccountId = accId;
    insert con;
    return con;
    }
    @AuraEnabled
    public static Event CreateEvent(String subject, String start , String endt, String accId){
        Datetime startTime = Datetime.valueOf(JSON.deserialize('"' + start + '"', Datetime.class));
        Datetime endTime = Datetime.valueOf(JSON.deserialize('"' + endt + '"', Datetime.class));
        Event e = new Event();

        e.Subject = subject;
        e.StartDateTime = startTime;
        e.ActivityDateTime = startTime;
        e.EndDateTime = endTime ;
        e.WhatId = accId;
        // e.WhoId = accId;
        insert e;
        return e;
    }
}