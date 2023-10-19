@isTest
public with sharing class lwcSosl_Test {
    @isTest
    public static void lwcSosl_Test() {
        String st = 'Dh';
        List<String> lnum = new List<String>();
        lnum.add('Account');
        lnum.add('Contact');
        lnum.add('Opportunity');
        lnum.add('Lead');
        Test.startTest();
        lwcSosl.try1(st, lNum);
        Test.stopTest();
    }
}