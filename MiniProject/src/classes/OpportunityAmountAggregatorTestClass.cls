@isTest
public with sharing class OpportunityAmountAggregatorTestClass {

 static testmethod void TestOpportunityAmountAggregator()
  {
    List<Opportunity> opplist = new List<Opportunity>();
    for(integer i=0;i<200;i++)
    {
        Opportunity Opp = new Opportunity();
        Opp.Name ='Opportunity 1';
        Opp.CloseDate = Date.today();
        Opp.StageName = 'Closed Won';
        Opp.Amount = 100;
        opplist.add(Opp);
     }
  
        insert  opplist;
  
        Test.startTest();
 
        DailyOpportunityAmountAggregator obj = new DailyOpportunityAmountAggregator();
        Database.executeBatch(obj);
       // ischeck=opp.isScheduled();
        Test.stopTest();
  
        List<Opportunity> lstFinal = [SELECT o.Name, o.Id FROM Opportunity o WHERE o.isAggregated__c = true];
  
        system.assertEquals(200, lstFinal.size());
        //system.assertEquals(20000,obj.SumAmount);
    }
    
    static testmethod void testSchedule(){
  String CRON_EXP = '0 30 20 ? * MON-FRI *';
  
  test.startTest();
  
  List<Opportunity>opplist = new List<Opportunity>();
  
  for(Integer i=0;i<200;i++){
   Opportunity Opp = new Opportunity();
   Opp.Name = 'Opportunity 1';
   Opp.CloseDate = Date.today();
   Opp.StageName = 'Closed Won';
   Opp.Amount = 100;
     
  opplist.add(Opp);
  }
  
  insert  opplist;
  
  String jobID = system.schedule('New Schedule Job', CRON_EXP, new jobSchedular ());
  
  CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered, NextFireTime FROM CronTrigger WHERE Id = :jobID];
  
  System.assertEquals(CRON_EXP,ct.CronExpression);
      System.assertEquals(0, ct.TimesTriggered);
      System.assertEquals('2014-07-07 20:30:00', String.ValueOf(ct.NextFireTime));
      test.stopTest();
 }
    
}