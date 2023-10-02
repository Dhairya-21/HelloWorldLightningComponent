trigger ContextVariables on Account (before insert, after insert, before update, before delete, after undelete) {
    // if(Trigger.isExecuting){
    //     System.debug('It is executing');
    // }
    // if(Trigger.isInsert){
    //     System.debug('This is an Insert Trigger');
    // }
    // if(Trigger.isUpdate){
    //     System.debug('This is a Update Trigger');
    // }
    // if (Trigger.isDelete) {
    //     System.debug('This is a Delete Trigger');
    // }
    // if (Trigger.isBefore) {
    //     System.debug('This trigger runs before record is saved');
    // }
    // if (Trigger.isAfter) {
    //     System.debug('This trigger runs after records are saved');
    // }
    // if (Trigger.isUndelete) {
    //     System.debug('This trigger runs when the deleted flag of a record changes to false.');
    // }
    // System.debug('We can display new records using new'+ Trigger.new);
    // System.debug('We can display new Mapped records using newMap'+ Trigger.newMap);
    // System.debug('We can display old records using old'+ Trigger.old);
    // System.debug('We can display old Mapped records using oldMap'+ Trigger.oldMap);
    // System.debug('Return enum for current operation using operationType'+ Trigger.operationType);
    // System.debug('Display the number of records using size'+ Trigger.size);
}