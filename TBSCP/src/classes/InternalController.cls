public class InternalController {
private String Name;
private String Current_value;
private String initiative;
private String Objectives;
private String previous_value;
private String Review_Comments;
private String Targets;

/* public String getFirstName() {
return this.firstName;
}*/

public void setName(String Name) {
this.Name= Name;
}
public String getName() {
return Name;
}
public String getCurrent_value() {
return Current_value;
}
public void setCurrent_value(String CV) {
this.Current_value=CV;
}
public String getObjective() {
return Objectives;
}
public void setObjective(String objective) {
this.Objectives=objective;
}
public String getinitiative() {
return initiative;
}
public void setinitiative(String initiative) {
this.initiative=initiative;
}

public String getprevious_value() {
return previous_value;
}
public Void setprevious_value(String previous_value) {
this.previous_value= previous_value;
}
public String getReview_Comments() {
return Review_Comments;
}
public void setReview_Comments(String add) {
this.Review_Comments=add;
}
public String getTargets() {
return Targets;
}
public void setTargets(String add) {
this.Targets=add;
}
static testMethod void myTest() {
InternalController controller = new InternalController ();

controller.setName('abc');
controller.getName();

controller.getObjective();
controller.setObjective('def');

controller.getinitiative();
controller.setinitiative('def');

controller.getprevious_value();
controller.setprevious_value('def');

controller.getCurrent_value();
controller.setCurrent_value('def');

controller.getReview_Comments();
controller.setReview_Comments('def');

controller.getTargets();
controller.setTargets('def');
}
}