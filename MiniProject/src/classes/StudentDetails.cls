public with sharing class StudentDetails {
	
	public final Student__c studrec{get;set;}
	public String studentname{get;set;}
	 public String selectedLang {get;set;}
	 public String msg{get;set;} 
	
	
	public StudentDetails(ApexPages.StandardController Controller)
	{
		this.studrec=(Student__c)Controller.getRecord();
	}
	
    public PageReference submit()
    {
    		studentname=studrec.Student_Name__c;
    		if(studentname!=null)
    		{
    		database.saveResult dbres = database.insert(studrec);
            if(dbres.isSuccess()==true)
            {
            	msg=label.submitsuccess;
            }
     
           /*pageReference newActionItem = new pageReference('https://ap1.salesforce.com/a0A/o');
           newActionItem.setRedirect(true);
           return newActionItem;*/
           return null;
    	   }
    	   else
    	   {
    	     ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'please insert Student name');
             ApexPages.addMessage(myMsg);
             return null;
    	   }
    	
    	
   }
    public void changeLanguage()
    {
 	 User nUser = [SELECT Id, LanguageLocaleKey FROM User WHERE Id=:UserInfo.getUserId()];
  	system.debug(nUser);
 	 if(selectedLang == 'French'){   
  	 nUser.LanguageLocaleKey = 'fr';
 	 } 
  	else if(selectedLang == 'Spanish'){
   	nUser.LanguageLocaleKey = 'es';
  	}
  	else{
  	nUser.LanguageLocaleKey = 'en_US';
 	 }
  	update nUser;
 	}
 	
}