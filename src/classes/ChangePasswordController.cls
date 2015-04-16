<<<<<<< HEAD
<<<<<<< HEAD
/**
 * An apex page controller that exposes the change password functionality
 */
public with sharing class ChangePasswordController {
    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    
    public PageReference changePassword() {
        return Site.changePassword(newPassword, verifyNewPassword, oldpassword);    
    }     
    
   	public ChangePasswordController() {}
=======
=======
>>>>>>> c99853be376f80935f1732c8f903f3a6fd276dcb
/**
 * An apex page controller that exposes the change password functionality
 */
public with sharing class ChangePasswordController {
    public String oldPassword {get; set;}
    public String newPassword {get; set;}
    public String verifyNewPassword {get; set;}        
    
    public PageReference changePassword() {
        return Site.changePassword(newPassword, verifyNewPassword, oldpassword);    
    }     
    
   	public ChangePasswordController() {}
<<<<<<< HEAD
>>>>>>> c99853be376f80935f1732c8f903f3a6fd276dcb
=======
>>>>>>> c99853be376f80935f1732c8f903f3a6fd276dcb
}