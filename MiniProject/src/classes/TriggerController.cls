public with sharing class TriggerController {
 public boolean isChecked {get;set;}
 
 public TriggerController(ApexPages.StandardController controller){
 }
 
 public void executeAction(){
  TriggerHandler__c settingVal = TriggerHandler__c.getValues(userInfo.getUserID());
  settingVal.DisableTrigger__c = isChecked;
  
  update settingVal;
 }
}