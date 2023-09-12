@isTest
private class TestVerifyDate {

    @isTest static void Test1() {
        Date dt = VerifyDate.CheckDates(Date.valueOf('2023-09-06'), Date.valueOf('2023-10-21'));
        System.assertEquals(Date.valueOf('2023-09-30'), dt);
    }
    @isTest static void Test2() {
        Date dt = VerifyDate.CheckDates(Date.valueOf('2023-09-06'), Date.valueOf('2023-09-11'));
        System.assertEquals(Date.valueOf('2023-09-11'), dt);
    }
    @isTest static void Test3() {
        Date dt = VerifyDate.SetEndOfMonthDate(Date.valueOf('2023-09-06'));
        System.assertEquals(Date.valueOf('2023-09-30'), dt);
    }
    @isTest static void Test4() {
        boolean b = VerifyDate.DateWithin30Days(Date.valueOf('2023-09-06'),Date.valueOf('2023-09-11'));
        System.assertEquals(true, b);
    }
    @isTest static void Test5() {
        boolean b = VerifyDate.DateWithin30Days(Date.valueOf('2023-09-06'),Date.valueOf('2023-11-11'));
        System.assertEquals(false, b);
    }
    @isTest static void Test6() {
        boolean b = VerifyDate.DateWithin30Days(Date.valueOf('2023-09-06'), Date.valueOf('2023-08-11'));
        System.assertEquals(false, b);
    }
}