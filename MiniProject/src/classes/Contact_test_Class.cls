@isTest
public with sharing class Contact_test_Class {

        static testMethod void ContactBulkRecordTestMethod()
        {
          List<Contact> contact1 = new List<Contact>();
         /* Contact a1 = new Contact(LastName = 'Account3');
          insert a1;*/
          for(Integer i = 0; i <200; i++)
          {
               Contact a = new Contact(LastName = 'xxxxxx'+i);
               contact1.add(a);
              }
              Test.startTest();
              insert contact1;
              Test.stopTest();
              List<Contact> insertedContacts = [SELECT Name FROM Contact WHERE Id IN :contact1];
              system.assertEquals(insertedContacts.size(),200);
        }
        
        static testMethod void TaskCreationTestMethod()
        {
           List<Account> acc =new List<Account>();
           
           Account a=new Account(Name='deve');
           insert a;
           
           for(Integer i=0;i<99;i++)
           {
             Account a1 = new Account(Name ='sanbox'+i);
             acc.add(a1);
           }
           Test.startTest();
           insert acc;
           Test.stopTest();
           List<Account> InsertedAccount = [select Name from Account where Id IN :acc ];
           system.assertEquals(InsertedAccount.size(),99);
        }
        
         static testMethod void myUnitTest() {
        
        
        Lead l = new Lead();
        l.LastName = 'Last nm';
        l.Company = 'xyz';
        l.LeadSource = 'Open - Not Contacted';
        l.RSVP__c ='rsvp data';
        insert l;
        
        Campaign c = new Campaign();
        c.Name = 'new Camp';
        insert c;
        CampaignMember cmm = new CampaignMember();
        cmm.LeadId = l.Id;
        cmm.Status = 'Open';
        cmm.CampaignId = c.Id;
        insert cmm;
        
        
    }
}