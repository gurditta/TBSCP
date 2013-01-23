public class SukhiDemoReportController{
    public List<scorecard__Store__c> scores{get;set;}
    Integer scoresCount;
    Integer totalDeleted;
    public string deletedRecordEmail;
    public SukhiDemoReportController(){
        scoresCount = [Select count() FROM scorecard__Store__c];
        totalDeleted = [SELECT count() FROM scorecard__Store__c WHERE IsDeleted = TRUE];
        scores  = [SELECT Name, Id,IsDeleted,
                            scorecard__EmailId__c 
                  FROM Store__c WHERE IsDeleted = true ORDER BY LastModifiedDate DESC LIMIT 10 ALL ROWS];
    }
    public void restoreDeletedRecords(){
          deletedRecordEmail = Apexpages.currentPage().getParameters().get('deletedRecordEmail');
          scorecard__Store__c[] a = [SELECT Name, Id FROM scorecard__Store__c WHERE Id =: deletedRecordEmail ALL ROWS];
          undelete a;
    }
    public Integer getscoresCount(){
        return scoresCount;
    }
    public Integer gettotalDeleted(){
        return totalDeleted;//yo yo
    }
}