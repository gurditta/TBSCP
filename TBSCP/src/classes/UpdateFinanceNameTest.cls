public class UpdateFinanceNameTest{

private String Name;
private String GM_of_Hosting_Business;
private String Amount_of_Loss_due_to_compliance_issues;
private String Dealsheet_GM_Capital_Markets_project;
private String Dealsheet_GM_for_CL_projects;
private String Dealsheet_GM_for_E_business_projects;
private String Dealsheet_GM_for_E_media_projects;




public String getName() {
return Name;
}
public void setName(String firstName) {
this.Name= firstName;
}

public String getGM_of_Hosting_Business() {
return GM_of_Hosting_Business;
}
public void setGM_of_Hosting_Business(String add) {
this.GM_of_Hosting_Business=add;
}
public String getAmount_of_Loss_due_to_compliance_issues() {
return Amount_of_Loss_due_to_compliance_issues;
}
public void setAmount_of_Loss_due_to_compliance_issues(String email) {
this.Amount_of_Loss_due_to_compliance_issues= email;
}
public String getDealsheet_GM_Capital_Markets_project() {
return Dealsheet_GM_Capital_Markets_project;
}
public void setDealsheet_GM_Capital_Markets_project(String add) {
this.Dealsheet_GM_Capital_Markets_project=add;
}

public String getDealsheet_GM_for_CL_projects() {
return Dealsheet_GM_for_CL_projects;
}
public void setDealsheet_GM_for_CL_projects(String add) {
this.Dealsheet_GM_for_CL_projects=add;
}
public String getDealsheet_GM_for_E_business_projects() {
return Dealsheet_GM_for_E_business_projects;
}
public void setDealsheet_GM_for_E_business_projects(String add) {
this.Dealsheet_GM_for_E_business_projects=add;
}
public String getDealsheet_GM_for_E_media_projects() {
return Dealsheet_GM_for_E_media_projects;
}
public void setDealsheet_GM_for_E_media_projects(String add) {
this.Dealsheet_GM_for_E_media_projects=add;
}


static testMethod void myTest() {


UpdateFinanceNameTest controller = new UpdateFinanceNameTest();
controller.getName();
controller.setName('abc');
controller.getGM_of_Hosting_Business();
controller.setGM_of_Hosting_Business('def');
controller.getAmount_of_Loss_due_to_compliance_issues();
controller.setAmount_of_Loss_due_to_compliance_issues('def');
controller.getDealsheet_GM_Capital_Markets_project();
controller.setDealsheet_GM_Capital_Markets_project('def');
controller.getDealsheet_GM_for_CL_projects();
controller.setDealsheet_GM_for_CL_projects('def');
controller.getDealsheet_GM_for_E_business_projects();
controller.setDealsheet_GM_for_E_business_projects('def');
controller.getDealsheet_GM_for_E_media_projects();
controller.setDealsheet_GM_for_E_media_projects('def');
}






}