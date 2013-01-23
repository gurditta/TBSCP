public class redirectonthebasisofpicklist
 {

public list<Finance_Dataform__c>item{get;set;}
public Finance_Dataform__c item8;
  public redirectonthebasisofpicklist() {
 
  }
   


 public ApexPages.StandardSetController stdCntrlr {get; set;}
 public redirectonthebasisofpicklist(ApexPages.StandardSetController controller) {
 stdCntrlr = controller;
    }
    
    
     public List<selectOption> getRecordType() {
        List<selectOption> options = new List<selectOption>(); //new list for holding all of the picklist options
        options.add(new selectOption('', '- None -')); 
           options.add(new selectOption('1', 'JANUARY')); 
                options.add(new selectOption('2', 'FEBRUARY')); 
                 options.add(new selectOption('2', 'MARCH')); 
                  options.add(new selectOption('2', 'APRIL')); 
                   options.add(new selectOption('2', 'MAY')); 
                    options.add(new selectOption('2', 'JUNE')); 
                    
                
                 return options;
                }

    

}