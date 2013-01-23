public class ScorecardInstanceController{
    public List<Scorecard_Instances__c> scorecardInstancePrevious{get; set;}
    public List<Financial__c> finances{get; set;}
    public List<Customer__c> customers{get; set;}
    public List<Internal_process__c> internals{get; set;}
    public List<Learning_and_Growth__c> learnings{get; set;}  
    private Score_Card__c scorecarddetails;
    private Scorecard_Instances__c scorecardinstancedetails;
    private List<Metrics__c> financemetrics;
    private List<Metrics__c> customermetrics;
    private List<Metrics__c> learningmetrics;private List<Metrics__c> internalmetrics;
    public string refresh =  Apexpages.currentPage().getParameters().get('refresh');
    String InstanceId  = '';
    public String getmonth(){
        DateTime d = datetime.now();
        String monthName= d.format('MMMMM');
        return monthName;
        }
    public String getYear(){
        DateTime d = datetime.now();
        String yearName = d.format('yyyy');
        return yearName;
}
    public ScorecardInstanceController (){ 
 // Master Scorecard details
     scorecarddetails = [SELECT 
                         Name,
                         Department__c,
                         Frequency__c,
                         Category__c 
     FROM Score_Card__c 
     WHERE Id = :Apexpages.currentPage().getParameters().get('selectedScorecard')];
 // getting the ID of earlier instance for setting the previous value            
     scorecardInstancePrevious = [SELECT Id 
     FROM Scorecard_Instances__c 
     WHERE ScorecardLink__c =:Apexpages.currentPage().getParameters().get('selectedScorecard')ORDER BY CreatedDate DESC LIMIT 1];
    if(scorecardInstancePrevious.size()==0){
      InstanceId = '0';    
    }else{
      InstanceId = scorecardInstancePrevious[0].Id;
    }
// render scorecard instance from database or create new       
     if(Apexpages.currentPage().getParameters().get('selectedInstanceScorecard') != null){
       scorecardinstancedetails = [SELECT 
                                   Name,
                                   Year__c,
                                   Frequency__c,
                                   Depth_Frequency__c,
                                   Status__c,
                                   ScorecardLink__c 
       FROM Scorecard_Instances__c 
       WHERE Id = :Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
     }else{
            scorecardinstancedetails = new Scorecard_Instances__c();
      }
     finances();
     customers();   
     learnings();
     internals();
    }
    public void finances(){
       financemetrics = [SELECT 
       Name,
       Objective__c,
       Grade__c 
       FROM Metrics__c
       WHERE Scorecard__c = :Apexpages.currentPage().getParameters().get('selectedScorecard') and Category__c='Financial'];
       
       List<Financial__c> financesPrevious = [SELECT 
                                              current_value__c 
                          FROM Financial__c 
                          WHERE LinkID__c =: InstanceId];
       if(Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')==null){
        finances = [SELECT 
                    Name,
                    Previous_Value__c,
                    Grade__c,
                    current_value__c,
                    Current_Value_Grade__c,
                    Initiatives__c,
                    Metrics__c,
                    Objectives__c,
                    Targets__c,
                    Target_Grade_Value__c,
                    Review_Comments__c 
        FROM Financial__c 
        WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')]; 
         for(integer i=0;i<financemetrics.size();i++){
            finances.add(new Financial__c());
            finances[i].Grade__c = financemetrics[i].Grade__c;
            finances[i].Metrics__c = financemetrics[i].Id;
            finances[i].Objectives__c = financemetrics[i].Objective__c;
            if(financesPrevious.size() != 0)
            finances[i].Previous_Value__c = financesPrevious[i].current_value__c;       
         }
       }else{
       finances = [SELECT 
                   Name,
                   Previous_Value__c,
                   current_value__c,
                   Current_Value_Grade__c,
                   Initiatives__c,
                   Metrics__c,
                   Grade__c,
                   Objectives__c,
                   Targets__c,
                   Target_Grade_Value__c,
                   Review_Comments__c 
       FROM Financial__c 
       WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')]; 
       }
    }
    public void customers(){
      customermetrics = [SELECT 
                         Name,
                         Grade__c ,
                         Objective__c 
      FROM Metrics__c
      WHERE Scorecard__c = :Apexpages.currentPage().getParameters().get('selectedScorecard') and Category__c='Customer'];
      List<Customer__c> customersPrevious = [SELECT 
                                             current_value__c 
                        FROM Customer__c 
                        WHERE LinkID__c =: InstanceId];
      if(Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')==null){
            customers =[SELECT 
                  Name,
                  Previous_Value__c,
                  current_value__c,
                  Current_Value_Grade__c,
                  Initiatives__c,
                  Grade__c,
                  Metrics__c,
                  Objectives__c,
                  Targets__c,
                  Target_Grade_Value__c,
                  Review_Comments__c
      FROM Customer__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
      
       for(integer i=0;i<customermetrics.size();i++){
           customers.add(new Customer__c());
           customers[i].Grade__c = customermetrics[i].Grade__c;
           customers[i].Metrics__c = customermetrics[i].Id;
           customers[i].Objectives__c = customermetrics[i].Objective__c;
           if(customersPrevious.size()!=0)
           customers[i].Previous_Value__c = customersPrevious[i].current_value__c;
        }
      }else{
      customers =[SELECT 
                  Name,
                  Previous_Value__c,
                  current_value__c,
                  Current_Value_Grade__c,
                  Initiatives__c,
                  Grade__c,
                  Metrics__c,
                  Objectives__c,
                  Targets__c,
                  Target_Grade_Value__c,
                  Review_Comments__c
      FROM Customer__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
      }
    }
    public void learnings(){
      learningmetrics = [SELECT 
                         Name,
                         Grade__c,
                         Objective__c 
      FROM Metrics__c
      WHERE Scorecard__c = :Apexpages.currentPage().getParameters().get('selectedScorecard') and Category__c='Learning & Growth'];
      List<Learning_and_Growth__c> learningPrevious = [SELECT 
                                                       current_value__c 
                                   FROM Learning_and_Growth__c 
                                   WHERE LinkID__c =: InstanceId];              
      if(Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')==null){
       learnings =[SELECT 
                  Name,
                  Previous_Value__c,
                  current_value__c,
                  Current_Value_Grade__c,
                  Initiatives__c,
                  Grade__c,
                  Metrics__c,
                  Objectives__c,
                  Targets__c,
                  Target_Grade_Value__c,
                  Review_Comments__c 
      FROM Learning_and_Growth__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
         for(integer i=0;i<learningmetrics.size();i++){
            learnings.add(new Learning_and_Growth__c());
            learnings[i].Metrics__c = learningmetrics[i].Id;
            learnings[i].Grade__c = learningmetrics[i].Grade__c;
            learnings[i].Objectives__c = learningmetrics[i].Objective__c;
            if(learningPrevious.size()!=0)
            learnings[i].Previous_Value__c = learningPrevious[i].current_value__c;
         }
      }else{
      learnings =[SELECT 
                  Name,
                  Previous_Value__c,
                  current_value__c,
                  Current_Value_Grade__c,
                  Initiatives__c,
                  Grade__c,
                  Metrics__c,
                  Objectives__c,
                  Targets__c,
                  Target_Grade_Value__c,
                  Review_Comments__c 
      FROM Learning_and_Growth__c 
      WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
      }
    }
    public void internals(){
       internalmetrics = [SELECT 
                          Name,
                          Grade__c,
                          Objective__c 
       FROM Metrics__c
       WHERE Scorecard__c = :Apexpages.currentPage().getParameters().get('selectedScorecard') and Category__c='Internal Process'];
              List<Internal_process__c> internalsPrevious = [SELECT 
                                                      current_value__c 
                                 FROM Internal_process__c 
                                 WHERE LinkID__c =: InstanceId];              
       if(Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')==null){
       internals =[SELECT 
                   Name,
                   Previous_Value__c,
                   current_value__c,
                   Current_Value_Grade__c,
                   Initiatives__c,
                   Metrics__c,
                   Grade__c,
                   Objectives__c,
                   Targets__c,
                   Target_Grade_Value__c,
                   Review_Comments__c 
       FROM Internal_process__c 
       WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
           for(integer i=0;i<internalmetrics.size();i++){
              internals.add(new Internal_process__c());
              internals[i].Metrics__c = internalmetrics[i].Id;
              internals[i].Grade__c = internalmetrics[i].Grade__c;
              internals[i].Objectives__c = internalmetrics[i].Objective__c;
              if(internalsPrevious.size()!=0)
              internals[i].Previous_Value__c = internalsPrevious[i].current_value__c;
           }
       }else{    
       internals =[SELECT 
                   Name,
                   Previous_Value__c,
                   current_value__c,
                   Current_Value_Grade__c,
                   Initiatives__c,
                   Metrics__c,
                   Grade__c,
                   Objectives__c,
                   Targets__c,
                   Target_Grade_Value__c,
                   Review_Comments__c 
       FROM Internal_process__c 
       WHERE LinkID__c=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard')];
       }
    }
    public void echoVal(){
     
     Integer checkRecord= [Select count()from Finance_Dataform__c where Month__c=:getMonth() and Year__c=:getYear()];
     Integer checkRecord2 = [Select count()from Sales_Marketing__c where Month__c=:getMonth() and Year__c=:getYear()]; 
     if(checkRecord > 0 && checkRecord2 > 0) {
     
     Finance_Dataform__c finmet= [SELECT 
     Total_billing_in_E_business__c,
     Total_billing_in_Emedia__c,
     Total_billing_in_Capital_Markets__c,
     Total_biiling_in_Consumer_Lending__c,
     Total_billing_in_SOPS__c,
     Dealsheet_GM_key_Accs_AD__c,
     Dealsheet_GM_key_Accs_RP__c,
     Dealsheet_GM_key_Accs_KK__c,
     Dealsheet_GM_key_Accs_PS__c,
     Execution_GM_key_Accs_AD__c,
     Execution_GM_key_Accs_KK__c,
     Execution_GM_key_Accs_PS__c,
     Execution_GM_key_Accs_RP__c,
     Dealsheet_GM_Capital_Markets_projects__c,
     Dealsheet_GM_for_CL_projects__c,
     Dealsheet_GM_for_E_business_projects__c,
     Dealsheet_GM_for_E_media_projects__c,
     Dealsheet_GM_for_SOPS_projects__c,
     Execution_GM_Capital_Markets_projects__c,
     Execution_GM_for_CL_projects__c,
     Execution_GM_for_E_business_projects__c,
     Execution_GM_for_E_media_projects__c,
     Execution_GM_for_SOPS_projects__c,
     Dealsheet_GM_sales_DIT__c,
     Dealsheet_GM_sales_Mani__c,
     Dealsheet_GM_sales_Satya__c,
     Dealsheet_GM_sales_VK__c,
     Overall_deal_sheet_GM__c,
     Overall_execution_GM__c,
     Execution_GM_sales_DIT__c,
     Execution_GM_sales_Mani__c,
     Execution_GM_sales_Satya__c,
     Execution_GM_sales_VK__c
     FROM Finance_Dataform__c WHERE Month__c =:getmonth() and Year__c=:getYear() LIMIT 1];
     
     Sales_Marketing__c salesmet = [SELECT 
     Total_IT_budget_of_all_clients_SOps__c,
     Total_IT_budget_of_all_clients_E_biz__c,
     Total_IT_budget_of_all_clients_CM__c,
     Total_IT_budget_of_clients_in_Emedia__c,
     Total_IT_budget_of_all_clients_CL__c, 
     Total_cost_of_marketing__c,
     Total_new_sales__c
     FROM Sales_Marketing__c
     WHERE Month__c =:getmonth() and Year__c=:getYear() LIMIT 1];
    if(scorecarddetails.Category__c == 'Emedia'){
     for(Integer i=0;i<finances.size();i++){
      if(financemetrics[i].Name == 'Average share of IT budgets'){
        if(finmet.Total_billing_in_Emedia__c!=null && salesmet.Total_IT_budget_of_clients_in_Emedia__c!=null){
          finances[i].current_value__c = finmet.Total_billing_in_Emedia__c/salesmet.Total_IT_budget_of_clients_in_Emedia__c;}
        else{
          finances[i].current_value__c = 0;
       }
      }
      if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)') {
        if(finmet.Dealsheet_GM_for_E_media_projects__c!=null && finmet.Execution_GM_for_E_media_projects__c!=null){
          finances[i].current_value__c = (finmet.Dealsheet_GM_for_E_media_projects__c+finmet.Execution_GM_for_E_media_projects__c)/2;
        }
        else{
          finances[i].current_value__c = 0;
       }
      }  
     }
    }
    else if(scorecarddetails.Category__c == 'E-business'){
    for(Integer i=0;i<finances.size();i++){
       if(financemetrics[i].Name == 'Average share of IT budgets'){
         if(finmet.Total_billing_in_E_business__c!=null && salesmet.Total_IT_budget_of_all_clients_E_biz__c!=null){
            finances[i].current_value__c = finmet.Total_billing_in_E_business__c/salesmet.Total_IT_budget_of_all_clients_E_biz__c;}
         else{
            finances[i].current_value__c = 0;
         }
        }
       if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)') {
        if(finmet.Dealsheet_GM_for_E_business_projects__c!=null && finmet.Execution_GM_for_E_business_projects__c!=null){
          finances[i].current_value__c = (finmet.Dealsheet_GM_for_E_business_projects__c+finmet.Execution_GM_for_E_business_projects__c)/2;
        }
        else{
          finances[i].current_value__c = 0;
       }
      }     
      }
     }
    else if(scorecarddetails.Category__c == 'Consumer Lending'){
     for(Integer i=0;i<finances.size();i++){
      if(financemetrics[i].Name == 'Average share of IT budgets'){
         if(finmet.Total_biiling_in_Consumer_Lending__c!=null && salesmet.Total_IT_budget_of_all_clients_CL__c!=null){
            finances[i].current_value__c = finmet.Total_biiling_in_Consumer_Lending__c/salesmet.Total_IT_budget_of_all_clients_CL__c;}
         else{
            finances[i].current_value__c = 0;
         }
      }
      if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)') {
        if(finmet.Dealsheet_GM_for_CL_projects__c!=null && finmet.Execution_GM_for_CL_projects__c!=null){
          finances[i].current_value__c = (finmet.Dealsheet_GM_for_CL_projects__c+finmet.Execution_GM_for_CL_projects__c)/2;
        }
        else{
          finances[i].current_value__c = 0;
       }
      }           
     }
    }
    else if(scorecarddetails.Category__c == 'Capital Markets'){
     for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == 'Average share of IT budgets'){
         if(finmet.Total_billing_in_Capital_Markets__c!=null && salesmet.Total_IT_budget_of_all_clients_CM__c!=null){
            finances[i].current_value__c = finmet.Total_billing_in_Capital_Markets__c/salesmet.Total_IT_budget_of_all_clients_CM__c;}
         else{
           finances[i].current_value__c = 0;
         }
       }
       if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)') {
        if(finmet.Dealsheet_GM_Capital_Markets_projects__c!=null && finmet.Execution_GM_Capital_Markets_projects__c!=null){
          finances[i].current_value__c = (finmet.Dealsheet_GM_Capital_Markets_projects__c+finmet.Execution_GM_Capital_Markets_projects__c)/2;
        }
        else{
          finances[i].current_value__c = 0;
       }
      }   
    }
    }
    else if(scorecarddetails.Category__c == 'Service Operations'){
    for(Integer i=0;i<finances.size();i++){
      if(financemetrics[i].Name == 'Average share of IT budgets'){
          if(finmet.Total_billing_in_SOPS__c!=null && salesmet.Total_IT_budget_of_all_clients_SOps__c !=null){
            finances[i].current_value__c = finmet.Total_billing_in_SOPS__c/salesmet.Total_IT_budget_of_all_clients_SOps__c;}
          else{
            finances[i].current_value__c = 0;
          }
        }
      if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)') {
        if(finmet.Dealsheet_GM_for_SOPS_projects__c!=null && finmet.Execution_GM_for_SOPS_projects__c!=null){
          finances[i].current_value__c = (finmet.Dealsheet_GM_for_SOPS_projects__c+finmet.Execution_GM_for_SOPS_projects__c)/2;
        }
        else{
          finances[i].current_value__c = 0;
       }
      }   
      }
     } 
    else if(scorecarddetails.Name == 'CP Plan AD'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)'){
          if(finmet.Dealsheet_GM_key_Accs_AD__c!=null && finmet.Execution_GM_key_Accs_AD__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_key_Accs_AD__c/finmet.Execution_GM_key_Accs_AD__c);}
          else{
            finances[i].current_value__c = 0;
          }
        }   
      }
     }
    else if(scorecarddetails.Name == 'CP Plan RP'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)'){
          if(finmet.Dealsheet_GM_key_Accs_RP__c!=null && finmet.Execution_GM_key_Accs_RP__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_key_Accs_RP__c/finmet.Execution_GM_key_Accs_RP__c);}
          else{
            finances[i].current_value__c = 0;
          }
        }   
      }
      }
    else if(scorecarddetails.Name == 'CP_Plan_KK'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)'){
          if(finmet.Dealsheet_GM_key_Accs_KK__c!=null && finmet.Execution_GM_key_Accs_KK__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_key_Accs_KK__c/finmet.Execution_GM_key_Accs_KK__c);}
          else{
            finances[i].current_value__c = 0;
          }
        }   
      }
    }
    else if(scorecarddetails.Name == 'CP Plan PS'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '50%*(Dealsheet GM% + Execution GM%)'){
          if(finmet.Dealsheet_GM_key_Accs_PS__c!=null && finmet.Execution_GM_key_Accs_PS__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_key_Accs_PS__c/finmet.Execution_GM_key_Accs_PS__c);}
          else{
          finances[i].current_value__c = 0;
          }
        }
      }
    }
   else if(scorecarddetails.Name == 'Sales Plan DIT'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '75% * Dealsheet GM + 25% * Execution GM'){
          if(finmet.Dealsheet_GM_sales_DIT__c!=null && finmet.Execution_GM_sales_DIT__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_sales_DIT__c+finmet.Execution_GM_sales_DIT__c)*3/4;}
          else{
          finances[i].current_value__c = 0;
          }
        }
      }
    }
   else if(scorecarddetails.Name == 'Sales Plan Mani'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '75% * Dealsheet GM + 25% * Execution GM'){
          if(finmet.Dealsheet_GM_sales_Mani__c!=null && finmet.Execution_GM_sales_Mani__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_sales_Mani__c+finmet.Execution_GM_sales_Mani__c)*3/4;}
          else{
          finances[i].current_value__c = 0;
          }
        }
      }
    }
   else if(scorecarddetails.Name == 'Sales Plan Satya'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '75% * Dealsheet GM + 25% * Execution GM'){
          if(finmet.Dealsheet_GM_sales_Satya__c!=null && finmet.Execution_GM_sales_Satya__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_sales_Satya__c+finmet.Execution_GM_sales_Satya__c)*3/4;}
          else{
          finances[i].current_value__c = 0;
          }
        }
      }
    }     
   else if(scorecarddetails.Name == 'Sales Plan VK'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == '75% * Dealsheet GM + 25% * Execution GM'){
          if(finmet.Dealsheet_GM_sales_VK__c!=null && finmet.Execution_GM_sales_VK__c!=null){
            finances[i].current_value__c = (finmet.Dealsheet_GM_sales_VK__c+finmet.Execution_GM_sales_VK__c)*3/4;}
          else{
          finances[i].current_value__c = 0;
          }
        }
      }
    }
   else if(scorecarddetails.Name == 'Marketing Plan'){
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == 'Cost Per New Sale $'){
          if(salesmet.Total_cost_of_marketing__c!= null && salesmet.Total_new_sales__c!=null){
            finances[i].current_value__c = salesmet.Total_cost_of_marketing__c/salesmet.Total_new_sales__c;}
          else{
          finances[i].current_value__c = 0;
          }
        }
      }
    }   
   else if(scorecarddetails.Name == 'Sales Plan Overall'){
   List<Financial__c> sum = [SELECT current_value__c 
   FROM Financial__c 
   WHERE LinkID__c IN(SELECT Id FROM Scorecard_Instances__c 
   WHERE Name LIKE 'sales%' and Depth_Frequency__c =:getmonth() AND Year__c =:getYear()) 
   AND Metrics__c IN(SELECT Id FROM Metrics__c 
   WHERE Department__c='Sales Marketing' AND Name='New Sales Billings')];
   Decimal sumtotal =0;
        for(Integer i=0;i<sum.size();i++){
        if(sum[i].current_value__c==null)
           sum[i].current_value__c =0;
           sumtotal = sumtotal+sum[i].current_value__c;
        }    
        for(Integer i=0;i<finances.size();i++){
        if(financemetrics[i].Name == 'New Sales Billings'){
            finances[i].current_value__c = sumtotal;
        }
        else{
             finances[i].current_value__c = 0;
        }
        if(financemetrics[i].Name == '75% * Dealsheet GM + 25% * Execution GM'){
          if(salesmet.Total_cost_of_marketing__c!= null && salesmet.Total_new_sales__c!=null){
            finances[i].current_value__c = (finmet.Overall_deal_sheet_GM__c+finmet.Overall_execution_GM__c)*3/4;}
          else{
          finances[i].current_value__c = 0;
          }
        }
      }
    }
    }
   }         
    public Score_Card__c getscorecarddetails() {
        return scorecarddetails;
       }
    public Scorecard_Instances__c getscorecardinstancedetails(){
        return scorecardinstancedetails;
       }    
    public List<Metrics__c> getfinancemetrics(){
        return financemetrics;
       }
    public List<Metrics__c> getcustomermetrics(){
        return customermetrics;
       }
    public List<Metrics__c> getlearningmetrics(){
        return learningmetrics;
       }
    public List<Metrics__c> getinternalmetrics(){
        return internalmetrics;
       }
    public PageReference save(){
    try{
     if(scorecardinstancedetails.ScorecardLink__c == null){
     scorecardinstancedetails.Name = scorecarddetails.Name+'-'+scorecardinstancedetails.Depth_Frequency__c+'-'+scorecardinstancedetails.Year__c;
     scorecardinstancedetails.ScorecardLink__c = scorecarddetails.Id;
     }
     upsert(scorecardinstancedetails);
     for(Integer i = 0;i<finances.size();i++){
     if(finances[i].Id == null){
         finances[i].LinkID__c = scorecardinstancedetails.Id;
      }   
     }
     upsert(finances);
     
     //insert customer list
     for(Integer i = 0;i<customers.size();i++){
     if(customers[i].Id == null){
     customers[i].LinkID__c = scorecardinstancedetails.Id;
     }}
     upsert(customers);
     
     //insert internal list
     for(Integer i = 0;i<internals.size();i++){
     if(internals[i].Id == null){
     internals[i].LinkID__c = scorecardinstancedetails.Id;
     }}
     upsert(internals);
     
     //insert learning list
     for(Integer i = 0;i<learnings.size();i++){
     if(learnings[i].Id == null){
     learnings[i].LinkID__c = scorecardinstancedetails.Id;
     }}
     upsert(learnings);
   }catch(System.DMLException e){
      ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,'Error creating new scorecard.'));
      return null;
    }
    scorecardinstancedetails.Status__c = 'Open';
    update scorecardinstancedetails;
    PageReference redirect = new PageReference(refresh);
    redirect.setRedirect(true); 
    return redirect;
  }
   public PageReference submit(){   
    save();
    scorecardinstancedetails.Status__c = 'Submitted For Review';
    update scorecardinstancedetails;
    PageReference redirect = new PageReference(refresh);
    redirect.setRedirect(true); 
    return redirect;
  }
}