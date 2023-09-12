public with sharing class ErrorLog {
    public void ErrorLog1() {
        List<Error_log__c> err = new List<Error_log__c>();
        Error_log__c err1 = new Error_log__c();
        for (Integer i = 0; i < 4; i++) {
            err1.Class_Name__c = 'Class ' + i;
            err1.Name = 'Error Log ' + i;
            err1.Exception_Message__c = 'This is an error caused by ';
            err1.Line_Number__c = i;
            err1.Method_Name__c = 'Method name ' + i;
            err1.More_Details__c = 'More details for error Log';
            err.add(err1);
        }
        insert err;
    }
}