trigger CampaignMemberTrigger on CampaignMember (before insert) {
	 

     CampaignMemberHandler handler =new CampaignMemberhandler();
  
      //Berfore Insert
       if (Trigger.isInsert && Trigger.isBefore)
	  {
	        handler.OnBeforeInsert(Trigger.new);
	  }
	  

}