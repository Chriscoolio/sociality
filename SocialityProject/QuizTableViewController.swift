//
//  QuizTableViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 29/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class QuizTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fillQuizCategories()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)

    }
    
    var categories = [Categories]()
    
    func fillQuizCategories() {
        
        let gameCategories = [Categories(name: "Nature", image: UIImage(named: "dice")),
                              Categories(name: "Science", image: UIImage(named: "cards")),
                              Categories(name: "Geography", image: UIImage(named: "quiz")),
                              Categories(name: "Entertainment", image: UIImage(named: "social")),
                              Categories(name: "Sports", image: UIImage(named: "test"))
        ]
        categories = gameCategories.compactMap {$0}
        
    }

   

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        cell.imageView?.sizeToFit()
        cell.imageView?.image = categories[indexPath.row].image
        cell.imageView?.layer.borderWidth = 1
        
        self.tableView.reloadData()
        
        return cell
    }



}
