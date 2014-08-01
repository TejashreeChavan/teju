public with sharing class TaskCreationHandler {

public void OnAfterInsert(List<Account> a)
{
	list<Task> tsk=new list<Task>();
   for (Account a1 : a)
   {
     Task t2= new task(OwnerId = a1.ownerid,Subject = 'Meeting with '+a1.Name,ActivityDate = system.today(),WhatId = a1.id,Status = 'Not Started');
     tsk.add(t2);
   }
   insert tsk;
}
}