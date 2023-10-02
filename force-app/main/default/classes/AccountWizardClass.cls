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
}