@isTest
public with sharing class QueryBuilderTestClass 
{
   static testMethod void testquerybuilder()
   {
      String qrystr='SELECT Name, Email,Status FROM Lead ORDER BY Name ASC LIMIT 500';
      
      Pagereference pageref = Page.QueryBuilderpage;
		Test.setCurrentPage(pageref);
		
		Test.startTest();
		QueryBuilderController obj=new QueryBuilderController();
		
		List<Selectoption> allsobj=new List<Selectoption>();
		
		
		allsobj=obj.getAllObjectsList();
		obj.selectedObject=allsobj.get(118).getValue();
		
		obj.selectedObject='Lead';
		
		List<SelectOption> sobjFields=new List<SelectOption>();
		
		
		
		sobjFields=obj.getallFields();
		
	
		
	    obj.queryFields.add(sobjFields.get(46));
	    obj.queryFields.add(sobjFields.get(18));
	    obj.queryFields.add(sobjFields.get(60));
		 
		 obj.sortOrder=obj.getlstSortOrder().get(0).getValue();
		 obj.noRecords=obj.getlstRecordNumbers().get(0).getValue(); 
		 
		 obj.showQuery();
		 
		 System.assertEquals(obj.queryString, qrystr);
		 obj.exeuteqry();
		 Test.stopTest();
   } 
}