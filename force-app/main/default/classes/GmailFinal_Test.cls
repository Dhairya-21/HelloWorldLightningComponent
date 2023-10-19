@isTest
public class GmailFinal_Test {
    @isTest
    public static void GmailFinal_Test() {
        ContentVersion CV = new ContentVersion();
        CV.Title = 'SampleEmail';
        CV.PathOnClient = 'SampleEmail.jpg';
        CV.VersionData = Blob.valueOf('SampleEmail');
        // CV.ContentType = 'image/jpeg';
        insert CV;

        Test.setMock(HttpCalloutMock.class, new MockTestHttpClass());
        Test.startTest();
        GmailFinal.sendEmail('d@gmail.com', 'Hello', 'Test Class', CV.Id, 'image/jpeg');
        System.assertEquals('Fail', GmailFinal.sendEmail('address', 'subject', 'body', '', ''));
        Test.stopTest();
    }
}