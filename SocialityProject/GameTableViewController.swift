//
//  GameTableViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 15/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit



//struct gameData {
  //  var opened = Bool()
  //  var title = String()
  //  var sectionData = [String]()
    
//}
class GameTableViewController: UITableViewController {
    
    var games = [GameType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillGameTypes()
        //tableView.rowHeight = UITableView.automaticDimension;
        
        //tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundPhoto"))
        
    }
    
    func fillGameTypes() {
        
        let appGameType = [GameType(name: "Dice", image: UIImage(named: "dice"), description: "Roll your way towards victory!"),
                            GameType(name: "Cards", image: UIImage(named: "cards"), description: "The ace of games!"),
                            GameType(name: "Quiz", image: UIImage(named: "quiz"), description: "Test your knowledge and bragging rights!"),
                            GameType(name: "Social", image: UIImage(named: "social"), description: "Interact with your friends!"),
                            GameType(name: "test", image: UIImage(named: "test"), description: "TODO")
        ]
        games = appGameType.compactMap {$0}

    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return games.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameTypeCell", for: indexPath)
        
        // Configure the cell...cell.backgroundColor = UIColor.blue
        cell.layer.backgroundColor = UIColor.clear.cgColor
        tableView.backgroundView = UIImageView(image: UIImage(named: "backgroundPhoto"))
        cell.textLabel?.text = games[indexPath.row].name
        cell.detailTextLabel?.text = games[indexPath.row].description
        cell.imageView?.sizeToFit()
        cell.imageView?.image = games[indexPath.row].image
        cell.imageView?.layer.borderWidth = 1
        //cell.selectionStyle = .gray
        
        
        return cell
    }
    
}
