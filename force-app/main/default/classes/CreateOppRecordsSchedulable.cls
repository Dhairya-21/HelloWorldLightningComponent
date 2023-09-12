global class CreateOppRecordsSchedulable implements Schedulable {
    global void execute(SchedulableContext sc){
        CreateOppRecordsSchedulable c = new CreateOppRecordsSchedulable();
        c.CreateOppRecordsSchedulable();
        // String cron = '0 30 11 * * ?';
        // System.schedule('CreateOppCron', cron, c);
    }
    global void CreateOppRecordsSchedulable() {
        List<Opportunity> opp = new List<Opportunity>();
        for (Integer i = 1; i <= 10; i++) {
            Opportunity o = new Opportunity();
            o.Name = 'DailyOpp ' + i;
            o.Amount = 10000 * i + 20 * i - 17 * math.pow(i, 2);
            o.CloseDate = date.today() + 15;
            if (math.mod(i, 2) == 0) {
                o.StageName = 'Qualification';   
            }
            else {
                o.StageName = 'Prospecting';
            }
            opp.add(o);
        }
        insert opp;
    }
}