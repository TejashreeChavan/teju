public with sharing class RelatedContacts {

 private Id recordID;
 public List<Contact>lstContact {get;set;}
 
 public class wrapper{
  public String cName {get;set;}
  public String cPhone {get;set;}
  public String email {get;set;}
  public Id cntId {get;set;}
  
  public wrapper(String name, String phone, String mail, Id id){
   cName = name;
   cPhone = phone;
   email = mail;
   cntId = id;
  }
 }
 
 public List<wrapper> lstWrapper {get;set;}
  
 public RelatedContacts(ApexPages.StandardController stdCtrl){
  recordID = stdCtrl.getId();
  lstContact = [SELECT c.FirstName, c.Email, c.Phone FROM Contact c WHERE c.AccountId = :recordID];
  
  lstWrapper = new List<Wrapper>();
  
  for(Contact cnt:lstContact){
   lstWrapper.add(new wrapper(cnt.FirstName,cnt.Phone,cnt.Email,cnt.Id));
  }
 }
 
 public void updateContact(){
  List<Contact>lstNew = new List<Contact>();
  
  for(wrapper iter:lstWrapper){
   Contact conNew = new Contact(Id=iter.cntId);
   conNew.Email = iter.email;
   conNew.Phone = iter.cPhone;
   lstNew.add(conNew);
  }
  system.debug(lstNew);
  update lstNew;
 }
 
}