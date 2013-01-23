public class DefaultValues {

    public DefaultValues(ApexPages.StandardSetController controller) {

    }




    Private Final HR_Dataform__c ld;    
    public DefaultValues(ApexPages.StandardController controller) {
        ld= (HR_Dataform__c)Controller.getRecord();
    }
   
    
    Public void Initialize(){
       
           
         
        
               
       
    }

}