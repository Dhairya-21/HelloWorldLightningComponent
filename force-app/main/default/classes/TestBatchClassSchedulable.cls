global class TestBatchClassSchedulable implements Schedulable {
    global void execute(SchedulableContext sc) {
        TestBatchClass b = new TestBatchClass(); 
        database.executebatch(b);
    }
}