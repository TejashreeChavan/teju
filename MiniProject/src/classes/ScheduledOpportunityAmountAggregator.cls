public with sharing class ScheduledOpportunityAmountAggregator {


 public Integer Seconds{get;set;}
 public Integer Minutes{get;set;}
 public Integer Hours{get;set;}
 public Integer DOM{get;set;}
 public String Month{get;set;}
 public String DOW{get;set;}
 public Integer year{get;set;}
 public String CronExperssion;
 public Id jobId;
 
 
 
 public ScheduledOpportunityAmountAggregator()
 {
 	Seconds=0;
 	Minutes=0;
 	Hours=0;
 	Month='*';
 	DOW='?';
 	DOM=null;
 }
 
 public void SeePreview()
 {
 	
 	if(Month.length()==3)
   {
   if(Month.toUpperCase()!='JAN' && Month.toUpperCase()!='FEB' && Month.toUpperCase()!='MAR' && Month.toUpperCase()!='APR' && Month.toUpperCase()!='MAY' && Month.toUpperCase()!='JUN' && Month.toUpperCase()!='JUL' && Month.toUpperCase()!='AUG' && Month.toUpperCase()!='SEP'  && Month.toUpperCase()!='OCT' && Month.toUpperCase()!='NOV' && Month.toUpperCase()!='DEC')
   {
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter right month');
              ApexPages.addMessage(myMsg);
              return;
   }
   
  
   }
   else
   {
      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter only first 3 digits of month');
              ApexPages.addMessage(myMsg);
              return;
   }
   
       if(DOW.toUpperCase()!='SUN' && DOW.toUpperCase()!='MON' && DOW.toUpperCase()!='TUE' && DOW.toUpperCase()!='WED' && DOW.toUpperCase()!='THU' && DOW.toUpperCase()!='FRI' && DOW.toUpperCase()!='SAT' && DOW!='?')
      {
          ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Right Day');
              ApexPages.addMessage(myMsg);
              return;
      }
   
   
   if(year<1970 || year>2014)
   {
      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter year between 1970 to 2014');
              ApexPages.addMessage(myMsg);
              return;
   }
   if(Seconds>59 || Seconds<0)
     {
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Seconds value between 0 to 59');
              ApexPages.addMessage(myMsg);
              return;
     }
     
     if(Minutes>59 || Minutes<0)
   {
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Minutes value between 0 to 59');
              ApexPages.addMessage(myMsg);
              return;
   }
   
   if(Hours>23 || Hours<0)
   {
      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Hours value between 0 to 23');
              ApexPages.addMessage(myMsg);
              return;
   }
   
   if(DOM!=0)
   {
   	  if( Month.toUpperCase()=='FEB')
   	  {
   	     if(math.mod(year,4)==0)
   	     {
   	       if(DOM>29 || DOM<=0)
   	       {
   	        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Day of Month between 1 to 29');
              ApexPages.addMessage(myMsg);
               return;
   	       }
   	     }
   	     else
   	       {
   	         if(DOM>28 || DOM<=0)
   	         {
   	            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Day of Month between 1 to 28');
                ApexPages.addMessage(myMsg);
                return;
   	         
   	         }
   	       }
   	     
   	  }
   	 if( Month.toUpperCase()=='ARP' || Month.toUpperCase()=='JUN'|| Month.toUpperCase()=='SEP' || Month.toUpperCase()=='NOV')
   	 {
     if(DOM>30 || DOM<=0)
     {
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Day of Month between 1 to 30');
              ApexPages.addMessage(myMsg);
               return;
     }
   	 }
   	 if(Month.toUpperCase()=='JAN' || Month.toUpperCase()=='MAR'  || Month.toUpperCase()=='MAY'  || Month.toUpperCase()=='JUL' || Month.toUpperCase()=='AUG'  || Month.toUpperCase()=='OCT'  || Month.toUpperCase()=='DEC')
   	 {
   	    if(DOM>31 || DOM<=0)
     {
       ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'Please Enter Day of Month between 1 to 31');
              ApexPages.addMessage(myMsg);
               return;
     }
   	 }
   }
   
    if(DOM==0)
    {
    	CronExperssion=''+Seconds+' '+Minutes+' '+Hours+' ? '+Month+' '+DOW+' '+year+'';
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Your Cron Exression is:  '+CronExperssion);
              ApexPages.addMessage(myMsg);
              return;
    }
    else
    {
    	CronExperssion=''+Seconds+' '+Minutes+' '+Hours+' '+DOM+' '+Month+' '+DOW+' '+year+'';
      ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Your Cron Exression is:  '+CronExperssion);
              ApexPages.addMessage(myMsg);
              return;
    }
 }
 
 public void Schedule()
 {
 
    SeePreview();
    jobSchedular jsch=new jobSchedular();
    jobId=System.schedule('Opportuinity job Schedular'+CronExperssion,CronExperssion,jsch);
    
    ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.INFO,'Your Job has been scheduled...!!!');
              ApexPages.addMessage(myMsg);
              return;
 }
}