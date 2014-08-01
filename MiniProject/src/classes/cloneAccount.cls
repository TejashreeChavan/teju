public with sharing class cloneAccount {
    
    public class wrapper{
     public boolean flag{get;set;}
     public String str{get;set;}
     public wrapper(String pStr){
      flag=false;
      str = pStr;
     }
    }
    private Id mId;
    
    public List<wrapper> wrapperLst {get;set;}
    
    private Account acc = new Account();
    private Map<String,Schema.SObjectField> myObjectFields = Account.SObjectType.getDescribe().fields.getMap();
    private Set<String> myObjectFieldAPINames = myObjectFields.keyset();
    private Account acOld;
    
    public cloneAccount(ApexPages.StandardController stdCtrl){
        this.acc = (Account)stdCtrl.getRecord();     
        mId = this.acc.Id;       
     Integer temp = 1;
     
     String queryStr = 'SELECT ';
        for(String fName:myObjectFieldAPINames){
         if(temp!=1){
          if(fName != 'BillingAddress')
           if(fName != 'ShippingAddress')
            queryStr = queryStr + ', ' + fName;
         }
         else{
          queryStr = queryStr + fName;
         }
         temp++;
        }
        
        queryStr = queryStr + ' FROM Account WHERE Id = \'' + mId + '\'';
        
        acOld = database.query(queryStr);
  wrapperLst  = new List<wrapper>();
  for(String fName:myObjectFieldAPINames){
   wrapperLst.add(new Wrapper(fName));
   
  } 
    }
    
    public void saveAccount(){
     
     Account acNew = new Account();
     
     for(wrapper w:wrapperLst){
      if(w.flag == true){
       acNew.put(w.str,acOld.get(w.str));
      }
     }
     insert acNew;
    }
}