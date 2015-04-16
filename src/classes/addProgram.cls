public class addProgram{
    //my commits
    public Program__c program {get; private set;}
    
    public addProgram(ApexPages.StandardController controller) {
        this.controller = controller;
        program = (Program__c) controller.getRecord();
    }
    
    public PageReference back() {
    	String pageBack = ApexPages.currentPage().getParameters().get('PageBack');
    	if(pageBack == 'selectionParametersView'){
	        PageReference newPage;
	        newPage = Page.selectionParametersView;
	        newPage.getParameters().put('userId', ApexPages.currentPage().getParameters().get('userId'));
	        newPage.getParameters().put('dateId', ApexPages.currentPage().getParameters().get('dateId'));
    		return newPage.setRedirect(true);
    	}else {
    		return Page.ViewPrograms.setRedirect(true);
    	}
    }
    
    public PageReference save() {
    	if(program.name!=null && program.Calendar_id__c!=null && program.user_id__c!=null){
	    	controller.save();
	        return Page.ViewPrograms.setRedirect(true);
        }else{
        	ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.WARNING, 'Enter Name & Calendar & User'));
            return null;
        }
    }
    
    public PageReference saveAndNew() {
        if(program.name!=null && program.Calendar_id__c!=null && program.user_id__c!=null){
            controller.save();
            return Page.addProgram.setRedirect(true);
        }else{
        	ApexPages.addmessage(new ApexPages.message(ApexPages.Severity.WARNING, 'Enter Name & Calendar & User'));
        	//ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.WARNING, 'Enter Name & Date & User');
            return null;
        }
    }
    
    private final ApexPages.StandardController controller;
}