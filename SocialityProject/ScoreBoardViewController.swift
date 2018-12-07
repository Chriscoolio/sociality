//
//  ScoreBoardViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 07/12/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class ScoreBoardViewController: UIViewController {

    @IBOutlet weak var scores: UILabel!
    @IBOutlet weak var scoreText: UITextView!
    @IBAction func playAgainButton(_ sender: Any) {
        
       performSegue(withIdentifier: "goToGames", sender: self)
    }
    
    var noCorrect = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        
        scores.text = String(noCorrect) + "/10"
        let text1 = "You got " + String(noCorrect) + " correct answers. "
        let text2 = "Drink " + String(10-noCorrect) + " sips "
        let text3 = "and deal " + String(noCorrect) + " out."
        scoreText.text = text1 + text2 + text3
        

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
