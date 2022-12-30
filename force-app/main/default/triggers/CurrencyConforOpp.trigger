trigger CurrencyConforOpp on Opportunity (after insert) {
    
    if(Trigger.isInsert && Trigger.isAfter){
        list<id> oppids =new list<id>();
        for(opportunity opp:Trigger.new){
            if(opp.amount != null){
             oppids.add(opp.id);    
            }  
        }
    CurrencyExchange.getcurrency(oppids);
}
}