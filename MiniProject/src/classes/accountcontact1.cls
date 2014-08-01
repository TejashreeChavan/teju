public class accountcontact1
{
    list<AccountWrapper> wraplist=new list<AccountWrapper>();
    List<Contact> cnctlist=new List<Contact>();
    public List<AccountWrapper> lstWrapper {get;set;}
    public Account acc;
    public ID mId;
    
    public accountcontact1()
    {
       Map<Id, AccountWrapper> accMap=new Map<Id, AccountWrapper>();
       
       ID idVal = ApexPages.currentPage().getParameters().get('id'); 
       cnctlist =[SELECT c.Name,c.Phone,c.Email FROM Contact c WHERE AccountId= :idVal ];
        lstWrapper = new List<AccountWrapper>();
        for(Contact cnt:cnctlist )
        {
          lstWrapper.add(new AccountWrapper(cnt.FirstName,cnt.Phone,cnt.Email,cnt.Id));
        }
        
       for(account a:[SELECT createdby.name,CreatedbyID,Account.Name,(SELECT      
                name,Contact.FirstName, Contact.LastName,Contact.Phone,Contact.Email 
                FROM Account.Contacts) FROM Account WHERE Account.Id= :idVal ])
       {
        AccountWrapper accWrap=accMap.get(a.CreatedByid);  
          // AccountWrapper accWrap=accMap.get(a.CreatedBy.name);
           if (null==accWrap)
           {
              accWrap=new AccountWrapper();
              accMap.put(a.CreatedByid, accWrap);
              accWrap.userid=a.CreatedByid;
           
             // accMap.put(a.CreatedBy.name, accWrap);
              accWrap.username=a.CreatedBy.name;
           }
           accWrap.accounts.add(a);
           
       }
       wrapList=accMap.values();
   }
   public list<AccountWrapper> getaccounts()
   {
      return wraplist;
   }
   public class AccountWrapper
   {
      public id userid {get; set;} 
      public string username {get; set;}
      public List<Account> accounts {get; set;}
      public String cName {get;set;}
      public String cPhone {get;set;}
      public String email {get;set;}
      public Id cntId {get;set;}
      public AccountWrapper(String name,String phone,String cemail,Id cid)
      {
         cName=name;
         cPhone =phone;
         email=cemail;
         cntId =cid;
         
      }
      public AccountWrapper()
      {
         accounts=new List<Account>();
      }
   }
   
     
      public pageReference saveAccount()
      {
        try
        {   
          
              List<Contact>lstNew = new List<Contact>();
  
            for(AccountWrapper iter:lstWrapper){
             Contact conNew = new Contact(Id=iter.cntId);
            conNew.Email = iter.email;
             conNew.Phone = iter.cPhone;
              lstNew.add(conNew);
              }
            system.debug(lstNew);
            update lstNew;
            return null;
        }
        catch (DMLException ex)
        {
           ApexPages.Message msg = new ApexPages.Message(Apexpages.Severity.ERROR, ex.getdmlMessage(0));
           ApexPages.addMessage(msg);
            return null;
        }
   }
}