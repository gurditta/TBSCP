public class Test
{
public List<Integer> counterId{get;set;}
List<SelectOption> options{get;set;}
public List<Store__c> finances;
public string refresh =  Apexpages.currentPage().getParameters().get('refresh');
public Test(ApexPages.StandardController controller)
{
}
/*public List<Store__c> getstr(){

return str;

}*/
public Test()

{

options = new List<SelectOption>();
options.add(new SelectOption('Audi','Audi'));
counterId = new List<Integer>();
counterId.add(1);
}
public PageReference addFilter()
{
counterId.add(1);

return null;
}
public List<SelectOption> getCars()
{

return options;
}
public List<Store__c> getfinances(){
     finances=[Select Name from Store__c];   
         return finances;
    
}


Public PageReference save(){ 
     
         upsert finances;  
    return null;        
         
        } 
    
}