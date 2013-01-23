trigger UpdateFinanceName on Finance_Dataform__c(after insert) {
    Set<ID> setaccId = new Set<ID>();
    for(Finance_Dataform__c acc : trigger.new)
        {
            setaccId.add(acc.Id);
        }    
    if(setaccId.size() > 0)
        {    
            List<Finance_Dataform__c> listTask = [Select Name, Month__c, Year__c from Finance_Dataform__c where Id in: setaccId];
            for(Finance_Dataform__c t : listTask )
              {
              t.Name= t.Name+'_'+t.Month__c+'_'+t.Year__c;
              }           
            //update listTask 
            update listTask;    
        }
}