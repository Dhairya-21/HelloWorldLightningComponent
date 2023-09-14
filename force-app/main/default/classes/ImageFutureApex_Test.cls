@isTest
public class ImageFutureApex_Test {
    @isTest static void ImageFutureApex_Test() {
        Test.startTest();
        Opportunity opp = new Opportunity();
        ApexPages.StandardController st = new ApexPages.StandardController(opp);
        ImageFutureApex IFA = new ImageFutureApex(st);
        ImageFutureApex.ImageApex();
        Test.stopTest();
        if ( !Test.isRunningTest() ){
            new Http().send(new HttpRequest());
        } 
    }
}