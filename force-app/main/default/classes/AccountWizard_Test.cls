@isTest
public with sharing class AccountWizard_Test {
  @isTest
  public static void AccountWizard_Test() {
    Test.startTest();
    AccountWizardClass AWC = new AccountWizardClass();
    AccountWizardClass.CreateAcc('Dhairya', '9601331996', 'Hot');

    Account a = new Account(Name = 'Hello');
    insert a;
    AccountWizardClass.CreateCon('Dhairya', 'd@gmail.com', '1234567890', a.Id);

    AccountWizardClass.CreateEvent('Email', '20201010', '20201011', a.Id);
    Test.stopTest();
  }
}