public class TestDemoBatch implements database.Batchable<Sobject>{
    public Database.QueryLocator start(database.BatchableContext bc){
        return database.getQueryLocator('select id,name from account');
        
    }
    public void execute(database.BatchableContext bc,list<account> sublistfromstartmethod){
        for(account acc: sublistfromstartmethod){
            acc.name ='batch is updated'+acc.name;
            
        }
        update sublistfromstartmethod;
    }
    public void finish(database.BatchableContext bc){
        system.debug('my batch job is done');
    }
}