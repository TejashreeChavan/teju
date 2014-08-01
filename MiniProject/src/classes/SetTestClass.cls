@isTest
public with sharing class SetTestClass {


	public static testmethod void testSet(){
		
		SetAssignment obj = new SetAssignment();
		obj.getIntersection();
		
		for(Integer intg:obj.intersection){
			System.assertEquals(4, intg);
		}
		
		system.assertEquals(1, obj.difference.size());
	}

}