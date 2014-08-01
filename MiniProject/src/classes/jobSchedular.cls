global class jobSchedular implements Schedulable {

	global void execute(SchedulableContext SC) {
	 DailyOpportunityAmountAggregator obj=new DailyOpportunityAmountAggregator();
	 database.executeBatch(obj);
   }
}