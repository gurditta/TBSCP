public class ScorecardInstanceControllerTest{


 @IsTest(SeeAllData=true) static void myTest() {
    
    ScorecardInstanceController controller = new ScorecardInstanceController();
    ScorecardInstanceControllerTest controller1 = new ScorecardInstanceControllerTest();
        controller.getscorecarddetails();   
        controller.getscorecardinstancedetails();   
        controller.getfinancemetrics();         
        controller.getcustomermetrics();  
        controller.getlearningmetrics(); 
       
        
              
     
 }




}