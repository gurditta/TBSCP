public class userExtension{
    public HR_Dataform__c u{
    get{
    if (u == null)
      u   = new HR_Dataform__c();
      return u;
    }
    set;
    }
    public PageReference save(){
    try{
     upsert(u);
   }catch(System.DMLException e){
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error creating new scorecard.'));
      return null;
    }
    return (new ApexPages.StandardController(u)).view();
    //return null;
  }
   public List<String> getMonths(){
       List<String> mon = new List<String>();
       mon.add('January');
        mon.add('February');
         mon.add('March');
        return mon;
    }
       public String getMonthname(){
        DateTime d = datetime.now();
       String monthName= d.format('MMMMM');
        return monthName;
    }
    public String getYear(){
        DateTime d = datetime.now();
        String yearName = d.format('yyyy');
        return yearName;
    }
    public Integer getData() {
    Integer flag=0;
    /* date currentDate = Date.today();
     Integer monthName= currentDate.month();
     Integer yearName = currentDate.year();*/
            DateTime d = datetime.now();
        String monthName= d.format('mmmmm');
        String yearName = d.format('yyyy');
       HR_Dataform__c  data = [SELECT Name FROM HR_Dataform__c WHERE Month__c =:monthName and Year__c =:yearName];
       if(data==null){
       flag=0;       
       }
       else{
       flag=1;
       }
        return flag;


    }


}