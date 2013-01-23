public class FinanceDataController {
ApexPages.StandardController controller{get; set;}
private String Name;
private String GM_of_Hosting_Business;
private String Amount_of_Loss_due_to_compliance_issues;
private String Dealsheet_GM_Capital_Markets_project;
private String Dealsheet_GM_for_CL_projects;
private String Dealsheet_GM_for_E_business_projects;
private String Dealsheet_GM_for_E_media_projects;
private String Dealsheet_GM_key_Accs_AD;
private String Dealsheet_GM_key_Accs_KK;
private String Dealsheet_GM_key_Accs_PS;
private String Dealsheet_GM_key_Accs_RP;
private String Dealsheet_GM_sales_DIT;
private String Dealsheet_GM_sales_Mani;
private String Dealsheet_GM_sales_Satya;
private String Dealsheet_GM_sales_VK;
private String Dealsheet_GM_for_SOPS_projects;
private String EBITDA;
private String Execution_GM_Capital_Markets_projects;
private String Execution_GM_for_CL_projects;
private String Execution_GM_for_E_business_projects;
private String Execution_GM_for_E_media_projects;
private String Execution_GM_key_Accs_AD;
private String Execution_GM_key_Accs_KK;
private String Execution_GM_key_Accs_PS;
private String Execution_GM_key_Accs_RP;
private String Execution_GM_sales_DIT;


private String Execution_GM_sales_Mani;
private String Execution_GM_sales_Satya;
private String Execution_GM_sales_VK;
private String Execution_GM_for_SOPS_projects;

private String Overall_deal_sheet_GM;
private String Overall_execution_GM;
private String Overall_Org_GM;
private String Total_biiling_in_Consumer_Lending;

private String Total_Billing;
private String Total_billing_in_Capital_Markets;
private String Total_billing_in_E_business;
private String Total_billing_in_E_media;

private String Total_billing_in_Key_Account_CP_AD;
private String Total_billing_in_Key_Account_CP_kk;
private String Total_billing_in_Key_Account_CP_ps;
private String Total_billing_in_Key_Account_CP_RP;

private String Total_billing_in_SOPS;
private String Total_billinTotal_g_in_Capital_Markets;
private String Total_expenditures;
private String Year;
private String Month;
/* public String getFirstName() {
return this.firstName;
}*/





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
public String getExecution_GM_for_E_business_projects() {
return Execution_GM_for_E_business_projects;
}
public void setExecution_GM_for_E_business_projects(String add) {
this.Execution_GM_for_E_business_projects=add;
}

public String getDealsheet_GM_key_Accs_AD() {
return Dealsheet_GM_key_Accs_AD;
}
public void setDealsheet_GM_key_Accs_AD(String add) {
this.Dealsheet_GM_key_Accs_AD=add;
}
public String getDealsheet_GM_key_Accs_KK() {
return Dealsheet_GM_key_Accs_KK;
}
public void setDealsheet_GM_key_Accs_KK(String add) {
this.Dealsheet_GM_key_Accs_KK=add;
}
public String getDealsheet_GM_key_Accs_PS() {
return Dealsheet_GM_key_Accs_PS;
}
public void setDealsheet_GM_key_Accs_PS(String add) {
this.Dealsheet_GM_key_Accs_PS=add;
}
public String getDealsheet_GM_key_Accs_RP() {
return Dealsheet_GM_key_Accs_RP;
}
public void setDealsheet_GM_key_Accs_RP(String add) {
this.Dealsheet_GM_key_Accs_RP=add;
}
public String getExecution_GM_sales_DIT() {
return Execution_GM_sales_DIT;
}
public void setExecution_GM_sales_DIT(String add) {
this.Execution_GM_sales_DIT=add;
}
public String getExecution_GM_sales_Mani() {
return Execution_GM_sales_Mani;
}
public void setExecution_GM_sales_Mani(String add) {
this.Execution_GM_sales_Mani=add;
}
public String getDealsheet_GM_sales_Satya() {
return Dealsheet_GM_sales_Satya;
}
public void setDealsheet_GM_sales_Satya(String add) {
this.Dealsheet_GM_sales_Satya=add;
}
public String getExecution_GM_sales_VK() {
return Execution_GM_sales_VK;
}
public void setExecution_GM_sales_VK(String add) {
this.Execution_GM_sales_VK=add;
}
public String getDealsheet_GM_for_SOPS_projects() {
return Dealsheet_GM_for_SOPS_projects;
}
public void setDealsheet_GM_for_SOPS_projects(String add) {
this.Dealsheet_GM_for_SOPS_projects=add;
}
public String getOverall_deal_sheet_GM() {
return Overall_deal_sheet_GM;
}
public void setOverall_deal_sheet_GM(String add) {
this.Overall_deal_sheet_GM=add;
}
public String getOverall_execution_GM() {
return Overall_execution_GM;
}
public void setOverall_execution_GM(String add) {
this.Overall_execution_GM=add;
}
public String getOverall_Org_GM() {
return Overall_Org_GM;
}
public void setOverall_Org_GM(String add) {
this.Overall_Org_GM=add;
}
public String getTotal_biiling_in_Consumer_Lending() {
return Total_biiling_in_Consumer_Lending;
}
public void setTotal_biiling_in_Consumer_Lending(String add) {
this.Total_biiling_in_Consumer_Lending=add;
}
public String getTotal_Billing() {
return Total_Billing;
}
public void setTotal_Billing(String add) {
this.Total_Billing=add;
}
public String getTotal_billing_in_Capital_Markets() {
return Total_billing_in_Capital_Markets;
}
public void setTotal_billing_in_Capital_Markets(String add) {
this.Total_billing_in_Capital_Markets=add;
}
public String getTotal_billing_in_E_business() {
return Total_billing_in_E_business;
}
public void setTotal_billing_in_E_business(String add) {
this.Total_billing_in_E_business=add;
}
public String getTotal_billing_in_E_media() {
return Total_billing_in_E_media;
}
public void setTotal_billing_in_E_media(String add) {
this.Total_billing_in_E_media=add;
}
public String getTotal_billing_in_Key_Account_CP_AD() {
return Total_billing_in_Key_Account_CP_AD;
}
public void setTotal_billing_in_Key_Account_CP_AD(String add) {
this.Total_billing_in_Key_Account_CP_AD=add;
}
public String getTotal_billing_in_Key_Account_CP_kk() {
return Total_billing_in_Key_Account_CP_kk;
}
public void setTotal_billing_in_Key_Account_CP_kk(String add) {
this.Total_billing_in_Key_Account_CP_kk=add;
}
public String getTotal_billing_in_Key_Account_CP_ps() {
return Total_billing_in_Key_Account_CP_ps;
}
public void setTotal_billing_in_Key_Account_CP_ps(String add) {
this.Total_billing_in_Key_Account_CP_ps=add;
}
public String getTotal_billing_in_Key_Account_CP_RP() {
return Total_billing_in_Key_Account_CP_RP;
}
public void setTotal_billing_in_Key_Account_CP_RP(String add) {
this.Total_billing_in_Key_Account_CP_RP=add;
}
public String getTotal_billing_in_SOPS() {
return Total_billing_in_SOPS;
}
public void setTotal_billing_in_SOPS(String add) {
this.Total_billing_in_SOPS=add;
}
public String getTotal_billinTotal_g_in_Capital_Markets() {
return Total_billinTotal_g_in_Capital_Markets;
}
public void setTotal_billinTotal_g_in_Capital_Markets(String add) {
this.Total_billinTotal_g_in_Capital_Markets=add;
}
public String getTotal_expenditures() {
return Total_expenditures;
}
public void setTotal_expenditures(String add) {
this.Total_expenditures=add;
}
public String getYear() {
return Year;
}
public void setYear(String add) {
this.Year=add;
}
public String getMonth() {
return Month;
}
public void setMonth(String add) {
this.Month=add;
}


static testMethod void myTest() {


FinanceDataController controller = new FinanceDataController();
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
controller.getExecution_GM_for_E_business_projects();
controller.setExecution_GM_for_E_business_projects('def');

controller.getDealsheet_GM_key_Accs_AD();
controller.setDealsheet_GM_key_Accs_AD('def');
controller.getTotal_biiling_in_Consumer_Lending();
controller.setTotal_biiling_in_Consumer_Lending('def');

controller.getTotal_billing_in_Capital_Markets();
controller.setTotal_billing_in_Capital_Markets('def');



controller.getDealsheet_GM_key_Accs_KK();
controller.setDealsheet_GM_key_Accs_KK('def');
controller.getDealsheet_GM_key_Accs_PS();
controller.setDealsheet_GM_key_Accs_PS('def');
controller.getDealsheet_GM_key_Accs_RP();
controller.setDealsheet_GM_key_Accs_RP('def');
controller.getExecution_GM_sales_DIT();
controller.setExecution_GM_sales_DIT('def');
controller.getExecution_GM_sales_Mani();
controller.setExecution_GM_sales_Mani('def');
controller.getDealsheet_GM_sales_Satya();
controller.setDealsheet_GM_sales_Satya('def');
controller.getExecution_GM_sales_VK();
controller.setExecution_GM_sales_VK('def');
controller.getDealsheet_GM_for_SOPS_projects();
controller.setDealsheet_GM_for_SOPS_projects('def');
controller.getOverall_deal_sheet_GM();
controller.setOverall_deal_sheet_GM('def');
controller.getOverall_execution_GM();
controller.setOverall_execution_GM('def');


controller.getOverall_Org_GM();
controller.setOverall_Org_GM('def');

controller.getTotal_biiling_in_Consumer_Lending();
controller.setTotal_biiling_in_Consumer_Lending('def');

controller.getTotal_Billing();
controller.setTotal_Billing('def');

controller.getTotal_billing_in_Capital_Markets();
controller.setTotal_billing_in_Capital_Markets('def');

controller.getTotal_billing_in_Capital_Markets();
controller.setTotal_billing_in_Capital_Markets('def');
controller.getTotal_billing_in_E_business();
controller.setTotal_billing_in_E_business('def');
controller.getTotal_billing_in_E_media();
controller.setTotal_billing_in_E_media('def');
controller.getTotal_billing_in_Key_Account_CP_AD();
controller.setTotal_billing_in_Key_Account_CP_AD('def');
controller.getTotal_billing_in_Key_Account_CP_kk();
controller.setTotal_billing_in_Key_Account_CP_kk('def');
controller.getTotal_billing_in_Key_Account_CP_ps();
controller.setTotal_billing_in_Key_Account_CP_ps('def');
controller.getTotal_billing_in_Key_Account_CP_RP();
controller.setTotal_billing_in_Key_Account_CP_RP('def');
controller.getTotal_billing_in_SOPS();
controller.setTotal_billing_in_SOPS('def');
controller.getTotal_billinTotal_g_in_Capital_Markets();
controller.setTotal_billinTotal_g_in_Capital_Markets('def');
controller.getTotal_expenditures();
controller.setTotal_expenditures('def');
controller.getYear();
controller.setYear('def');
}
}