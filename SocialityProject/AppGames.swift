//
//  AppGames.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 07/12/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import Foundation
import UIKit

struct AppGames {
    var genre: String!
    var gameTitles: [String]!
    var description: String
    var image: UIImage?
    var expanded: Bool!
    var segueIdentifier: [String]!
    init(genre: String, gameTitles: [String], description: String, image: UIImage?, expanded: Bool, segueIdentifier: [String]) {
        
        let GamesImage = image
        
        
        self.genre = genre
        self.gameTitles = gameTitles
        self.description = description
        self.image = GamesImage
        self.expanded = expanded
        self.segueIdentifier = segueIdentifier
        
}

}
