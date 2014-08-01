@isTest
public with sharing class TestAccountClone {

	public static testmethod void testClone(){
		
		Account acc = new Account();
		acc.Name = 'new account';
		acc.Phone = '123456';
		acc.Email__c = '123@123.com';
		insert acc;
		
		Set<String> lstFields = new Set<String>{'name','phone','Email__c'};
		
		Pagereference pgref = Page.AccountClone;
		Test.setCurrentPage(pgref);
		ApexPages.StandardController sc = new ApexPages.standardController(acc);
		
		Apexpages.currentpage().getParameters().put('Id',acc.Id);
		
		Map<String,Schema.SObjectField> myObjectFields = Account.SObjectType.getDescribe().fields.getMap();
    	Set<String> myObjectFieldAPINames = myObjectFields.keyset();
		
		cloneAccount obj = new cloneAccount(sc);
		
		Integer fCount = 0;
		for(String fName:myObjectFieldAPINames){
			if(lstFields.contains(obj.wrapperLst.get(fCount).str)){
				//system.assert(false, obj.wrapperLst.get(fCount).str);
				obj.wrapperLst.get(fCount).flag=true;
			}
			fCount++;
		}
		
		obj.saveAccount();
		
		List<Account> lstAccount = [SELECT Id FROM Account WHERE Phone='123456'];
		system.assertEquals(lstAccount.size(), 2);
	}

}