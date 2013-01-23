public with sharing class PassParameterActionFunction {
    public List<Financial__c> finances{get; set;}
   // public List<Sales_Marketing__c> Sales{get; set;}
    public void echoVal(){
     finances = new List<Financial__c>();
     Financial__c fin = new Financial__c();
     fin.current_value__c = 45.890;
     finances.add(fin );
    }
}