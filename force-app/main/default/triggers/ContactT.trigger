trigger ContactT on Contact (after insert, after update, before delete) {
    // if(Trigger.isInsert){
    //     CreateEvent c = new CreateEvent();
    //     c.CreateEvent(Trigger.new);
    // }
    // if (Trigger.isDelete) {
    //     DeleteAccountRecords d = new DeleteAccountRecords();
    //     d.DeleteAccountRecords(Trigger.old);
    // }
    // PrefixSalutation pf = new PrefixSalutation();
    // pf.PrefixSalutation(Trigger.new);
    //
    // if (Trigger.isInsert || Trigger.isUpdate) {
    //     RollUpSummary r = new RollUpSummary();
    //     r.RollUpSummary(Trigger.new);
    // }
    // if (Trigger.isDelete) {
    //     RollUpSummary r = new RollUpSummary();
    //     r.RollUpSummary(Trigger.old);
    // }
    // if (Trigger.isUpdate && (Trigger.isExecuting)) {
    //     SheepProblem s = new SheepProblem();
    //     s.SheepProblem(Trigger.old, Trigger.new);
    // }
    // if(Trigger.isInsert || Trigger.isUpdate){
    //     GreatProblem g = new GreatProblem();
    //     g.GreatProblem(Trigger.new);
    // }
}