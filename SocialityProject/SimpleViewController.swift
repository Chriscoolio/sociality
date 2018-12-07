//
//  simpleViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 06/12/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class SimpleViewController: UIViewController {

    @IBOutlet weak var gameImage: UIImageView!
    var imageName: String!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameImage.image = UIImage(named: imageName)
        self.title = imageName

        // Do any additional setup after loading the view.
    }
    func customInit(imageName: String) {
        self.imageName = imageName
        
     
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
