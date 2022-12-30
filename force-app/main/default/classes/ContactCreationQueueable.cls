public class ContactCreationQueueable implements Queueable{
public list<account> acclisttocreateContacts; 
    public ContactCreationQueueable(List<account>expectingAccountFromTrigger){
        this.acclisttoCreateContacts=expectingAccountfromTrigger;
        
    }
    public void execute(QueueableContext qCont){
        list<contact> conlisttoinsert =new list<Contact>();
        
        for(account acc:acclisttoCreateContacts){
            Contact con =new Contact();
            con.lastname=acc.name;
            con.accountId =acc.id;
            conlisttoinsert.add(con);
                 
        }
        if(conlisttoinsert.size()>0)
            INSERT conlisttoinsert;
    }    
}