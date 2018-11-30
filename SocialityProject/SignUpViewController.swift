//
//  SignUpViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 22/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var Email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var confirm: UITextField!
    
    @IBOutlet weak var signup: UIButton!
    
    @IBAction func signUp(_ sender: Any) {
        
        if password.text != confirm.text{
          /*  UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.2, initialSpringVelocity: 6.0, options: .allowUserInteraction, animations: {[weak self] in self!.signup.transform = .identity}, completion: nil)
            */
            let alert = UIAlertController(title: "Something went wrong", message: "Password and confirmation of password does not match", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
        if Email.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter Email and password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(defaultAction)
            
            present(alert, animated: true, completion: nil)
        } else{
            Auth.auth().createUser(withEmail: Email.text!, password: password.text!){
                (user, error) in
                if error == nil{
                    print("you have succesfully signed up")
                    let viewController = self.storyboard?.instantiateViewController(withIdentifier: "startUp")
                    self.present(viewController!, animated: true, completion: nil)
                 
                } else{
                    let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
                    alert.addAction(defaultAction)
                    self.present(alert, animated: true, completion: nil)
                    
                    }
                }
            }
    
        }
    }
    /*func shakebutton(duration: TimeInterval = 0.5, xvalue: CGFloat = 12, yValue: CGFloat = 0){
        self.transform = CGAffineTransform(translationX: xvalue, y: yValue)
        UIView.animate(withDuration: <#T##TimeInterval#>, delay: <#T##TimeInterval#>, usingSpringWithDamping: <#T##CGFloat#>, initialSpringVelocity: <#T##CGFloat#>, options: <#T##UIView.AnimationOptions#>, animations: <#T##() -> Void#>, completion: <#T##((Bool) -> Void)?##((Bool) -> Void)?##(Bool) -> Void#>)
    }
 */
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        Email.layer.cornerRadius = 23
        password.layer.cornerRadius = 23
        confirm.layer.cornerRadius = 23
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
