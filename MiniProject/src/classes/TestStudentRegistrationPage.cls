@isTest
public with sharing class TestStudentRegistrationPage {

	static testmethod void testStudent(){
		
		Student__c st=new Student__c();
		st.Student_Name__c='nikhil Chavan';
		st.Roll_number__c=123;
		st.Gender__c='Male';
		st.Course_Applying_for__c='B.E';
		st.H_S_C__c=80;
		st.S_S_C__c=90;
		st.Country__c='India';
		st.State__c='Maharashtra';
		st.City__c='nashik';
		
		
		
		Pagereference pageref = Page.StudentRegistrationForm;
		test.setCurrentPage(pageref);
		Apexpages.Standardcontroller ac = new Apexpages.Standardcontroller(st);
		
		StudentDetails obj = new StudentDetails(ac);
		obj.submit();
		
		Student__c st1=new Student__c();
		st.Student_Name__c=null;
		st.Roll_number__c=0;
		st.Gender__c=null;
		st.Course_Applying_for__c=null;
		st.H_S_C__c=80;
		st.S_S_C__c=90;
		st.Country__c=null;
		st.State__c=null;
		st.City__c=null;
		
		
		Apexpages.Standardcontroller ac1 = new Apexpages.Standardcontroller(st1);
		
		StudentDetails obj1 = new StudentDetails(ac1);
		obj1.submit();
		
		obj.selectedLang = 'French';
		
		obj.changeLanguage();
		
		User usr = [SELECT Id, LanguageLocaleKey FROM User WHERE Id=:UserInfo.getUserId()];
		System.assertEquals('fr', usr.LanguageLocaleKey);
		
		obj.selectedLang = 'Spanish';
		
		obj.changeLanguage();
		
		usr = [SELECT Id, LanguageLocaleKey FROM User WHERE Id=:UserInfo.getUserId()];
		System.assertEquals('es', usr.LanguageLocaleKey);
		
		obj.selectedLang = 'English';
		
		obj.changeLanguage();
		
		usr = [SELECT Id, LanguageLocaleKey FROM User WHERE Id=:UserInfo.getUserId()];
		System.assertEquals('en_US', usr.LanguageLocaleKey);
		
	}
	
}