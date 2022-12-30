trigger ContactDeleteTrigger on Contact (before delete) {
    for(Contact cc: Trigger.old){
   cc.adderror('dont delete old contact');
        
}
}