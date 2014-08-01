public with sharing class AccountDuplicateCheckHandler {

   public void OnbeforeInsert(List<Account> a)
   {
      Integer cnt=0;
      Id parentID;
      
      List<Account> a1=[select a1.Email__c,a1.Name,a1.Phone from Account a1];
    
      
   	 List<Account> l1=new List<Account>();
   	 
   	  for(Account a2 : a)
            {
             for(Account a3:a1)
              {
                if((a2.Email__c==a3.Email__c && a2.Phone==a3.Phone) || (a2.Email__c==a3.Email__c && a2.Name==a3.Name) || (a2.Phone==a3.Phone && a2.Name==a3.Name))
                {
                  
                   a2.Duplicate__c=true;
                   l1=[select l1.Name from Account l1 where l1.Email__c = :a2.Email__c OR l1.Phone = :a2.Phone];
                }
                
              }
              
            }
            
            for(Account a4 :l1)
            {
              cnt++;
              a4.Duplicate__c=true;
              if(cnt==1)
              {
                 a4.Duplicate__c=False;
                 parentID=a4.Id;  
              }
              else
              {
              	a4.ParentId=parentID;
              }
            }
            
            for(Account a5 : a)
            {
              a5.ParentId=parentID;
            }
            
        
   }
   
   
   public void OnbeforeUpdate(List<Account> a)
   {
      Integer cnt=0;
      Id parentID;
      
      List<Account> a1=[select a1.Email__c,a1.Name,a1.Phone from Account a1];
    
      
   	 List<Account> l1=new List<Account>();
   	 
   	  for(Account a2 : a)
            {
             for(Account a3:a1)
              {
                if((a2.Email__c==a3.Email__c && a2.Phone==a3.Phone) || (a2.Email__c==a3.Email__c && a2.Name==a3.Name) || (a2.Phone==a3.Phone && a2.Name==a3.Name))
                {
                  
                   a2.Duplicate__c=true;
                   l1=[select l1.Name from Account l1 where l1.Email__c = :a2.Email__c OR l1.Phone = :a2.Phone];
                }
                
              }
              
            }
            
            for(Account a4 :l1)
            {
              cnt++;
              a4.Duplicate__c=true;
              if(cnt==1)
              {
                 a4.Duplicate__c=False;
                 parentID=a4.Id;  
              }
              else
              {
              	a4.ParentId=parentID;
              }
            }
            
            for(Account a5 : a)
            {
              a5.ParentId=parentID;
            }
            
        system.debug('**********duplicate records = '+cnt);
   }
}