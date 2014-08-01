global class jobSchedularr implements schedulable{
global void execute(SchedulableContext SC){
  DailyOpportunityAmountAggregatorr obj=new DailyOpportunityAmountAggregatorr();
  database.executeBatch(obj);
   }
}