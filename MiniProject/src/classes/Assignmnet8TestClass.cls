@istest
public with sharing class Assignmnet8TestClass {

  static testmethod void testAss8()
  {
     DemoClass dc=new DemoClass();
     
          Account Newacc = new Account(Name='Sandbox');
		  Newacc.Phone = '22222222';
		  Newacc.Email__c = 'gud@gmail.com';
		  insert Newacc;
		  
		  Contact Newcnt = new Contact();
		  Newcnt.FirstName='swapnil';
		  Newcnt.LastName = 'sharma';
		  Newcnt.AccountId = Newacc.id;
		  insert Newcnt;
		  
          test.starttest();
          list<String> cname=new list<String>();
          cname = dc.Question1('Sandbox');
           Integer i;
		  list<Contact> Con = [SELECT a.Name from Contact a where a.Account.Name='Sandbox']; 
		   list<String> cname1=new list<String>();
		  for(i=0;i<Con.size();i++)
          {
           cname1.add(Con.get(i).Name);
          }
		  system.assertEquals(cname,cname1);
		  
		  string aname=dc.Question2('swapnil sharma');
		  
		  Contact c1=[Select c1.Account.Name From Contact c1 where c1.Name='swapnil sharma'];
		  
		  system.assertEquals(aname, c1.Account.Name);
		  
		  String result=dc.Question3_1(25);
		  
		  system.assertEquals(result,'odd');
		  
		  List<Integer>fib =new list<integer>();
		  
		  fib=dc.Question3_2(5);
		  system.assertEquals(0, fib.get(0));
		  system.assertEquals(1, fib.get(1));
		  system.assertEquals(1, fib.get(2));
		  system.assertEquals(2, fib.get(3));
		  system.assertEquals(3, fib.get(4));
		  
		  Account accUpdate = new Account(Name='AupdateAcc');
		  accUpdate.Phone = '9405791062';
		  accUpdate.Email__c = 'Sales@123.com';
		  insert accUpdate;
		  
		  Contact cntNew = new Contact();
		  cntNew.FirstName='abc';
		  cntNew.LastName = 'dond';
		  cntNew.AccountId = accUpdate.id;
		  insert cntNew;
		  
		  dc.Question4('AupdateAcc');
		  
		  Contact c=[SELECT c.LastName FROM Contact c WHERE c.FirstName='abc'];
		  
		  system.assertEquals(c.LastName,'Patil');
		  
		  list<String> anames=new list<String>();
		  anames=dc.Question7();
		  LIST<Account> a=[select a.Name,a.AccountNumber from Account a where a.Name like 'A%'];
		  list<String> anames1=new list<String>();
		 
		  for(i=0;i<a.size();i++)
		  {
		     anames1.add(a.get(i).Name);
		  }
		   system.assertEquals(anames,anames1);
		   
		   dc.Question8('sfx', 'amruta', 'kasar');
		   Account a1=[Select Id from Account Where Name='sfx'];
		   Contact cnt=[Select FirstName from Contact where AccountId= :a1.Id];
		   
		   system.assertEquals(cnt.FirstName,'amruta');
		   
		   list<Account> sortnames=new list<Account>();
		   sortnames=dc.Question9();
		   List<Account> lstSort = [SELECT a.Name FROM Account a ORDER BY a.Name ASC];
		   
		   for(i=0;i<sortnames.size();i++){
		  	system.assertEquals(sortnames.get(i), lstSort.get(i));
		  }
		   
		   list<String> clnames=new list<String>();
		   
		   clnames=dc.Question10('AupdateAcc');
		   
		   list<Contact> clist=[Select  LastName from Contact Where AccountId= :accUpdate.id];
		   
		   list<String> clnames1=new list<String>();
		   for(i=0;i<clist.size();i++)
		   {
		      clnames1.add(clist.get(i).LastName);
		   }
		   system.assertEquals(clnames, clnames1);
		   
		  test.stoptest();
  }
}