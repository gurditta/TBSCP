trigger UpdateScorecard_InstancesName on Scorecard_Instances__c (after insert) {
    Set<ID> setaccId = new Set<ID>();
    for(Scorecard_Instances__c  acc : trigger.new)
        {
            setaccId.add(acc.Id);
        }    
    if(setaccId.size() > 0)
        {    
            List<Scorecard_Instances__c > listTask = [Select Name, Depth_Frequency__c, Year__c from Scorecard_Instances__c  where Id in: setaccId];
            for(Scorecard_Instances__c  t : listTask )
              {
              t.Name= t.Name+'_'+t.Depth_Frequency__c+'_'+t.Year__c;
              }           
            //update listTask 
            update listTask;    
        }
}