public class ScoreCardController {
    public List<Score_Card__c> scorecard{get; set;}
    public List<Scorecard_Instances__c> scorecardinstance{get; set;}
    public List<PermissionSetAssignment> permissionsetname{get; set;}
    public Map<String, String> testing = new Map<String, String>();
    public Map<String, String> subdepartmentname = new Map<String, String>();
    public Map<String, Boolean> statuslist = new Map<String, Boolean>();
    public Map<String, Boolean> hideshowcheck = new Map<String, Boolean>();
    public string selectedScorecard;
    public string departofsc;
    public Profile profilename {get;set;}
    public string refresh = ApexPages.currentPage().getUrl();
    public string selectedInstanceScorecard;
    public id profile_id = userinfo.getProfileId();
    public String department =  Apexpages.currentPage().getParameters().get('sfdc.tabName');
    public String returnDepartmentName(String tab_id){    
        if(refresh.contains('DeliveryDataTable')){
            return 'Delivery';
        }else if(refresh.contains('Corporate_data_table')){
            return 'Corporate';
        }else if(refresh.contains('PracticesDataTable')){
            return 'Practices';
        }else if(refresh.contains('SalesDataTable')){
            return 'Sales Marketing';
        }else if(refresh.contains('SupportDataTable')){
            return 'Support';
        }else{
            return tab_id = null;
        }
    }
    public ScoreCardController() {
        permissionsetname = [SELECT PermissionSet.Label FROM PermissionSetAssignment WHERE Assignee.Username = :Userinfo.getUserName()];
        scorecard = new List<Score_Card__c>();
        
        Map<String, String> mapofsubdepartment = new Map<String, String>();
        mapofsubdepartment = returnsubdepartment();
        Integer j = 0;
        while(j < mapofsubdepartment.size()){
            String permission =  scownerlist[j];
            String valuesubderpartment = mapofsubdepartment.get(permission); 
            if(valuesubderpartment == 'null'){
                String ScorecardSQL=  'SELECT Name,Category__c FROM Score_Card__c WHERE Department__c='+'\''+returnDepartmentName(department)+'\' ';
                scorecard = Database.query(ScorecardSQL);     
            }else{
                String ScorecardSQL= 'SELECT Name,Category__c FROM Score_Card__c WHERE Department__c='+'\''+returnDepartmentName(department)+'\' AND Category__c ='+'\''+valuesubderpartment+'\'';
                scorecard.add(Database.query(ScorecardSQL));      
            }
            j++;
            
        }
    }
    public Map<String,String> returnsubdepartment(){
        integer i = 0;
        boolean flag = true;
        boolean flag1 = true;
        boolean flag2 = true;
        while(i < scownerlist.size()){
            String label = scownerlist[i]; 
            String labelname = label.substring(12);
           if(labelname == 'Practices'){
                    subdepartmentname.put(label,'null');
                    flag = false;
            }else if(labelname == 'Sales Marketing'){
                    subdepartmentname.put(label,'null'); 
                    flag1 = false; 
            }else if(labelname == 'Support'){
                 subdepartmentname.put(label,'null'); 
                 flag2 = false;
            }else if(labelname == 'Emedia' || labelname == 'E-business' || labelname == 'Capital Markets' || labelname == 'Consumer lending' ||  labelname == 'Service Operations' && (flag == true)){
                subdepartmentname.put(label,labelname);
            }else if(labelname == 'Sales' || labelname == 'Marketing' || labelname == 'Inside Sales' ||  labelname == 'Key Accounts' && (flag1 == true)){
             subdepartmentname.put(label,labelname);
            }else if(labelname == 'HR' || labelname == 'IS' || labelname == 'Operations' || labelname == 'Facilities' ||  labelname == 'Finance' && (flag2 == true))
              subdepartmentname.put(label,labelname);
              else{
            subdepartmentname.put(label,'null');
           } i++;
        }
        return subdepartmentname;
    }

    public integer getsizeofmap(){
        integer size = scownerlist.size();
        return size;
    }
    public List<String> scownerlist{
        get{
            if(scownerlist == null){
                scownerlist = new List<String>();
                String currentprofile = getprofilename();
                if(currentprofile.contains('System Administrator') ||currentprofile.contains('Balance Scorecard Admin') ){
                    String reviewmaster = currentprofile;
                    scownerlist.add(reviewmaster);
                }else{
                    integer i = 0; 
                    while(i < permissionsetname.size()){
                        String label = permissionsetname[i].PermissionSet.Label;
                        if(label.contains('SC Owner of ')){
                            String reviewmaster = label; 
                            scownerlist.add(reviewmaster);
                            
                        }  i++;
                    }
                } 
            }
            return scownerlist;
        }
        set;
    }

    

    public string  returnscowner(){
        integer i = 0;
        String labelname = 'null';
        while(i < permissionsetname.size()){
            String  label = permissionsetname[i].PermissionSet.Label;
            if(label.contains('SC Owner of ')){
                labelname = label; 
                break;
            }
            i++;
        }
        return labelname;
    }

    public String returnmastertest(){
        String reviewmaster= 'null';
        integer i = 0; 
        while(i < permissionsetname.size()){
            String label = permissionsetname[i].PermissionSet.Label;
            if(label.contains('Reviewer of ')||label.contains('Master')){
                reviewmaster = label; 
                break;
            }
            i++;
        }  
        return reviewmaster;
    }
    public List<String> reviewerlist{
        get{
            if(reviewerlist == null){
                reviewerlist = new List<String>();
                String currentprofile = getprofilename();
                if(currentprofile.contains('System Administrator') ||currentprofile.contains('Balance Scorecard Admin') ){
                    String reviewmaster = currentprofile;
                    reviewerlist.add(reviewmaster);
                }else{
                    integer i = 0; 
                    while(i < permissionsetname.size()){
                        String label = permissionsetname[i].PermissionSet.Label;
                        if(label.contains('Reviewer of ') || label.contains('SC Owner of ')){
                            String reviewmaster = label; 
                            reviewerlist.add(reviewmaster);
                            
                        }  i++;
                    }
                } 
            }
            return reviewerlist;
        }
        set;
    }
    
    public Map<String,String> getaddintomap(){
        String depart = returnDepartmentName(department);
        String category = Apexpages.currentPage().getParameters().get('category');
        String combination3 = 'Reviewer of '+category+' '+depart;
        String combination4 = 'Reviewer of '+depart+' '+depart;
        Integer i = 0;
        while(i< reviewerlist.size()){
            String comreviewer = reviewerlist[i];
            String comreviewer1 = reviewerlist[i]+' '+depart; 
            if(comreviewer1 == combination4 ){
                testing.put(comreviewer ,'show');
            }else if(comreviewer1 == combination3 )
            testing.put(comreviewer ,'show');
            else{
                testing.put(comreviewer ,'hide');
            }
            i++;
        }
        return testing;
        
    }
    
    
    public String getreviewer(){
        String reviewmaster= 'null';
        integer i = 0; 
        departofsc =  returnDepartmentName(department);
        while(i < permissionsetname.size()){
            String label = permissionsetname[i].PermissionSet.Label;
            if(label.contains('Reviewer of ')){
                reviewmaster = label+' '+departofsc; 
                break;
            }
            i++;
        }  
        return reviewmaster;
    } 
    public String returnmaster(){
        String reviewmaster= 'null';
        integer i = 0; 
        while(i < permissionsetname.size()){
            String label = permissionsetname[i].PermissionSet.Label;
            if(label.contains('Master')){
                reviewmaster = label; 
                break;
            }
            i++;
        }  
        return reviewmaster;
    }
    public string getprofilename(){
        profilename =  [SELECT Name FROM Profile WHERE Id = :Userinfo.getProfileId()];
        return  profilename.Name;
    }

    public Map<String,Boolean> gethideshow(){
        String scowner = returnscowner();
        String department2 =  returnDepartmentName(department);
        boolean flag = true;
        boolean flag1 = true;
        boolean flag2 = true;
        Integer i = 0;
        while(i < reviewerlist.size()){
            String namepermission = reviewerlist[i];
            if(namepermission.contains('System Administrator') || namepermission.contains('Balance Scorecard Admin')){
                hideshowcheck.put(namepermission,true);
            }else if((namepermission.contains('SC Owner of')) && (department2 != 'null')){
                String namedeptt = namepermission.substring(12);
                if((namedeptt =='Practices' || namedeptt =='Emedia' || namedeptt =='E-business' || namedeptt =='Capital Markets' || namedeptt =='Consumer lending' || namedeptt =='Service Operations') && (department2 == 'Practices') && (flag == true)){
                    hideshowcheck.put(namepermission,true);
                    flag = false;
                }else if((namedeptt =='Sales Marketing' || namedeptt =='Sales' || namedeptt =='Marketing' || namedeptt =='Key Accounts' || namedeptt =='Inside Sales') && (department2 == 'Sales Marketing') && (flag1 == true)){
                    hideshowcheck.put(namepermission,true);
                    flag1 = false; 
                }else if ((namedeptt =='Support' || namedeptt =='HR' || namedeptt =='IS' || namedeptt =='Operations' || namedeptt =='Facilities' || namedeptt =='Finance') && (department2 == 'Support') && (flag2 == true)){
                    hideshowcheck.put(namepermission,true);
                    flag2 = false; 
                }else if((namedeptt =='Delivery') && (department2 == 'Delivery')){
                    hideshowcheck.put(namepermission,true);
                }else if((namedeptt =='Corporate') && (department2 == 'Corporate')){
                    hideshowcheck.put(namepermission,true);
                }else{
                    hideshowcheck.put(namepermission,false);
                }
            }else{
                hideshowcheck.put(namepermission,false);
            }
            i++;
        }
        return hideshowcheck;
    }   
    
    public string gethodview(){
        return 'show';
    }
    String filter= '';
    String filter2 = '';
    public String searchText {get;set;}
    public PageReference runSearch() {
        filter ='';filter2 ='';
        if(searchText != ''){
            String qry = 'SELECT Name,Status__c From Scorecard_Instances__c WHERE ScorecardLink__c IN (Select Id from Score_Card__c Where Department__c='+'\''+returnDepartmentName(department)+'\''+') and Name LIKE \'%'+searchText+'%\' order by Name';
            scorecardinstance = Database.query(qry);
        }
        else{
            String category = Apexpages.currentPage().getParameters().get('category');
            String month= Apexpages.currentPage().getParameters().get('month');
            String year= Apexpages.currentPage().getParameters().get('year');
            if (!category.equals(''))
            filter  += ' and Category__c = \''+String.escapeSingleQuotes(category)+'\'';
            filter2 += ' and Depth_Frequency__c = \''+String.escapeSingleQuotes(month)+'\'';
            filter2 += ' and Year__c = \''+String.escapeSingleQuotes(year)+'\'';
            String ScorecardInctanceSQL= 'SELECT Name,Status__c From Scorecard_Instances__c WHERE ScorecardLink__c IN (Select Id from Score_Card__c Where Department__c='+'\''+returnDepartmentName(department)+'\''+filter+')'+filter2;
            scorecardinstance = Database.query(ScorecardInctanceSQL);}
        return null;
    }
    public Map<String,Boolean> getstatusmap(){
        Integer i=0;
        while(i< scorecardinstance.size()){
            String status = scorecardinstance[i].Status__c;
            if(status == 'Submitted For Review' ){
                statuslist.put(status,true);
            }else{
                statuslist.put(status,false);
            }
            i++;
        }
        return statuslist;
        
    }
    
    public List<String> departmentlist{
        get{
            if(departmentlist == null){
                departmentlist = new List<String>();
                String departlist = returnDepartmentName(department);
                if(departlist == 'Practices'){
                    departmentlist.add('E-business');
                    departmentlist.add('Emedia');
                    departmentlist.add('Capital Markets');
                    departmentlist.add('Consumer lending');
                    departmentlist.add('Service Operations');
                }else if(departlist == 'Sales Marketing'){
                    departmentlist.add('Sales');
                    departmentlist.add('Marketing');
                    departmentlist.add('Inside Sales');
                    departmentlist.add('Key Accounts');
                }else if(departlist  == 'Support'){
                    departmentlist.add('HR');
                    departmentlist.add('IS');
                    departmentlist.add('Operations');
                    departmentlist.add('Facilities');
                    departmentlist.add('Finance');
                }else{
                    departmentlist.add('');
                }
            }
            return departmentlist;
        }
        set;
    }
    public List<String> categories{
        get {
            if(categories == null){
                categories = new List<String>();
                List<String> Practices = new List<String>();
                Practices = departmentlist;
                String department2 = returnDepartmentName(department);
                String test = returnmastertest();
                String permission = returnscowner();
                if(department2 =='Practices'){
                    if(permissionsetname.size()== 2){
                        if(permission != 'null' ){
                            String namedeptt = permission.substring(12);
                            if(namedeptt == 'Practices'){
                                categories.addAll(Practices);
                                
                            }else if(namedeptt == 'Emedia' || namedeptt == 'E-business' || namedeptt == 'Service Operations' || namedeptt == 'Capital Markets' || namedeptt == 'Consumer lending'){
                                categories.add(namedeptt);
                            }else{
                                categories.addAll(Practices);
                            }
                        }else{ 
                            if(test.contains('Reviewer of ')){
                                String test2add = test.substring(12);
                                categories.add(test2add);
                            }else{
                                categories.addAll(Practices);
                            }  }}else{
                        categories.addAll(Practices);
                    }   
                }     
            }        
            return categories;          
        }
        set;
    }
    public List<String> categories1{
        get {
            if(categories1 == null){
                categories1 = new List<String>();
                List<String> Sales = new List<String>();
                Sales = departmentlist;
                String department2 = returnDepartmentName(department);
                String test = returnmastertest();
                String permission = returnscowner();
                if(department2 =='Sales Marketing'){
                    if(permissionsetname.size()== 2){
                        if(permission != 'null' ){
                            String namedeptt = permission.substring(12);
                            if(namedeptt == 'Sales Marketing'){
                                categories1.addAll(Sales);
                            }else if((namedeptt == 'Sales' || namedeptt == 'Marketing' || namedeptt == 'Inside Sales' || namedeptt == 'Key Accounts')&& (department2 =='Sales Marketing')){
                                categories1.add(namedeptt);
                            }else{
                                categories1.addAll(Sales);
                            }
                        }else{ 
                            if(test.contains('Reviewer of ')){
                                String test2add = test.substring(12);
                                categories1.add(test2add);
                            }else{
                                categories1.addAll(Sales);
                            }
                        }}else{
                        categories1.addAll(Sales);
                    }
                }
            } 
            return categories1;          
        }
        set;
    }

    public List<String> categories2{
        get {
            if(categories2 == null){
                categories2 = new List<String>();
                List<String> Support = new List<String>();
                Support = departmentlist;
                String department2 = returnDepartmentName(department);
                String test = returnmastertest();
                String permission = returnscowner();
                if(department2 =='Support'){
                    if(permissionsetname.size()== 2){
                        if(permission != 'null' ){
                            String namedeptt = permission.substring(12); 
                            if(namedeptt == 'Support'){
                                categories2.addAll(Support);
                            }else if(namedeptt == 'HR' || namedeptt == 'IS' || namedeptt == 'Operations' || namedeptt == 'Facilities' || namedeptt == 'Finance'){
                                categories2.add(namedeptt);
                            }else{
                                categories2.addAll(Support);
                            }
                        }else{ 
                            if(test.contains('Reviewer of ')){
                                String test2add = test.substring(12);
                                categories2.add(test2add);
                            }else{
                                categories2.addAll(Support);
                            }
                        }
                    }else{
                        categories2.addAll(Support); 
                    }
                }
            }  
            return categories2;          
        }
        set;
    }
    public List<String> months{
        get {
            if(months== null){
                months = new List<String>();
                Schema.DescribeFieldResult field = Scorecard_Instances__c.Depth_Frequency__c.getDescribe(); 
                for (Schema.PicklistEntry f : field.getPicklistValues())
                months.add(f.getLabel());
            }
            return months;          
        }
        set;
    }
    public List<String> years{
        get {
            if (years== null) {
                years= new List<String>();
                Schema.DescribeFieldResult field = Scorecard_Instances__c.Year__c.getDescribe();
                for (Schema.PicklistEntry f : field.getPicklistValues())
                years.add(f.getLabel());
            }
            return years;          
        }
        set;
    }
    public PageReference scorecardClicked(){
        selectedScorecard = Apexpages.currentPage().getParameters().get('selectedScorecard');
        PageReference redirect = new PageReference('https://scorecard.ap1.visual.force.com/apex/Scorecard_Instance?sfdc.tabName=01r90000000R9BW');
        redirect.getParameters().put('selectedScorecard',selectedScorecard);
        redirect.getParameters().put('refresh',refresh); 
        redirect.setRedirect(true); 
        return redirect;
    }
    public PageReference instanceClicked(){
        selectedInstanceScorecard = Apexpages.currentPage().getParameters().get('selectedInstanceScorecard');
        Scorecard_Instances__c selectedS = [SELECT Status__c,ScorecardLink__c FROM Scorecard_Instances__c 
        WHERE Id=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard') LIMIT 1];
        selectedScorecard = selectedS.ScorecardLink__c;
        if(selectedS.Status__c == 'Open'){
            PageReference redirect = new PageReference('https://scorecard.ap1.visual.force.com/apex/Scorecard_Instance?sfdc.tabName=01r90000000R9BW');
            redirect.getParameters().put('selectedInstanceScorecard',selectedInstanceScorecard);
            redirect.getParameters().put('selectedScorecard',selectedScorecard);
            redirect.getParameters().put('refresh',refresh);
            redirect.setRedirect(true); 
            return redirect;
        }
        else{
            PageReference redirect = new PageReference('/apex/Scorecard_Instace_View');
            redirect.getParameters().put('selectedInstanceScorecard',selectedInstanceScorecard);
            redirect.setRedirect(true); 
            return redirect;
        }
    }

    public PageReference instanceClickedForReview(){
        selectedInstanceScorecard = Apexpages.currentPage().getParameters().get('selectedInstanceScorecard');
        Scorecard_Instances__c selectedS = [SELECT Status__c,ScorecardLink__c FROM Scorecard_Instances__c 
        WHERE Id=:Apexpages.currentPage().getParameters().get('selectedInstanceScorecard') LIMIT 1];
        selectedScorecard = selectedS.ScorecardLink__c;
        if(selectedS.Status__c == 'Open' || selectedS.Status__c == 'Final Submitted'){
            PageReference redirect = new PageReference('/apex/Scorecard_Instace_View');
            redirect.getParameters().put('selectedInstanceScorecard',selectedInstanceScorecard);
            redirect.getParameters().put('refresh',refresh);
            redirect.setRedirect(true); 
            return redirect; 
        }
        else{
            PageReference redirect = new PageReference('/apex/ReviewInstance');
            redirect.getParameters().put('selectedInstanceScorecard',selectedInstanceScorecard);
            redirect.getParameters().put('refresh',refresh);
            redirect.setRedirect(true); 
            return redirect;
        }
    }

}