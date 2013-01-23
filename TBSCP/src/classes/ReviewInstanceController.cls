public class ReviewInstanceController{
  public List<Financial__c> finances{get; set;}
  public List<Customer__c> customers{get; set;}
  public List<Internal_process__c> internals{get; set;}
  public List<Learning_and_Growth__c> learnings{get; set;}
  private final Scorecard_Instances__c scorecardinstancedetails;
  public string refresh =  Apexpages.currentPage().getParameters().get('refresh');
  public  ReviewInstanceController(){
    scorecardinstancedetails= [SELECT 
    Name,
    Year__c,
    Frequency__c,
    Depth_Frequency__c,
    Status__c,
    ScorecardLink__c FROM Scorecard_Instances__c
      WHERE Id=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
    finances = [SELECT 
    Name,
    Previous_Value__c ,
    Current_Value_Grade__c,
    Grade__c,
    current_value__c,
    Initiatives__c,
    Metrics__c,
    Objectives__c,
    Targets__c,
    Target_Grade_Value__c,
    Review_Comments__c FROM Financial__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
    customers = [SELECT 
    Name,
    Previous_Value__c ,
    Current_Value_Grade__c,
    Grade__c,
    current_value__c,
    Initiatives__c,
    Metrics__c,
    Objectives__c,
    Targets__c,
    Target_Grade_Value__c,
    Review_Comments__c FROM Customer__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
    learnings = [SELECT 
    Name,
    Previous_Value__c ,
    Current_Value_Grade__c,
    Grade__c,
    current_value__c,
    Initiatives__c,
    Metrics__c,
    Objectives__c,
    Targets__c,
    Target_Grade_Value__c,
    Review_Comments__c FROM Learning_and_Growth__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
    internals = [SELECT 
    Name,
    Previous_Value__c ,
    Current_Value_Grade__c,
    Grade__c,
    current_value__c,
    Initiatives__c,
    Metrics__c,
    Objectives__c,
    Targets__c,
    Target_Grade_Value__c,
    Review_Comments__c FROM Internal_process__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
    }
    public Scorecard_Instances__c getscorecardinstancedetails() {
        return scorecardinstancedetails;
       }   
  public PageReference save(){
     try{
       scorecardinstancedetails.Status__c = 'Final Submitted';
       update scorecardinstancedetails;
       update(finances);
       update(customers);   
       update(internals);
       update(learnings);
     }
     catch(System.DMLException e){
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error creating new scorecard.'));
      return null;
     }
    PageReference redirect = new PageReference(refresh);
    redirect.setRedirect(true); 
    return redirect;
  }
 public PageReference reject(){
     try{
         scorecardinstancedetails.Status__c = 'Open';
         update scorecardinstancedetails;
     }
     catch(System.DMLException e){
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error creating new scorecard.'));
      return null;
     }
    PageReference redirect = new PageReference(refresh);
    redirect.setRedirect(true); 
    return redirect;
  }
  
  
  
}