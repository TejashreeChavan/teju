@istest
public with sharing class County_City_CustomSettingTestClass {

public static testmethod void DoCustomSettings()
	{
		Country__c ctr =  new Country__c(Name = 'India');
		insert ctr;
		insert new Country__c(Name = 'US');
		insert new Country__c(Name = 'UK');
		insert new Country__c(Name = 'France');
		
		
		insert new City__c(Name = 'Pune',Country__C='India');
		insert new City__c(Name = 'Mumbai',Country__C='India');
		insert new City__c(Name = 'Kolkata',Country__C='India');
		insert new City__c(Name = 'WC',Country__C='US');
		insert new City__c(Name = 'Colarido',Country__C='US');
		insert new City__c(Name = 'Lords',Country__C='UK');
		
		
		Pagereference Ref = page.CountryCityDependentPicklistPage;
		test.setCurrentPage(Ref);
		Apexpages.Standardcontroller ac = new Apexpages.Standardcontroller(ctr);
		
		
		CountryCityPicker  C = new CountryCityPicker();
		C.country ='India';
		list<Selectoption> str = C.getCitySelectList();
		system.assertEquals(str.size(), 4);
			C.getCountriesSelectList();
		
		C.country ='US';
		list<Selectoption> str1 = C.getCitySelectList();
		system.assertEquals(str1.size(), 3);
		
		C.country ='UK';
		list<Selectoption> str2 = C.getCitySelectList();
		system.assertEquals(str2.size(), 2);
		
		C.country ='France';
		list<Selectoption> str3 = C.getCitySelectList();
		system.assertEquals(str3.size(), 1);
		
	}

}