//
//  GameSelectTableViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 15/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit


class GameSelectTableViewController: UITableViewController {
    
    var games = [Games]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fillGames()
        
    }
    
    func fillGames() {
        
        let appGames = [Games(name: "test1", type: "dice", description: "abc", image: UIImage(named: "")),
                        Games(name: "test2", type: "dice", description: "acb", image: UIImage(named: "")),
                        Games(name: "test3", type: "card", description: "bca", image: UIImage(named: "")),
                        Games(name: "test4", type: "card", description: "", image: UIImage(named: "")),
                        Games(name: "test5", type: "", description: "", image: UIImage(named: ""))
        ]
        
        games = appGames.compactMap {$0}
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "gameCell", for: indexPath)
        
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
