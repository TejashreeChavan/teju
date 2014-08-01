@isTest
public with sharing class AccountContactInlinePageTestClass {

 public static testmethod void testInline(){
  
  Account accNew = new Account(Name='Nikhil');
  accNew.Phone = '9405791062';
  accNew.Email__c = 'Niks@123.com';
  insert accNew;
    
  Contact cntNew = new Contact();
  cntNew.FirstName='Tejashree';
  cntNew.LastName = 'Chavan';
  cntNew.Email = 'teju.chavan@gmail.com';
  cntNew.Phone = '123567';
  cntNew.AccountId = accNew.id;
  insert cntNew;
  
  Pagereference pgref = Page.accountContact1;
  test.setCurrentPage(pgref);
  
  Apexpages.Standardcontroller sc = new Apexpages.Standardcontroller(accNew);
  
 RelatedContacts obj = new RelatedContacts(sc);
  
  system.assertEquals('Tejashree',obj.lstWrapper.get(0).cName );
  
  obj.lstWrapper.get(0).cName  = 'XyzUpdate';
  obj.lstWrapper.get(0).email  = 'XYZUpdate@update.com';
  obj.lstWrapper.get(0).cPhone  = '2596422';
  
  obj.updateContact();
  
  List<Contact> cUp = [SELECT Name, FirstName FROM Contact WHERE Email = 'XYZUpdate@update.com'];
  system.assertEquals(1, cUp.size());
   
 } 
 
}