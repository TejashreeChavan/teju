trigger TaskCreatetionTrigger on Account (after insert) {

    TaskCreationHandler handler = new TaskCreationHandler();
    
     //After insert
     if (Trigger.isInsert && Trigger.isAfter)
	{
	        handler.OnAfterInsert(Trigger.new);
	}
}