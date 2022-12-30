public class TransctionRollout {
    public static void testtransction(){ 
        try{
            Account acc = new account();
            acc.name = 'Manohar';
            insert acc;
            system.debug(acc.Id);	
            lead l1 = new lead();
            l1.company  = 'My Manu';
            l1.lastname = 'My ny manu';
            insert l1;
            system.debug(l1.Id);
            lead l2 = new lead();
            l2.Company ='xyz manu';
            l2.lastname = 'XXX manu';
            insert l2;
            system.debug(l2.id);
        }
        catch(Exception e){
            system.debug('Error maggesge'+e.getMessage());
        }
    }
}