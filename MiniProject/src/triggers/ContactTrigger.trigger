trigger ContactTrigger on Contact (before insert, before update) {
if(TriggerHandler__c.getValues(userInfo.getUserID()).DisableTrigger__c == false)
     {
        ContactTriggerHandler handler =new ContactTriggerHandler ();

           /* Before Insert */
         if (Trigger.isInsert && Trigger.isBefore)
          {
            handler.OnBeforeInsert(Trigger.new);
          }
    
           /* Before update  
    
           if (Trigger.isUpdate && Trigger.isBefore)
            {
            handler.OnBeforeUpdate(Trigger.new);
            }
            */
    }
}