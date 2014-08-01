@isTest
public with sharing class PictureGallaryTestClass {

 public static testmethod void DoPictureFunctionality()
 {
  Account Acc = new Account();
  Acc.Name = 'Test Gallery Account';
  Acc.AccountNumber = '101';
  insert Acc;
  
  Attachment Atch = new Attachment();
  Atch.Name = 'Img1';
  Atch.Body = Blob.valueOf('Img1');
  Atch.ParentId =Acc.Id;
  insert Atch;
  
  Attachment Atch1 = new Attachment();
  Atch1.Name = 'Img2';
  Atch1.Body = Blob.valueOf('Img2');
  Atch1.ParentId =Acc.Id;
  insert Atch1;
 
 
  Attachment Atch2 = new Attachment();
  Atch2.Name = 'Img3';
  Atch2.Body = Blob.valueOf('Img3');
  Atch2.ParentId =Acc.Id;
  insert Atch2;
 
  Pagereference Ref = page.PictureGalleryFunctionality;
  Test.setCurrentPage(Ref);
  ApexPages.StandardController sc = new ApexPages.standardController(Acc);
  
  PictureGallary  imgwrp = new  PictureGallary(sc);
  imgwrp.piclist.get(0).flag=true;
  imgwrp.Emails = 'teju.chavan43@gmail.com'; 
  imgwrp.sendEmail();
  
  imgwrp.Emails = ''; 
  imgwrp.sendEmail();
  
  list <Attachment> lstatch = new list<Attachment>();
  lstatch = [Select a.Name, a.Id From Attachment a Where a.ParentId = :Acc.Id];
  system.assertEquals(3, lstatch.size());
  }
}