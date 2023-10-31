public class portalCommunityController {
  @AuraEnabled(cacheable=true)
  public static list<Student_Detail__c> Recordsget() {
    list<Student_Detail__c> SD = new List<Student_Detail__c>();
    SD = [SELECT Id, Name, Address__c, Age__c, Email__c, Personal_Phone_no__c, Last_Name__c, Feedback__c FROM Student_Detail__c];
    return SD;
  }

  @AuraEnabled
  public static string updateStudent(SObject ac){
    update ac;
    return 'Success';
    } 
}
