public with sharing class ContactTriggerHandler {
	
	
        public void OnBeforeInsert(List<Contact> c1)
        {
            List<Contact> l1=new List<Contact>();
            
            l1=[select l1.Email,l1.Phone from Contact l1];
            
            for(Contact c11 : c1)
            {
             for(Contact c:l1)
            {
                if(c11.Email==c.Email || c11.Phone==c.Phone)
                {
                   c11.addError('A Contact with the same email address or phone number already exists in system.');
                }
                
            }
            }
        }
        
       /* public void OnBeforeUpdate(List<Contact> c1)
        {
            List<Contact> l1=new List<Contact>();
            
            l1=[select l1.Email,l1.Phone from Contact l1];
            
            for(Contact c11 : c1)
            {
             for(Contact c:l1)
            {
                if(c11.Email==c.Email || c11.Phone==c.Phone)
               {
                   c11.addError('A Contact with the same email address or phone number already exists in system.');
                }
                
            }
            }
        }*/

   }