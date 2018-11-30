//
//  Games.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 15/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import Foundation
import UIKit

class Games {
    
    var name: String
    var type: String
    var description: String
    var image: UIImage
    
    init?(name: String, type: String, description: String, image: UIImage? = UIImage(named: "defaultImage")) {
        
        guard !name.isEmpty else {
            return nil
        }
        
        guard !type.isEmpty else {
            return nil
        }
        
        guard !description.isEmpty else {
            return nil
        }
        
        guard let GamesImage = image else {
            return nil
        }
        
        self.name = name
        self.type = type
        self.description = description
        self.image = GamesImage
        
    }
    
}



