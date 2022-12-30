trigger OpportunityDuplicatetrigger on Opportunity (before insert) {
    for(Opportunity Opp: trigger.new){
        List<Opportunity> Opplist= [select id, Name from Opportunity where Name=: Opp.Name];
        if(Opplist.size()>0){
           Opp.name.adderror('don not entre copy name');
            
        }
        
    }  

}