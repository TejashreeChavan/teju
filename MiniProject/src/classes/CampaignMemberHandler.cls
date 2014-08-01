public with sharing class CampaignMemberHandler {
	
	
	public void OnBeforeInsert(List<CampaignMember> cm)
	{
	  Set<Id> set1 = new Set<Id>();
	  Map<Id,String> rsvp = new Map<Id,string>();
	  for(CampaignMember c:cm)
	  {
	     set1.add(c.LeadId);
	  }
	  
	  for(Lead l1 :[Select l.Id,l.RSVP__c From Lead l where ID IN :set1])
	  {
	      rsvp.put(l1.Id,l1.rsvp__c);
	  }
	  
	  for(CampaignMember cmm:cm)
       {
          cmm.rsvp__c = rsvp.get(cmm.LeadId);
       }
	}

}