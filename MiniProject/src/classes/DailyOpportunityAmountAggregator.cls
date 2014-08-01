global class DailyOpportunityAmountAggregator implements Database.Batchable<sObject>, Database.Stateful {
	
	global  double SumAmount;
	global double totalopp = 0;
	global long processingtime;
	global long starttime;
	global long endtime;
	String str = 'Closed Won';
	global Id jId;
	
	public DailyOpportunityAmountAggregator()
	{
	  SumAmount=0;
	}
	 global Database.QueryLocator start(Database.BatchableContext BC)
	 {
	   String query = 'SELECT StageName,IsAggregated__c, Amount FROM Opportunity WHERE CreatedDate = today  AND  StageName=\'' + str + '\'';
	   return Database.getQueryLocator(query);
	 }

      global void execute(Database.BatchableContext BC, List<sObject> scope)
      {
      	  List<Opportunity> opportunities = new List<Opportunity>();
        for(sObject sobjectIter :scope)
        {
            Opportunity opp = (Opportunity)sobjectIter;
            opp.IsAggregated__c=true;
            SumAmount=SumAmount+opp.Amount; 
            system.debug('******'+SumAmount);
             opportunities.add(opp);
        }
         totalopp = opportunities.size();
        update opportunities;
        
      }
      
      global void finish(Database.BatchableContext BC){
  		 // Get the ID of the AsyncApexJob representing this batch job
  		 // from Database.BatchableContext.
	   	// Query the AsyncApexJob object to retrieve the current job's information.
  		 AsyncApexJob a = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
   		  TotalJobItems, CreatedBy.Email,CompletedDate,CreatedDate
    		  FROM AsyncApexJob WHERE Id =
  		    :BC.getJobId()];
  			 // Send an email to the Apex job's submitter notifying of job completion.
  		// ApexJob j=[SELECT totalProcessingTime FROM  Job WHERE Id= :BC.getJobId()];
  		starttime=a.CreatedDate.getTime();
  		endtime=a.CompletedDate.getTime();
  		processingtime=(starttime-endtime)/3600000;
  		 User usr = [Select u.Id, u.email, u.name From User u where u.profile.Name = 'System Administrator'];
  		 Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
 		  String[] toAddresses = new String[] {usr.Email};
  		 mail.setToAddresses(toAddresses);
  		 mail.setSubject('Daily Opportunity Amount Aggregator Job ' + a.Status);
  		 mail.setPlainTextBody
  			 ('The batch job for Daily Opportunity Amount Aggregation has completed successfully. The details associated with the job are as follows: \n Start DateTime : ' + a.CreatedDate +
  			 '\n End DateTime:'+ a.CompletedDate +'\n Total Duration (in Hours):'+processingtime+'\n Number of Opportunities Closed Won Today:'+totalopp+'\nTotal Opportunity Amount for today :'+SumAmount);
  		 Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
}
}