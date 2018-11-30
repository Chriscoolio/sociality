//
//  Categories.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 29/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import Foundation
import UIKit
class Categories {
    
var name: String
var image: UIImage


init?(name: String, image: UIImage? = UIImage(named: "defaultImage")) {
    
    guard !name.isEmpty else {
        return nil
    }
    guard let CategoriesImage = image else {
        return nil
    }
    self.name = name
    self.image = CategoriesImage
    
}

}
