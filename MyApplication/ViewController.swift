//
//  ViewController.swift
//  MyApplication
//
//  Created by Prapatsorn on 8/26/2560 BE.
//  Copyright © 2560 Prapatsorn. All rights reserved.
//

import UIKit
import FBSDKShareKit
import FBSDKLoginKit
import FBSDKCoreKit
//import GoogleSignIn
//import GoogleAPIClientForREST


class ViewController: UIViewController, FBSDKLoginButtonDelegate /*GIDSignInUIDelegate*/ {
    
    let loginButton: FBSDKLoginButton = {
        let button = FBSDKLoginButton()
        button.readPermissions = ["email", "public_profile", "user_friends"]
        return button
    }()
    
    /*private let scopes = [kGTLRAuthScopeGmailReadonly]
    
    private let service = GTLRGmailService()
    let signInButton = GIDSignInButton()
    let output = UITextView()*/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(loginButton)
        loginButton.center = view.center
        loginButton.delegate = self
        
        if (FBSDKAccessToken.current()) != nil {
            fetchProfile()
        }
        
        //GIDSignIn.sharedInstance().uiDelegate = self

    }
    
    /*func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        myActivityIndicator.stopAnimating()
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func didTapSignOut(sender: AnyObject) {
        GIDSignIn.sharedInstance().signOut()
    }
    
    @IBOutlet weak var signInButton: GIDSignInButton!*/
    
    func fetchProfile() {
        print("fetch profile")
        let parameters = ["fields": "id, name, first_name, last_name, picture.type(large), email"]
        FBSDKGraphRequest(graphPath: "me", parameters: parameters).start(completionHandler: {(connection, result, error) -> Void in
            if error != nil {
                print(error!)
                return
            }
            if let email = (result as AnyObject)["email"]! as? String {
                print(email)
            }
            print(result!)
        })
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        print("completed login")
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("completed logout")
    }
    
    func loginButtonWillLogin(_ loginButton: FBSDKLoginButton!) -> Bool {
        return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
