public class Currencycovertbatch implements Database.Batchable<sObject>,Database.AllowsCallouts{
    public Database.QueryLocator start(Database.BatchableContext BC){
        return Database.getQueryLocator('select id, CAD__c,EUR__c,PLN__c, amount from opportunity');
    }
    
    public void execute(Database.BatchableContext BC, List<opportunity> scope){
        http p =new http();
        string apikey ='8eb95845817a886f486d70daa73aeb0c';
        httprequest request = new httprequest();
        string endpoint = 'http://apilayer.net/api/live?';
        endpoint =endpoint+'access_key='+apikey;
        endpoint =endpoint+'&currencies = CAD,EUR,PLN & source = USD & format = 1';
        request.setEndpoint(endpoint);
        request.setMethod('GET');
        httpResponse response =p.send(request);
        string JsonString =response.getBody();
        system.debug(JsonString);
       system.JSONParser jp =json.createParser(JsonString);
        decimal USDCAD;
        decimal USDEUR;
        decimal USDPLN;
        while(jp.nextToken() != null){
             if(jp.getText()=='USDCAD'){
                jp.nextToken();
                USDCAD =jp.getDecimalValue();
                 }
            if(jp.getText()=='USDEUR'){
                jp.nextToken();
                USDEUR =jp.getDecimalValue();
                 }
           
            if(jp.getText()=='USDPLN'){
                jp.nextToken();
                USDPLN =jp.getDecimalValue();
                 }
           
        }
        list<Opportunity> opplist =new list<Opportunity>();
        for(opportunity opp :Scope) {
            if(opp.Amount!=null){
            opp.CAD__c = opp.amount*USDCAD;
            opp.EUR__c = opp.amount*USDEUR;
            opp.PLN__c = opp.amount*USDPLN;
            opplist.add(opp);
            }
        }
        Update Opplist;
        system.debug(Opplist);
    
    }
    public void finish(Database.BatchableContext BC){
    }
    
}