public with sharing class theController {
  public list<wrapper> records;
  public class wrapper {
    public wrapper(boolean selected, account record) {
      this.selected = selected;
      this.record = record;
    }
    public boolean selected { get; set; }
    public account record { get; set; }
  }
  public theController() {
    records = new list<wrapper>();
    for(account a:[select id,name from Account]) {
      records.add(new wrapper(false,a));
    }
  }
  public ApexPages.PageReference nextPage() {
   return null;
  }
  public integer getSelectedCount() {
    integer i = 0;
    for(wrapper w:records) {
      if(w.selected) {
        i++;
      }
    }
    return i;
  }
}