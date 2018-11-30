//
//  Game.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 15/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import Foundation
import UIKit

class GameType {
    var name: String
    var image: UIImage
    var description: String
    
    init?(name: String, image: UIImage? = UIImage(named: "defaultImage"), description: String) {
        
        guard !name.isEmpty else {
            return nil
        }
        guard let gameTypeImage = image else {
            return nil
        }
        self.name = name
        self.image = gameTypeImage
        self.description = description
    }
}
