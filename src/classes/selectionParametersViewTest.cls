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
 */
@isTest
private class selectionParametersViewTest {

    static testMethod void getUserIdValueAllAndCalendarIdValueAll() {
        PageReference pageRef = Page.selectionParametersView;
        Test.setCurrentPage(pageRef);
        
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
                         timezonesidkey='Europe/London', username='Unit1239.Test@unittest.com');
        
        insert user;
        
        List <Program__c> programs = new List <Program__c>();
        for(Integer i = 0; i < 10; i++){
            Program__c program = new Program__c(Name = 'test' + i, Calendar_id__c = calendars[i].id, user_id__c = user.id);
            programs.add(program);
            
        }
        insert programs;
        
        ApexPages.currentPage().getParameters().put('userId','All');
        ApexPages.currentPage().getParameters().put('dateId','All');
        
        selectionParametersView controller = new selectionParametersView();
        system.assertEquals('All',controller.userSelect);
        system.assertEquals('All', controller.dateSelect);
        Test.StartTest();
        //System.assertEquals();
    }
    
    static testMethod void getUserIdValueAndCalendarIdValueAll() {
        
        PageReference pageRef = Page.selectionParametersView;
        Test.setCurrentPage(pageRef);

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
                         timezonesidkey='Europe/London', username='Unit1239.Test@unittest.com');
        
        insert user;
        
        List <Program__c> programs = new List <Program__c>();
        for(Integer i = 0; i < 10; i++){
            Program__c program = new Program__c(Name = 'test' + i, Calendar_id__c = calendars[i].id, user_id__c = user.id);
            programs.add(program);
            
        }
        insert programs;
        
        ApexPages.currentPage().getParameters().put('userId', user.id);
        ApexPages.currentPage().getParameters().put('dateId','All');
        
        selectionParametersView controller = new selectionParametersView();
        system.assertEquals(user.id,controller.userSelect);
        system.assertEquals('All', controller.dateSelect);
        Test.StartTest();
        
    }
    
    static testMethod void getUserIdValueAllAndCalendarIdValue() {
        
        PageReference pageRef = Page.selectionParametersView;
        Test.setCurrentPage(pageRef);

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
                         timezonesidkey='Europe/London', username='Unit12.Test@unittest.com');
        
        insert user;
        
        ApexPages.currentPage().getParameters().put('userId', 'All');
        ApexPages.currentPage().getParameters().put('dateId',calendars[0].id);

        List <Program__c> programs = new List <Program__c>();
        for(Integer i = 0; i < 10; i++){
            Program__c program = new Program__c(Name = 'test' + i, Calendar_id__c = calendars[i].id, user_id__c = user.id);
            programs.add(program);
            
        }
        insert programs;
        
        selectionParametersView controller = new selectionParametersView();
        controller.back();
        controller.listPrograms = programs;
        system.assertEquals('All',controller.userSelect);
        system.assertEquals(calendars[0].id, controller.dateSelect);
        Test.StartTest();
    }
    
    static testMethod void getUserIdValueAndCalendarIdValue() {
        
        PageReference pageRef = Page.selectionParametersView;
        Test.setCurrentPage(pageRef);

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
        
        ApexPages.currentPage().getParameters().put('userId', user.id);
        ApexPages.currentPage().getParameters().put('dateId',calendars[0].id);
        
        List <Program__c> programs = new List <Program__c>();
        for(Integer i = 0; i < 10; i++){
            Program__c program = new Program__c(Name = 'test' + i, Calendar_id__c = calendars[i].id, user_id__c = user.id);
            programs.add(program);
            
        }
        insert programs;
        
        selectionParametersView controller = new selectionParametersView();
        controller.back();
        controller.listPrograms = programs;
        controller.userSelect = user.id;
        controller.dateSelect = calendars[0].id;
        controller.addPrograms();
        
        Test.StartTest();
        system.assertEquals(user.id,controller.userSelect);
        system.assertEquals(calendars[0].id, controller.dateSelect);
    }
}