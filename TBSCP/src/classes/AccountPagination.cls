public class AccountPagination {

    
    public String selectedRowIndex{get;set;}  
     
     public AccountPagination()
    {  
       selectedRowIndex = '0';
        
    }

   
    public List<Store__c> getAccountPagination() {
     List<Store__c> str=[Select Id,Name from Store__c order by CreatedDate];   
         return str;
    } 
    
    public PageReference Add(){    
    PageReference pr = new PageReference('/apex/add');
     return pr;    
    }
    public PageReference Del(){ 
    selectedRowIndex= System.currentPageReference().getParameters().get('rowToBeDeleted');   
     List<Store__c> str1=[Select Name from Store__c Where Id=:selectedRowIndex];                       
    try {
      delete str1;
    } catch (DmlException e) {
    // Process exception here 
    
      }
     return null;    
    }

    
    
    
}