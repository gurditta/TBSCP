trigger leadDuplicatePreventer on Finance_Dataform__c(before insert, before update) {
     Map<String, Finance_Dataform__c> leadMap = new Map<String, Finance_Dataform__c>();
    for (Finance_Dataform__c lead : System.Trigger.new) {          
            if ((lead.Name != null) &&
                (System.Trigger.isInsert ||
                (lead.Name !=System.Trigger.oldMap.get(lead.Id).Name))) {           
            if (leadMap.containsKey(lead.Name)) {
                lead.Name.addError('Another new Dataform has the '
                                    + 'same Name ');
            } else {
                leadMap.put(lead.Name, lead);
            }
       }
    }   
     
    for (Finance_Dataform__c lead : [SELECT Name FROM Finance_Dataform__c 
                      WHERE Name IN :leadMap.KeySet()]) {
        Finance_Dataform__c newLead = leadMap.get(lead.Name);
        newLead.Name.addError('A lead with this Name'
                               + ' already exists.');
    }
}