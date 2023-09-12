global class RatingIsWarm implements Schedulable {
    global void execute(SchedulableContext sc){
        RatingIsWarm.Rate();
    }
    public static void Rate() {
        List<Account> Upd = new List<Account>();
        for (Account acc : [select Rating, Id, Name from Account]) {
            acc.Rating = 'Warm';
            Upd.add(acc);
        }
        update Upd;
    }
}