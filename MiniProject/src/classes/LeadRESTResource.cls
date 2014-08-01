@RestResource(urlMapping='/LeadWebService/*')
global with sharing class LeadRESTResource {

global class MyUserDefinedClass 
{	
		global boolean isSuccess{get;set;}
		global String lead{get;set;}
		global String status{get;set;}
}



@HttpPost
global static MyUserDefinedClass createlead(String firstName,String lastName,String email,String phone,String cmny)
 {
 	MyUserDefinedClass cls=new MyUserDefinedClass();
	Lead l=new Lead();
	l.FirstName=firstName;
	l.LastName=lastName;
	l.Email=email;
	l.Phone=phone;
    l.Company=cmny;
    
    database.saveResult dbres = database.insert(l);
    if(dbres.isSuccess()==true)
    {
      cls.isSuccess=true;
      Lead l1=[Select id from Lead where FirstName= :firstName];
      cls.lead=l1.Id;
      cls.status='Success';
    }
    else
    {
       cls.isSuccess=false;
        cls.status='fail';
    }
    
    return cls;
 }
 

@HttpPut
 global static MyUserDefinedClass doupdate(String fname,String lname,String newemail,String newphone) 
 {
   Lead l=[Select Id,Email,Phone from Lead Where FirstName= :fname And LastName= :lname];
   
   MyUserDefinedClass cls=new MyUserDefinedClass();
   
      l.Email=newemail;
      l.Phone=newphone;
  
   database.saveResult dbres = database.update(l);
   if(dbres.isSuccess()==true)
   {
     cls.isSuccess=true;
     cls.lead=l.Id;
     cls.status='Success';
   }
   else
   {
       cls.isSuccess=false;
       cls.status='fail';
   }
   return cls;
 }
 
  @HttpDelete
 global static MyUserDefinedClass doDelete() 
 {
 	MyUserDefinedClass cls=new MyUserDefinedClass();
	RestRequest req = RestContext.request;
	RestResponse res = RestContext.response;
	String fname=req.params.get('fname');
	String lname=req.params.get('lname');
	String email=req.params.get('lemail');
	String phone=req.params.get('lphone');
	Lead l = [SELECT Id FROM Lead WHERE FirstName = :fname And LastName =:lname And Email =:email And Phone =:phone];

     String lid=l.Id;
     
    Database.DeleteResult DR_Dels = database.delete(l);
    if(DR_Dels.isSuccess()==true)
    {
     cls.isSuccess=true;
     cls.lead=lid;
     cls.status='Success';
    }
    else
    {
       cls.isSuccess=false;
        cls.status='fail';
    }
    return cls;
 }
 
}