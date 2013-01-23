public class MultiAdd
{

    public MultiAdd(ApexPages.StandardController controller) {

    }

    
    //will hold the account records to be saved
    public Set<scorecard__Store__c>lstAcct  = new Set<scorecard__Store__c>();
     public List<scorecard__Store__c>ConList= new List<scorecard__Store__c>();
    //list of the inner class
    public List<innerClass> lstInner 
    {   get;set;    }
    
    //will indicate the row to be deleted
    public String selectedRowIndex
    {get;set;}  
    
    //no. of rows added/records in the inner class list
    public Integer count = 1;
    //{get;set;}
      
    
    ////save the records by adding the elements in the inner class list to lstAcct,return to the same page
    public PageReference Save()
    { 
      
      
        
        for(Integer j = 0;j<lstInner.size();j++)
        {   if(lstInner[j].acct.Name!=null)
            {
            lstAcct.add(lstInner[j].acct);
            }
        } 
        if(lstAcct.size()>0){
        ConList.clear();
        ConList.addAll(lstAcct);
        upsert ConList;
  }
         PageReference pr = new PageReference('/apex/d');
     return pr; 
    }
        
    //add one more row
    public void Add()
    {   
        count = count+1;
        addMore();      
    }
    
    /*Begin addMore*/
    public void addMore()
    {
        //call to the iner class constructor
        innerClass objInnerClass = new innerClass(count);
        
        //add the record to the inner class list
        lstInner.add(objInnerClass);    
        system.debug('lstInner---->'+lstInner);            
    }/* end addMore*/
    
    /* begin delete */
    public void Del()
    {
        if(lstInner.size()>1){
        system.debug('selected row index---->'+selectedRowIndex);
        lstInner.remove(Integer.valueOf(selectedRowIndex)-1);
        count = count - 1;
        }
        
    }/*End del*/
    
    
    
    /*Constructor*/
    public MultiAdd()
    {
    
        lstInner = new LIst<innerClass>();
        addMore();
        selectedRowIndex = '0';
        
    }/*End Constructor*/
        


    /*Inner Class*/
    public class innerClass
    {       
        /*recCount acts as a index for a row. This will be helpful to identify the row to be deleted */
        public String recCount
        {get;set;}
        
        
        public scorecard__Store__c acct 
        {get;set;}
        
        /*Inner Class Constructor*/
        public innerClass(Integer intCount)
        {
            recCount = String.valueOf(intCount);        
            
            /*create a new account*/
            acct = new scorecard__Store__c();
            
        }/*End Inner class Constructor*/    
    }/*End inner Class*/
}/*End Class*/