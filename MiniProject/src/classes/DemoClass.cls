global class DemoClass {
	
	 public String result;
	
/*  public DemoClass(String Cname)
  {
     Contact c=[select c.Id,c.FirstName,c.LastName from Contact c where c.Name= :Cname];
    
      system.debug('#######'+c.Id);
      system.debug('#######'+c.FirstName);
      system.debug('#######'+c.LastName);
  }*/
  
  public list<String> Question1(String accname)
  {
  	
   
      list<Contact> c = [Select c.Name From Contact c where c.Account.Name= : accname];
      System.debug('******'+c);
      list<String> names=new list<String>();
      
      integer i=0;
      for(i=0;i<c.size();i++)
      {
        system.debug(c.get(i).Name);
        names.add(c.get(i).Name);
      }
    return names;
  }
  
  public String Question2(String cname)
    {
          Contact c1 = [Select c1.Account.Name From Contact c1 where c1.Name= : cname];
          System.debug('******'+c1);
          
        
             system.debug(c1.Account.Name);
             return(c1.Account.Name);
            
    }
    
    
    public String Question3_1(Integer num)
    {
        Integer rem;
        rem=math.mod(num,2);
        
        if(rem==0)
        {
          system.debug('*****Given number is even******');
          result='even';
        }
        else
        {
          system.debug('*****Given number is odd******');
          result='odd';
        }
        return result;
    }
    
    public list<Integer> Question3_2(Integer no)
    {
    	list<Integer> fiblist=new list<Integer>();
    	Integer a=0,b=1,c,i;
        system.debug('******Fibbonaci series******');
        system.debug('  '+a);
        system.debug('  '+b);
        fiblist.add(a);
        fiblist.add(b);
        for(i=0;i<(no-2);i++)
        {
        	c=a+b;
        	system.debug('  '+c);
        	fiblist.add(c);
        	a=b;
        	b=c;
        }
        return fiblist;
        
    }
    
    public void Question4(String accname)
    {
       Account a = [Select a.Id From Account a where a.Name= : accname];
       Contact c=new Contact();
       system.debug(a.Id);
       c = [select c.Name from Contact c where c.Account.Id = :a.Id limit 1];  
       c.LastName = 'Patil';
       
       update c;  //This only changes the contact's last name
       
       
       system.debug('****'+c.Name);
    }
    
     webservice static void Question5(Id accID){
        Account acc = new Account();
        acc.Id = accID;
        acc.Phone = String.valueOf(252525);
        update acc;
    }
    
    
     public list<String> Question7()
     {
     LIST<Account> a=[select a.Name,a.AccountNumber from Account a where a.Name like 'A%'];
     list<String> aname=new list<String>();
      Integer i=0;
      for( i=0;i<a.size();i++)
     {
      system.debug(a.get(i).Name);
      system.debug(a.get(i).AccountNumber);
      aname.add(a.get(i).Name);
     }
     return aname;
    }
   
   
   public void Question8(String accname,String CFirstname,String CLastname)
   {
      Account a = new Account(name = accname );
      insert a;
      Contact c = new Contact(FirstName= CFirstname, lastName = CLastname);
      c.accountId = a.Id;
      insert c;
      
      a=[select a.Id from Account a where a.name = :accname];
      system.debug('********'+a.id);
      
      c=[select c.Id from contact c where c.FirstName = :CFirstname];
      system.debug('$$$$$$$$'+c.id);
   }
   
   public list<Account> Question9()
   {
      List<Account> a= new List<Account>();
      list<String> sortnames=new list<String>();
      a=[select a.Name from Account a];
      system.debug('*****List before sorting*****');
      Integer i;
      for(i=0;i<a.size();i++)
      {
        system.debug(a.get(i).name);
      }
      a.sort();
      system.debug('*****List after sorting*****');
      for(i=0;i<a.size();i++)
      {
        system.debug(a.get(i).name);
       
      }
      return a;
   }
   
   public list<String> Question10(String accname)
   {
   	List<Account> c=[Select (Select Id, LastName, FirstName, Name From Contacts) From Account a where a.Name= :accname];
      list<String> clnames=new list<String>();
      for(Account acc:c)
     {
       
       for(Integer i=0;i<acc.Contacts.size();i++){
       	system.debug(acc.Contacts[i].Id);	
       system.debug(acc.Contacts[i].FirstName);	
       system.debug(acc.Contacts[i].LastName);	
       clnames.add(acc.Contacts[i].LastName);
       }
       
     }
      return clnames;
   }
   }