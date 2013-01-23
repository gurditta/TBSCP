public class dipslayinputtextinpageblocktable
{

public list<contact> con{get;set;}
public list<MyWrapper> lstWrapper {get;set;} 
public dipslayinputtextinpageblocktable ()
{
    con=[select name,mailingcity,email from contact limit 10];
    this.lstWrapper = new list<MyWrapper>();  
        MyWrapper oWrapp = new MyWrapper();
        oWrapp.Name='Test'; 
        oWrapp.MailingCity='abc';
        oWrapp.Email='abc'; 
        lstWrapper.add(oWrapp);

}

public void updatecon()
{
    if(con.size()>0)
    {
        update con;
    }
}

public PageReference AddRecord() {
        
       //Assign your own data to do this. for testing I just placed the dummy data.
       
       //Test Data
        MyWrapper oWrapp = new MyWrapper();
        oWrapp.Name='Test1'; 
        oWrapp.MailingCity= 'abc'; 
        oWrapp.Email= 'abc'; 
        lstWrapper.add(oWrapp);
    
        return null;
    }


      

      public class MyWrapper{
          public string Name{ get;set;}
          public string MailingCity{get;set;}
          public string Email{get;set;}

          }



}