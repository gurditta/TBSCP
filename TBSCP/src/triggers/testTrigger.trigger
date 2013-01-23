trigger testTrigger on Finance_Dataform__c(before insert) {
    for(Finance_Dataform__c c :Trigger.New){
        c.Month__c='January';   //Active  is a custom picklist field in Campaign object
    }
}