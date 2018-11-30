//
//  DicerollViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 27/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class DicerollViewController: UIViewController {
    @IBOutlet weak var dice1: UIImageView!

    
    @IBAction func diceroll(_ sender: Any) {
        let number = Int.random(in: 1...6)
        let roll = String(number)
        let number1 = Int.random(in: 1...6)
        let roll1 = String(number1)
        self.dice1.image = UIImage(named: roll)
        self.dice2.image = UIImage(named: roll1)
        
    }
    
    @IBOutlet weak var dice2: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundPhoto")!)

        dice1.image = UIImage(named: "1")
        dice2.image = UIImage(named: "2")

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
