public class MetricsController {
ApexPages.StandardController controller{get; set;}
private String Name;
private String Objective;
private String Department;
private String Sub_Department;
private String Category;
private String Scorecard;

/* public String getFirstName() {
return this.firstName;
}*/

public void setName(String firstName) {
this.Name= firstName;
}
public String getObjective() {
return Objective;
}
public String getName() {
return Name;
}
public void setObjective(String add) {
this.Objective=add;
}
public void setDepartment(String email) {
this.Department= email;
}
public void setSub_Department(String num) {
this.Sub_Department= num;
}
public void setCategory(String lName) {
this.Category= lName;
}

/* public String getLastName() {
return this.lastName;
}*/

public void setScorecard(String Name) {
this.Scorecard= Name;
}


 static testMethod void myTest() {


MetricsController controller = new MetricsController();

controller.setName('abc');
controller.getObjective();
controller.getName();
controller.setObjective('def');
controller.setDepartment('def');
controller.setSub_Department('def');
controller.setCategory('def');
controller.setScorecard('def');

}



}