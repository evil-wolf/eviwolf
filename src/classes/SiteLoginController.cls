<<<<<<< HEAD
<<<<<<< HEAD
/**
 * An apex page controller that exposes the site login functionality
 */
global with sharing class SiteLoginController {
    global String username {get; set;}
    global String password {get; set;}

    global PageReference login() {
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        return Site.login(username, password, startUrl);
    }
    
   	global SiteLoginController () {}
=======
=======
>>>>>>> c99853be376f80935f1732c8f903f3a6fd276dcb
/**
 * An apex page controller that exposes the site login functionality
 */
global with sharing class SiteLoginController {
    global String username {get; set;}
    global String password {get; set;}

    global PageReference login() {
        String startUrl = System.currentPageReference().getParameters().get('startURL');
        return Site.login(username, password, startUrl);
    }
    
   	global SiteLoginController () {}
<<<<<<< HEAD
>>>>>>> c99853be376f80935f1732c8f903f3a6fd276dcb
=======
>>>>>>> c99853be376f80935f1732c8f903f3a6fd276dcb
}