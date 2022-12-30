public class Dynamicsoqlexample {
public static list<account> fetch(){
        String SobjectApiName = 'Account';
        Map<String, Schema.SObjectType> schemaMap = Schema.getGlobalDescribe();        
        Map<String, Schema.SObjectField> fieldMap = schemaMap.get(SobjectApiName).getDescribe().fields.getMap();    
        String commaSepratedFields = '';
        for(String fieldName : fieldMap.keyset()){
            if(commaSepratedFields == null || commaSepratedFields == ''){
                commaSepratedFields = fieldName;                  
            }else{
                commaSepratedFields = commaSepratedFields + ', ' + fieldName;              
            }
        }        
        String query = 'select ' + commaSepratedFields + ' from ' + SobjectApiName;
        system.debug('query'+query);
        return Database.query(query);

     
       
    }
}