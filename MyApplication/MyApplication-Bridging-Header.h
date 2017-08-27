//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>
//#import <GoogleSigIn/GoogleSignIn.h>
//#import <GTMOAuth2/GTMOAuth2Authentication.h>

@interface ViewController : UIViewController
    @property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;
    
//@interface AppDelegate : UIResponder <UIApplicationDelegate>
    //@property (strong, nonatomic) UIWindow *window;

@end
