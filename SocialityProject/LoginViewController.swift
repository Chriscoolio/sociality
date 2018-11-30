//
//  LoginViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 22/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FBSDKLoginKit

class LoginViewController: UIViewController {
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var toResetPassword: UIButton!
    @IBOutlet weak var loginFacebook: FBSDKLoginButton!
    
    @IBAction func loginButton(_ sender: Any) {
        
    
        
        if self.username.text == "" || self.password.text == "" {
            
            let alertController = UIAlertController(title: "Error", message: "Please enter E-mail and password!", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
            
            
        } else {
            Auth.auth().signIn(withEmail: username.text!, password: password.text!) { (user, error) in
                
                if error == nil {
                    print("You have successfully logged in!")
                    
                    let viewController = self.storyboard?.instantiateViewController(withIdentifier: "Games")
                    self.present(viewController!, animated: true, completion: nil)
                    
                } else {
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                    
                }
            }
        }
        
        
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Facebook login
        let loginFacebook = FBSDKLoginButton()
        loginFacebook.readPermissions = ["public_profile", "email"]
        
        //Editing appearances
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        
        self.login.backgroundColor = UIColor.green
        
        self.username.layer.cornerRadius = 23
        self.password.layer.cornerRadius = 23
        self.login.layer.cornerRadius = 23
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
