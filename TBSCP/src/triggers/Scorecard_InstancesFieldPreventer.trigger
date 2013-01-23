trigger Scorecard_InstancesFieldPreventer on Scorecard_Instances__c (before insert, before update) {
     Map<String, Scorecard_Instances__c > leadMap = new Map<String, Scorecard_Instances__c >();
    for (Scorecard_Instances__c  lead : System.Trigger.new) {          
            if ((lead.Depth_Frequency__c  != null) && (lead.Year__c != null) && (lead.ScorecardLink__c!= null) &&
                ( System.Trigger.isInsert ||
                (lead.Depth_Frequency__c  !=System.Trigger.oldMap.get(lead.Id).Depth_Frequency__c ) && (lead.Year__c!=System.Trigger.oldMap.get(lead.Id).Year__c) && (lead.ScorecardLink__c!=System.Trigger.oldMap.get(lead.Id).ScorecardLink__c))) {           
            if (leadMap.containsKey(lead.Depth_Frequency__c ) && leadMap.containsKey(lead.Year__c) &&  leadMap.containsKey(lead.ScorecardLink__c)) {
                lead.Depth_Frequency__c.addError('Another new Scorecard has the '
                                    + 'same Depth_Frequency__c  ');
            } else {
                 leadMap.put(lead.Depth_Frequency__c , lead);
                 leadMap.put(lead.Year__c, lead);
                  leadMap.put(lead.ScorecardLink__c, lead);
            }
       }
    }   
     
    for (Scorecard_Instances__c  lead : [SELECT Depth_Frequency__c , Year__c , ScorecardLink__c FROM Scorecard_Instances__c  
                      WHERE Depth_Frequency__c  IN :leadMap.KeySet() and Year__c IN :leadMap.KeySet() and ScorecardLink__c IN :leadMap.KeySet() ]) {
        Scorecard_Instances__c  newLead = leadMap.get(lead.Depth_Frequency__c );
        newLead.Depth_Frequency__c.addError('A Scorecard_Instance with this Month'
                               + ' already exists.');
        Scorecard_Instances__c  newLead2 = leadMap.get(lead.Year__c);
        newLead2.Year__c.addError('A Scorecard_Instance with this Year'
                               + ' already exists.');  
         Scorecard_Instances__c  newLead3 = leadMap.get(lead.ScorecardLink__c);
          newLead2.ScorecardLink__c.addError('A Scorecard_Instance with this Type'
                               + ' already exists.');  
                          
                                  
    }
}