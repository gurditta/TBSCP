public class BulkDeleteController

{

public List<accountwrapper> accountList {get;set;}
public Integer deleteAll{get;set;}

public List<Store__c> selectedAccounts = new List<Store__c>();

public List<Store__c> selAccounts= new List<Store__c>();

public List<accountwrapper> getAccounts()


{

//accountList = new List<accountwrapper>();

// for(Account a: [select Id, Name, AccountNumber, Phone from Account limit 5])

//accountList.add(new accountwrapper(a));

return accountList;

}

public BulkDeleteController (){
deleteAll=0;
accountList = new List<accountwrapper>();

for(Store__c str: [Select Id,Name,scorecard__EmailId__c from Store__c order by CreatedDate])
accountList.add(new accountwrapper(str));

//return accountList;

}

 

 

public PageReference getSelected()

{

selectedAccounts.clear();

for(accountwrapper accwrapper: accountList)

if(accwrapper.selected == true)

selectedAccounts.add(accwrapper.acc);

return null;

}

 

public List<Store__c> GetSelectedAccounts()

{

if(selectedAccounts.size()>0)

return selectedAccounts;

else

return null;

}
public PageReference edit(){

return null;
}
public PageReference refreshlist(){


    PageReference curPage = ApexPages.currentPage();
curPage.setRedirect(true);
return curPage;


}
 public PageReference Add(){    
    PageReference pr = new PageReference('/apex/add');
     return pr;    
    }
public PageReference deleteAll()

{
if(selectedAccounts.size()>0){
List<Store__c> selAccounts=GetSelectedAccounts();
deleteAll=selAccounts.size();

try{
   for(Integer j = 0;j<selAccounts.size();j++)
        {               
          delete selAccounts[j];
        }
ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, 'Deleted successfully'));
}

Catch(Exception e){

ApexPages.addMessage( new ApexPages.Message(ApexPages.Severity.ERROR, 'Data Base Error found'));

return null;

} 
}
PageReference curPage = ApexPages.currentPage();
curPage.setRedirect(true);
return curPage;

}

 

public class accountwrapper

{

public Store__c acc{get; set;}

public Boolean selected {get; set;}

public accountwrapper(Store__c a)

{

acc = a;

selected = false;

}

}

}