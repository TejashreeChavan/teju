@isTest

public with sharing class TestClass1 {


static testmethod void testAccountTask(){

try{
Contact cntNew = new Contact(FirstName='abc');
cntNew.LastName = 'dakljd';
cntNew.Phone = '654321854';
cntNew.Email = 'saket.joshi92@gmail.com';
insert cntNew;

cntNew = new Contact(FirstName='abc');
cntNew.LastName = 'dakljd';
cntNew.Phone = '6543218544';
cntNew.Email = 'saket.joshi92@gmail.com';
insert cntNew;

cntNew = new Contact(FirstName='abc');
cntNew.LastName = 'dakljd';
cntNew.Phone = '654321854';
cntNew.Email = 'saket.joshi921@gmail.com';
insert cntNew;
}
catch(DMLException ex){
System.debug('An error has occured, contact the admin');
}

test.startTest();

List<Account>lstNewAcc = new List<Account>();
List<Contact>lstNewCont = new List<Contact>();
for(Integer i=0;i<199;i++){
Contact cnt = new Contact(FirstName='abc' + String.valueOf(i));
cnt.LastName = 'dakljd' + String.valueOf(i);
cnt.Phone = String.valueOf(i+100);
cnt.Email = 'saket.joshi92@gmail.com' + String.valueOf(i);
lstNewCont.add(cnt);

Account acc = new Account(Name='abc' + String.valueOf(i));
lstNewAcc.add(acc);
}
insert lstNewCont;
insert lstNewAcc;

List<Account>lstInsert = [SELECT a.Name FROM Account a];
List<Task>lstTask = [SELECT t.Subject FROM Task t];
system.assertEquals(lstInsert.size(), lstTask.size());

test.stopTest();
}
}