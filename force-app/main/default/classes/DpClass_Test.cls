@isTest
public class DpClass_Test {
  @isTest
  public static void ListFiles_Test() {
    Api_Key__c a = new Api_Key__c();
    a.Name = 'First';
    a.Api_Value__c = 'xxxx1ownef';
    insert a;
    Test.setMock(HttpCalloutMock.class, new MockTestHttpClass());
    Test.startTest();
    dPClass.ListFiles();
    String s = dPClass.ListFiles();
    // System.assertEquals('success', s);
    // System.assertEquals('{"example": "test"}', s);
    Test.stopTest();
  }
  @IsTest
  static void DeleteFiles_Test() {
    Api_Key__c a = new Api_Key__c();
    a.Name = 'First';
    a.Api_Value__c = 'xxxx1ownef';
    insert a;
    Test.setMock(HttpCalloutMock.class, new MockTestHttpClass());
    Test.startTest();
    dPClass.DeleteFiles('hello/pdf');
    String s = dPClass.DeleteFiles('hello/pdf');
    // System.assertEquals('success', s);
    // System.assertNotEquals('error', s);
    Test.stopTest();
  }
  @IsTest
  static void UploadFiles_Test(){
    ContentVersion CV = new ContentVersion();
    CV.Title='HelloWorld';
    CV.PathOnClient='HelloWorld.txt';
    CV.VersionData = Blob.valueOf('Hello');
    CV.ContentDocumentId = '0695j00000IESkxAAH';
    insert CV;

    Api_Key__c a = new Api_Key__c();
    a.Name = 'First';
    a.Api_Value__c = 'xxxx1ownef';
    insert a;

    Test.setMock(HttpCalloutMock.class, new MockTestHttpClass());
    Test.startTest();
    dPClass.Upload(CV.ContentDocumentId);
    System.debug(CV.ContentDocumentId);
    String s = dPClass.Upload(CV.ContentDocumentId);
    // System.assertEquals('success', s);
    // System.assertNotEquals('error', s);
    Test.stopTest();
    
  }
}
// }
