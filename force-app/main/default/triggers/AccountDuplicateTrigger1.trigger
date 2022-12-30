trigger AccountDuplicateTrigger1 on Account (before insert) {
    for(account a: trigger.new){
        list<account> acc=[select id, name from account where name=:a.name];
        if(acc.size()>0){
            a.name.adderror('my account');
        }
    }
}