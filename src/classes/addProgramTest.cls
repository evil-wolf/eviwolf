/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 статичные 
 */
@isTest
private class addProgramTest {

    static testMethod void addProgramHaveAllValues() {
        PageReference pageRef = Page.addProgram;
        Test.setCurrentPage(pageRef);
        List <Calendar__c> calendars = new List <Calendar__c>();
        for(Integer i = 0; i < 10; i++){
            Calendar__c calendar = new Calendar__c(Name = 'test' + i, Date__c = Date.today().addDays(i));
            calendars.add(calendar);
            
        }
        insert calendars;
        
        Profile p = [select id from Profile where name='Chatter Free User'];
        
        User user = new User(alias = 'utest1', email='test@test.com',
                         emailencodingkey='UTF-8', firstName='First1', lastname='Last1', languagelocalekey='en_US',
                         localesidkey='en_US', profileid = p.id,
                         timezonesidkey='Europe/London', username='utest1.test@test.com');
        
        insert user;
        
        ApexPages.currentPage().getParameters().put('userId', user.firstName + ' ' + user.lastname);
        ApexPages.currentPage().getParameters().put('dateId',calendars[0].Name);
        
        List <Program__c> programs = new List <Program__c>();
        for(Integer i = 0; i < 10; i++){
            Program__c program = new Program__c(Name = 'test' + i, Calendar_id__c = calendars[i].id, user_id__c = user.id);
            programs.add(program);
            
        }
        insert programs;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(programs[0]);
        AddProgram controller = new AddProgram(sc);
        system.assertEquals('test0',programs[0].Name);
        system.assertEquals('Unit1235.Test@unittest.com',user.username);
        system.assertEquals('test0', calendars[0].Name);
        Test.startTest();
        controller.save();
        controller.saveAndNew();
        controller.back();
        
    }
    
    static testMethod void addProgramHaveNotAllValues() {
        
        List <Calendar__c> calendars = new List <Calendar__c>();
        for(Integer i = 0; i < 10; i++){
            Calendar__c calendar = new Calendar__c(Name = 'test' + i, Date__c = Date.today().addDays(i));
            calendars.add(calendar);
            
        }
        insert calendars;
        
        Profile p = [select id from Profile where name='Chatter Free User'];
        
         User user = new User(alias = 'utest1', email='Unit.Test@unittest.com',
                         emailencodingkey='UTF-8', firstName='First1', lastname='Last1', languagelocalekey='en_US',
                         localesidkey='en_US', profileid = p.id,
                         timezonesidkey='Europe/London', username='Unit1235.Test@unittest.com');
        
        insert user;
        
        ApexPages.currentPage().getParameters().put('userId', user.firstName + ' ' + user.lastname);
        ApexPages.currentPage().getParameters().put('dateId',calendars[0].Name);
        
        List <Program__c> programs = new List <Program__c>();
        for(Integer i = 0; i < 10; i++){
            Program__c program = new Program__c(Name = 'test' + i,user_id__c = user.id);
            programs.add(program);
            
        }
        insert programs;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(programs[0]);
        
        system.assertEquals('test0',programs[0].Name);
        system.assertEquals('Unit1235.Test@unittest.com',user.username);
        system.assertEquals('test0', calendars[0].Name);
        
        AddProgram controller = new AddProgram(sc);
        PageReference pageRef = Page.addProgram;
        Test.setCurrentPage(pageRef);
        system.assert(pageRef.getUrl() == '/apex/AddProgram');
        /*PageReference pageRefer = controller.linkIsClickedAction();
        system.assertEquals(null,pageRefer);*/
        Test.startTest();
        controller.save();
        controller.saveAndNew();
        controller.back();
        
    }
}