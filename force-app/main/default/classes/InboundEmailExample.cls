global class InboundEmailExample implements Messaging.InboundEmailHandler {
    global Messaging.InboundEmailResult handleInboundEmail(Messaging.inboundEmail email,Messaging.InboundEnvelope envelop){
        Messaging.InboundEmailResult result = new Messaging.InboundEmailResult();
        lead lrd = new lead();
        lrd.lastname = email.fromName;
        lrd.company = 'My Company';
        lrd.Description = email.plainTextBody;  
        string message;
        try{
            insert lrd;
            system.debug(lrd.id);
            result.message = 'success';
             
        }
        Catch(Exception e){
           result.message = 'fail';          
        }    
       
        // Save attachments, if any
        list<Attachment> attchlist = new list<Attachment>();
        Messaging.InboundEmail.binaryAttachment[] mylist = email.binaryAttachments;
        for(Messaging.Inboundemail.binaryAttachment tAttachment : mylist) {
            Attachment attachment = new Attachment();
            attachment.Name = tAttachment.fileName;
            attachment.Body = tAttachment.body;
            attachment.ParentId = lrd.Id;
            attchlist.add(attachment);          
        }
        insert attchlist;
        return result;
    }
}