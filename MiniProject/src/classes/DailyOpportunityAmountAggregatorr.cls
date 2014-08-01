global class DailyOpportunityAmountAggregatorr implements Database.Batchable<sObject>,Database.stateful{
    
    global double totalAmount; 
    global double totalSize;
    Time StartTime,EndTime;
    long total;
    
   
    public DailyOpportunityAmountAggregatorr(){  
      StartTime = Datetime.now().time();
       totalAmount = 0;
    }
   
    global Database.querylocator start(Database.BatchableContext BC){
        String query = 'SELECT StageName,IsAggregated__c, Amount FROM Opportunity WHERE CreatedDate = today AND IsAggregated__c = false AND  StageName= \'closed won\'';
        return Database.getQueryLocator(query);
    }
   
    global void execute(Database.BatchableContext BC, List<sObject> scope){
        
        List<Opportunity> opportunities = new List<Opportunity>();
        
        for(sObject sobjectIter : scope){
            Opportunity opportunity = (Opportunity)sobjectIter;
          //  opportunity.IsAggregated__c = true;
        
            if(opportunity.Amount != null){
                totalAmount = totalAmount + opportunity.Amount;
                //opportunities.add(opportunity);
            }
            opportunity.IsAggregated__c = true;
            opportunities.add(opportunity);
        }
        totalSize = opportunities.size();
        update opportunities;
    }   
   
    global void finish(Database.BatchableContext BC){
       
        AsyncApexJob apexJob = [SELECT Id, Status, NumberOfErrors, JobItemsProcessed,
                                       TotalJobItems, CreatedBy.Email,a.CreatedDate, a.CompletedDate
                                FROM AsyncApexJob a WHERE Id = :BC.getJobId()];
        
        if(apexJob.status=='Completed')
            EndTime = Datetime.now().time();
          
       // StartTime=apexJob.CreatedDate.gettime();
      //  EndTime=apexJob.CompletedDate.gettime();
        total=StartTime.hour()-EndTime.hour();
            
        String email = 'tejashree.chavan@eternussolutions.com';
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setToAddresses(new String[] {email});
    
        mail.setSenderDisplayName('Batch Processing');
        mail.setSubject('Daily Opportunity Amount Aggregator Job Complete');
        system.debug('***CronTrigger.StartTime**' + apexJob );
       mail.setPlainTextBody('Start DateTime    :   '+StartTime+'\n'+'End DateTime    :   '+EndTime+'\n'+'Total time:  '+total+'\n Number of Opportunities Closed Won Today: '+totalSize+'\n'+' Total Opportunity Amount for today: '+totalAmount );
     
        Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });
    }

}