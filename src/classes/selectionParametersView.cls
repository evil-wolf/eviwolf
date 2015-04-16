public with sharing class selectionParametersView{
	//my commits
	public String userSelect ;
    public String dateSelect ;

	public List<Program__c> listPrograms { get; set; }
	
	public selectionParametersView(){
		
		userSelect = ApexPages.currentPage().getParameters().get('userId');
		dateSelect = ApexPages.currentPage().getParameters().get('dateId');
		
        List<Calendar__c> dateCalendar = new List<Calendar__c>();
        List<User> user = new List<User>();
        string myData;
        string myData2;
        if(dateSelect == 'All' && userSelect == 'All'){
            listPrograms = [SELECT Name, user_id__c, Calendar_id__c, Description__c FROM Program__c LIMIT 1000];
        }else if(dateSelect != 'All' && userSelect == 'All'){
        
            listPrograms = [SELECT Name, user_id__c, Calendar_id__c, Description__c FROM Program__c WHERE Calendar_id__c =: dateSelect LIMIT 1000];
            
        }else if(dateSelect  == 'All' && userSelect != 'All'){
            
            listPrograms = [SELECT Name, user_id__c, Calendar_id__c, Description__c FROM Program__c WHERE user_id__c =: userSelect LIMIT 1000];
            
        }else{
             listPrograms = [SELECT Name, user_id__c, Calendar_id__c, Description__c FROM Program__c WHERE user_id__c =: userSelect AND Calendar_id__c =: dateSelect LIMIT 1000];
        }
	}
	
	public PageReference back() {
        return Page.ViewPrograms;
    }
    
    public PageReference addPrograms() {
        PageReference newPage;
        newPage = Page.addProgram;
        newPage.getParameters().put('PageBack', 'selectionParametersView');
        newPage.getParameters().put('userId', userSelect);
        newPage.getParameters().put('dateId', dateSelect);
        return newPage.setredirect(true);
    }
}