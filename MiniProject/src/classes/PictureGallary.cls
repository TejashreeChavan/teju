public with sharing class PictureGallary {
	
	public Id aId;
	
	public String Emails{get;set;} 
	
	public class picWrapper
	{
       public String IName{get;set;}
       public Id imgId{get;set;}
       Public boolean flag{get;set;}
       
       public picWrapper(Id id,String str)
       {
         IName=str;
         imgId=id;
         flag=false;
       }
	}
	
	public List<picWrapper> piclist{get;set;}
	private Account acc = new Account();
	public List<Attachment> attlist =new List<Attachment>();
	
	public PictureGallary(ApexPages.StandardController stdCtrl)
	{
	   piclist=new List<picWrapper>();
	   this.acc=(Account)stdCtrl.getRecord();
	   aId=acc.Id;
	   
	   attlist=[SELECT Id,Name from Attachment WHERE ParentId= :aId];
	   
	   for(Attachment att:attlist)
	   {
	      piclist.add(new picWrapper(att.Id,att.Name));
	   }
	}
	
	public void sendEmail()
	{

        if(String.isEmpty(Emails)){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'email address is blank');
            ApexPages.addMessage(myMsg);
            return;
        }
        else
        {
		 List<Messaging.EmailFileAttachment> lstAttachment = new List<Messaging.EmailFileAttachment>();
		 set<Id> IDset = new Set<id>();
		
		   String[] toAddresses = Emails.split(':', 0);
	   	 Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
	   	 email.setToAddresses(toAddresses);
	   	 email.setSubject('Property Images of Ocean Properties, Ltd.');
	   	 email.setPlainTextBody('PFA which are images of our properties');
	    
	     for(picWrapper wpr:piclist){
            if(wpr.flag){        
             IDset.add(wpr.imgId);
            }
	     }
            // Create the email attachment
            for(Attachment att:[SELECT Id, Body, Name FROM Attachment WHERE Id IN :IDset])
            {
                  Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
                  
                  efa.SetBody(att.body);
                  efa.setFileName(att.Name);
                  lstAttachment.add(efa);
            }
            
              email.setFileAttachments(lstAttachment);
              Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
              
              ApexPages.Message myMsg1 = new ApexPages.Message(ApexPages.Severity.INFO,'Your Email has been sent...:-)');
              ApexPages.addMessage(myMsg1);
              return;
	   
	     }
	}


}