public with sharing class searchPage {
 
 public searchPage(){
  
 }
 
 public string selectedOption {get;set;}
 public string searchKey {get;set;}
 public List<List<Sobject>>lstResults {get;set;}
 private List<SObject>lstFinal;
 public List<SObject>lstSearch {get;set;}
 public string objectType {get;set;}
   
 public void searchInit(){
  lstResults = new List<List<Sobject>>();
  String queryStr = 'find \'' + searchKey + '\' IN ALL FIELDS returning ' + selectedOption;
  
  lstResults = search.query(queryStr); 
  lstFinal = lstResults.get(0);
  
  Set<Id> resultIds = (new Map<Id,SObject>(lstFinal)).keySet();
  system.debug(resultIDs);
  
  lstSearch = new List<SObject>();
  String querySt = 'SELECT a.Name FROM ' + selectedOption + ' a WHERE a.Id IN :resultIDs';
  lstSearch = database.query(querySt);
 }
}