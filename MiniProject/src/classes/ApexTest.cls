@isTest
public class ApexTest {
	static testmethod void testAccountTask(){
		
		Account accNew = new Account(Name='abc');
		accNew.Phone = '9405791062';
		accNew.Email__c = 'teju.chavan43@gmail.com';
		insert accNew;
		
		try{
			Contact cntNew = new Contact(FirstName='abc');
			cntNew.LastName = 'dakljd';
			cntNew.Phone = '654321854';
			cntNew.Email = 'teju.chavan43@gmail.com';
			cntNew.AccountId = accNew.id;
			insert cntNew;
			
			cntNew = new Contact(FirstName='abc');
			cntNew.LastName = 'dakljd';
			cntNew.Phone = '6543218544';
			cntNew.Email = 'teju.chavan43@gmail.com';
			cntNew.AccountId = accNew.id;
			insert cntNew;
		}
		catch(DMLException ex){
			System.debug('An error has occured, contact the admin');
		}
		
		try{	
			Contact cntNew = new Contact(FirstName='abc');
			cntNew = new Contact(FirstName='abc');
			cntNew.LastName = 'dakljd';
			cntNew.Phone = '654321854';
			cntNew.Email = 'teju.chavan43@gmail.com';
			cntNew.AccountId = accNew.id;
			insert cntNew;
		}
		catch(DMLException ex){
			System.debug('An error has occured, contact the admin');
		}
		
		Campaign newCampaign = new Campaign(Name='Dummy Campaign');
		insert newCampaign;
		
		Lead newLead = new Lead(LastName='Joshi',Status='Open - Not Contacted', RSVP__c = 'Hello', Company = 'SyntaxSofts Inc.');
		insert newLead;
		
		CampaignMember cm = new CampaignMember(CampaignId = newCampaign.Id, LeadId = newLead.Id);
		insert cm;
		
		test.startTest();
		
		List<Account>lstNewAcc = new List<Account>();
		List<Contact>lstNewCont = new List<Contact>();
		
		for(Integer i=0;i<195;i++){
			Account acc = new Account(Name='abc' + String.valueOf(i));
			acc.Phone = '7507816023';
			acc.Email__c = 'teju.chavan43@gmail.com';
			lstNewAcc.add(acc);
			
			Contact cnt = new Contact(FirstName='abc' + String.valueOf(i));
			cnt.LastName = 'dakljd' + String.valueOf(i);
			cnt.Phone = String.valueOf(i+100);
			cnt.Email = 'teju.chavan43@gmail.com' + String.valueOf(i);
			cnt.AccountId = acc.Id;
			lstNewCont.add(cnt);
		}
		insert lstNewCont;
		insert lstNewAcc;
		
		List<Account>lstInsert = [SELECT a.Name FROM Account a];
		List<Task>lstTask = [SELECT t.Subject FROM Task t];
		system.assertEquals(lstInsert.size(), lstTask.size());
		
		test.stopTest();
	}
}