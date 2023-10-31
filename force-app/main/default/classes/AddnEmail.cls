public class AddnEmail {
    // VF Page
    public Account accs{get; set;}
    public Id recordI;

    public AddnEmail(){
        recordI = ApexPages.currentPage().getParameters().get('Id');
        accs = [SELECT Id, OwnerId, Name, ParentId, AccountNumber, Type, Industry, AnnualRevenue, BillingAddress, ShippingAddress, Status__c, Phone, Rating, Description, LastModifiedById FROM Account WHERE Id =: recordI];
    }
    public void accept(){
        accs.Status__c = 'Accepted';
        update accs;
    }
    public void reject(){
        accs.Status__c = 'Rejected';
        update accs;
    }

    public static void name() {
        AddnEmail a = new AddnEmail();
        System.debug(a.recordI);
    }
    // Send Email
    @AuraEnabled
    public static String SendEmailMessage(String ToAdd, String CCAdd, String BCCAdd, String Subject, String Body, String recordId) {
        Messaging.SingleEmailMessage SEM = new Messaging.SingleEmailMessage();
        List<String> Adds = new List<String>();
        List<String> CCAdds = new List<String>();
        List<String> BCCAdds = new List<String>();
        Adds.add(ToAdd);
        // Adds = ToAdd.split(',');
        SEM.setToAddresses(Adds);
        SEM.setSubject(Subject);
        SEM.setHtmlBody(Body);
        if (CCAdd != '') {
            CCAdds.add(CCAdd);
            // CCAdds = CCAdd.split(',');
            SEM.setCcAddresses(CCAdds);
        }
        if (BCCAdd != '') {
            BCCAdds.add(BCCAdd);
            // BCCAdds = BCCAdd.split(',');
            SEM.setBccAddresses(BCCAdds);
        }
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] {SEM});  //comment out - Only when sending email
        return 'Success';
    }
}