trigger AccountDuplicateCheckTrigger on Account (before insert, before update) {

    AccountDuplicateCheckHandler handler =new AccountDuplicateCheckHandler();

     // Before Insert 
    if (Trigger.isInsert && Trigger.isBefore)
	{
	        handler.OnBeforeInsert(Trigger.new);
	}
	
	 //Before update 
    /*if (Trigger.isUpdate && Trigger.isBefore)
	{
	        handler.OnBeforeUpdate(Trigger.new);
	}*/
}