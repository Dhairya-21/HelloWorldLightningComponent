@isTest
public class TestClass {
    @isTest static void RollUpSummary(){
        Account a = new Account();
        // insert a;
        List<Contact> ListCont = new List<Contact>();
        for (Integer i = 1; i <= 3; i++) {
            Contact c = new Contact();
            c.LastName = 'Contact ' + i;
            c.Amount__c = i * 100;
            c.AccountId = a.Id;
            ListCont.add(c);
        }
        // insert ListCont;
        RollUpSummary rl = new RollUpSummary();
        rl.RollUpSummary(ListCont);
    }

    @isTest static void SheepProblem(){
        Account acc = new Account();
        List<Contact> L1 = new List<Contact>();
        List<Contact> L2 = new List<Contact>();
        for (Integer i = 0; i < 2; i++) {
            Contact c = new Contact();
            c.LastName = 'Contact ' + i;
            c.AccountId = acc.Id;
            L1.add(c);
        }
        for (Integer i = 0; i < 2; i++) {
            Contact c = new Contact();
            c.LastName = 'Contact 2' + i;
            c.AccountId = acc.Id;
            L2.add(c);
        }
        SheepProblem sp = new SheepProblem();
        sp.SheepProblem(L1, L2);
        sp.SheepProblem(L2, L1);
    }

    @isTest static void GreatProblem(){
        Account acc = new Account();
        List<Contact> con = new List<Contact>();
        GreatProblem gp = new GreatProblem();
        gp.GreatProblem(con);
    }
    
    @isTest static void ContactUpdate(){
        System.Test.startTest();
        ContactUpdate cu = new ContactUpdate();
        Database.executeBatch(cu);   
        System.Test.stopTest();
    }

    @isTest static void CreateContactAccount(){
        List<Account> Account = new List<Account>();
        CreateContactAccount CCr = new CreateContactAccount();
        CCr.CreateContactAccount(Account);
    }

    @isTest static void CreateEvent(){
        List<Contact> Contact = new List<Contact>();
        CreateEvent CE = new CreateEvent();
        CE.CreateEvent(Contact);
    }

    @isTest static void CreateOppRecordsSchedulable(){
        System.Test.startTest();
        CreateOppRecordsSchedulable CORS = new CreateOppRecordsSchedulable();
        CORS.CreateOppRecordsSchedulable();
        System.Test.stopTest();
    }

    @isTest static void DeleteAccountRecords() {
        List<Contact> contact = new List<Contact>();
        DeleteAccountRecords DAR = new DeleteAccountRecords();
        DAR.DeleteAccountRecords(contact);
    }

    @isTest static void DeleteSameRecords() {
        List<Account> Account = new List<Account>();
        DeleteSameRecords DS = new DeleteSameRecords();
        DS.DeleteSameRecords(Account);
    }

    @isTest static void EmailAlert(){
        List<Account> Account = new List<Account>();
        EmailAlert EA = new EmailAlert();
        EA.EmailAlert(Account);
    }

    @isTest static void ErrorLog(){
        ErrorLog EL = new ErrorLog();
        EL.ErrorLog1();
    }

    @isTest static void FileUpdate(){
        FileUpdate FU = new FileUpdate();
        FU.FileUpdate1();
    }

    @isTest static void ImageFutureApex(){
        System.Test.startTest();
        ImageFutureApex.ImageApex();
        System.Test.stopTest();
    }

    @isTest static void LoginPageC(){
        LoginPageC CP=new LoginPageC();
        CP.Register();
    }

    @isTest static void PrefixSalutation(){
        List<Contact> Contact = new List<Contact>();
        PrefixSalutation PSP = new PrefixSalutation();
        PSP.PrefixSalutation(Contact);
    }

    @isTest static void ProspectingOpportunity(){
        List<Opportunity> Opportunities = new List<Opportunity>();
        ProspectingOpportunity PO = new ProspectingOpportunity();
        PO.ProspectingOpportunity(Opportunities);
    }

    @isTest static void RatingIsWarm(){
        // List<Account> Account = new List<Account>();
        RatingIsWarm.Rate();
    }

    @isTest static void SharingAccount(){
        List<Account> Account = new List<Account>();
        SharingAccount SA = new SharingAccount();
        SA.SharingAccount(Account);
    }

    @isTest static void TaskOnOpportunity(){
        TaskOnOpportunity TOO = new TaskOnOpportunity();
        TOO.TaskOnOpportunity();
    }

    @isTest static void TestBatchClass(){
        System.Test.startTest();
        TestBatchClass TBC = new TestBatchClass();
        Database.executeBatch(TBC);
        System.Test.stopTest();
    }

    @isTest static void TestBatchClassSchedulable() {
        System.Test.startTest();
        TestBatchClassSchedulable TBCS = new TestBatchClassSchedulable();
        String sch = '0 0 23 * * ?';
        System.schedule('Test Schedule', sch, TBCS);
        System.Test.stopTest();
    }
    
    @isTest static void UpdateAccNameBatch(){
        System.test.startTest();
        UpdateAccNameBatch UANB = new UpdateAccNameBatch();
        Database.executeBatch(UANB);
        System.test.stopTest();
    }

    @isTest static void OpportunityT(){
        System.test.startTest();
        System.test.stopTest();   
    }
    
    @isTest static void ContactT(){
        System.test.startTest();
        System.test.stopTest();   
    }
    
    @isTest static void LeadT(){
        System.test.startTest();
        System.test.stopTest();   
    }
    
    @isTest static void AccountT(){
        System.test.startTest();
        System.test.stopTest();   
    }
    
    @isTest static void ContextVariables(){
        System.test.startTest();
        System.test.stopTest();   
    }
}