//
//  ForgotPasswordViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 22/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth


class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    @IBAction func resetPass(_ sender: Any) {
        if Email.text == ""{
            let alert = UIAlertController(title: "Oops!", message: "Please enter email", preferredStyle: .alert)
            let defaulAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
            alert.addAction(defaulAction)
            present(alert, animated: true, completion: nil)
        } else{
            Auth.auth().sendPasswordReset(withEmail: Email.text!, completion: {
                (error) in
                var title = ""
                var message = ""
                if error != nil {
                    title = "Error!"
                    message = (error?.localizedDescription)!
                } else{
                    title = "Success!"
                    message = "Password reset email sent"
                    self.Email.text = ""
                }
                let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                
                self.present(alertController, animated: true, completion: nil)
                let viewController = self.storyboard?.instantiateViewController(withIdentifier: "login")
                self.present(viewController!, animated: true, completion: nil)
            })
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)

        Email.layer.cornerRadius = 23
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
