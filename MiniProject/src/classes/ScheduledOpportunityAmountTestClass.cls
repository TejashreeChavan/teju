@isTest
public with sharing class ScheduledOpportunityAmountTestClass {
	
	

	public static testmethod void testPage(){
		
	    string CRON_EXP = '0 50 20 5 JUL ? 2014';
		Pagereference pageref = Page.Scheduled_Opportunity_Amount_Aggregator;
		Test.setCurrentPage(pageref);
		
		ScheduledOpportunityAmountAggregator scha = new ScheduledOpportunityAmountAggregator();
		scha.Seconds=0; 
   		scha.Minutes=50;
    	scha.Hours=20;
    	scha.DOM=5; 
    	scha.Month='JUL';
    	scha.DOW='?';  
    	scha.year=2014; 
		
		scha.SeePreview();
		scha.Schedule();
		CronTrigger ct = [SELECT Id, CronExpression, TimesTriggered FROM CronTrigger WHERE Id = :scha.jobId];
    	System.assertEquals(CRON_EXP,ct.CronExpression);
       	System.assertEquals(0, ct.TimesTriggered);
       	
	}
	
	public static testmethod void testvalidation()
	{
	   Pagereference pageref = Page.Scheduled_Opportunity_Amount_Aggregator;
		Test.setCurrentPage(pageref);
		
		ScheduledOpportunityAmountAggregator scha = new ScheduledOpportunityAmountAggregator();
		scha.Seconds=68; 
   		scha.Minutes=18;
    	scha.Hours=12;
    	scha.DOM=14; 
    	scha.Month='FEB';
    	scha.DOW='?';  
    	scha.year=2014;
    	
    	scha.SeePreview(); 
    	
    	scha.Seconds=0; 
   		scha.Minutes=61;
    	scha.Hours=12;
    	scha.DOM=25; 
    	scha.Month='FEB';
    	scha.DOW='?';  
    	scha.year=2014;
    	
    	scha.SeePreview(); 
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=30;
    	scha.DOM=23; 
    	scha.Month='MAR';
    	scha.DOW='?';  
    	scha.year=2014;
    	
    	scha.SeePreview(); 
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=14;
    	scha.DOM=31; 
    	scha.Month='FEB';
    	scha.DOW='?';  
    	scha.year=2012;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=15;
    	scha.DOM=29; 
    	scha.Month='FEB';
    	scha.DOW='?';  
    	scha.year=2014;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=15;
    	scha.DOM=35; 
    	scha.Month='MAR';
    	scha.DOW='?';  
    	scha.year=2014;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=15;
    	scha.DOM=31; 
    	scha.Month='JUN';
    	scha.DOW='?';  
    	scha.year=2014;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=15;
    	scha.DOM=0; 
    	scha.Month='JUN';
    	scha.DOW='tst';  
    	scha.year=2014;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=15;
    	scha.DOM=0; 
    	scha.Month='JUN';
    	scha.DOW='SAT';  
    	scha.year=1960;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=15;
    	scha.DOM=0; 
    	scha.Month='JUNR';
    	scha.DOW='SATT';  
    	scha.year=2014;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=0;
    	scha.Hours=15;
    	scha.DOM=0; 
    	scha.Month='cod';
    	scha.DOW='tuj';  
    	scha.year=2014;
    	
    	scha.SeePreview();
    	
    	scha.Seconds=0; 
   		scha.Minutes=30;
    	scha.Hours=19;
    	scha.DOM=0; 
    	scha.Month='JUL';
    	scha.DOW='SAT';  
    	scha.year=2014;
    	
    	scha.SeePreview();
    	
	}
	
}