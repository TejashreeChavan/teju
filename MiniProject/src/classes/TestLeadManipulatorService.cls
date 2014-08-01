@isTest
public with sharing class TestLeadManipulatorService {

   static testMethod void testcreatelead() 
   {
   	 Test.startTest();
     RestRequest req = new RestRequest(); 
     RestResponse res = new RestResponse();
     
     req.requestURI='https:/ap1.salesforce.com/services/apexrest/LeadWebService';
     
     req.httpMethod = 'POST';
    
     RestContext.request = req;
     RestContext.response = res;
     
    LeadRESTResource.MyUserDefinedClass cls=new LeadRESTResource.MyUserDefinedClass();
    cls=LeadRESTResource.createlead('mayur','parashare','mayur@gmail.com','232323','ESPL');
     
     Lead l=[Select Id from Lead Where FirstName='mayur' And LastName='parashare'];
     
     System.assertEquals(true, cls.isSuccess);
     System.assertEquals('Success', cls.status);
     System.assertEquals(l.Id, cls.lead);
     
     req.httpMethod = 'PUT';
     
 
     LeadRESTResource.MyUserDefinedClass cls1=new LeadRESTResource.MyUserDefinedClass();
     cls1=LeadRESTResource.doupdate('mayur','parashare','mayur.paro@gmail.com','6666666');
    
     String lid;
     Lead l1=[Select Id from Lead Where FirstName='mayur' And LastName='parashare'];
     lid=l1.Id;
     System.assertEquals(true, cls1.isSuccess);
     System.assertEquals(l1.Id, cls1.lead);
     System.assertEquals('Success', cls1.status);
     
     req.httpMethod = 'DELETE';
     
     req.addParameter('fname','mayur');
     req.addParameter('lname','parashare');
     req.addParameter('lemail','mayur.paro@gmail.com');
     req.addParameter('lphone','6666666');
     
     LeadRESTResource.MyUserDefinedClass cls2=new LeadRESTResource.MyUserDefinedClass();
     cls2=LeadRESTResource.doDelete();
     
      System.assertEquals(true, cls2.isSuccess);
     System.assertEquals('Success', cls2.status);
     System.assertEquals(lid,cls2.lead);
      
     Test.stopTest();
   }
    
  }