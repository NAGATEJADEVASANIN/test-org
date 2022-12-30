trigger AccountTriggerContact on Account (after insert) {
    if(Trigger.isafter && Trigger.isinsert){
        system.enqueueJob(new ContactCreationQueueable(trigger.new));
        
    }

}