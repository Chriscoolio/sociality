//
//  gameViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 06/12/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class gameViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, ExpandableHeaderViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func logoutButton(_ sender: Any) {
        try! Auth.auth().signOut()
        let viewController = self.storyboard?.instantiateViewController(withIdentifier: "startUp")
        self.present(viewController!, animated: true, completion: nil)
    }
    var sections = [
        AppGames(genre: "Dice" ,
                 gameTitles: ["Roll the Dice", "Under-Over 7", "Hazard"],
                 description: "TODO",
                 image: UIImage(named: "diceIcon"),
                 expanded: false,
                 segueIdentifier: ["goToDice1", "goToDice2", "goToDice3"]),
        AppGames(genre: "Cards" ,
                 gameTitles: ["Higher or Lower", "Card Bridge", "War", "Go Fish"],
                 description: "TODO",
                 image: UIImage(named: "cardsIcon"),
                 expanded: false,
                 segueIdentifier: ["goToCard1", "goToCard2", "goToCard3", "goToCard4"]),
        AppGames(genre: "Quiz" ,
                 gameTitles: ["Trivia Quiz", "Personality Quiz", "Guess Who"],
                 description: "TODO",
                 image: UIImage(named: "quizIcon"),
                 expanded: false,
                 segueIdentifier: ["goToQuiz1", "goToQuiz2", "goToQuiz3"]),
        AppGames(genre: "Social" ,
                 gameTitles: ["Social"],
                 description: "TODO",
                 image: UIImage(named: "socialIcon"),
                 expanded: false,
                 segueIdentifier: ["goToSocial1"]),
        
        
        
        ]
    
   // var segueIdentifiers = ["goToDice1", "goToDice2", "goToDice3", "goToCard1", "goToQuiz1", "goToSocial1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        
    
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].gameTitles.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = ExpandableView()
        header.customInit(title: sections[section].genre, section: section, delegate: self)

        return header
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = sections[indexPath.section].gameTitles[indexPath.row]
        tableView.backgroundColor = .clear
        cell.backgroundColor = .clear
        tableView.tableFooterView = UIView()
        
        
        return cell
        
    }
    
    
    
    
    func toggleSection(header: ExpandableView, section: Int) {
        sections[section].expanded = !sections[section].expanded
        
        tableView.beginUpdates()
        
        for i in 0 ..< sections[section].gameTitles.count {
            tableView.reloadRows(at: [IndexPath(row: i, section: section)], with: .automatic)
        }
        tableView.endUpdates()
        
 
    }
    
    
    
    
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    if sections[indexPath.section].segueIdentifier[indexPath.row] == "goToDice1" ||  sections[indexPath.section].segueIdentifier[indexPath.row] == "goToCard1" || sections[indexPath.section].segueIdentifier[indexPath.row] == "goToQuiz1" || sections[indexPath.section].segueIdentifier[indexPath.row] == "goToSocial1" {
        
        performSegue(withIdentifier: sections[indexPath.section].segueIdentifier[indexPath.row], sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        //performSegue(withIdentifier: segueIdentifiers[indexPath.row], sender: self)
        
        
        print(sections[indexPath.section].segueIdentifier[indexPath.row])
    } else {
        let alertController = UIAlertController(title: "Oops", message: "Not yet implemented", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alertController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
    
    
    
    
    
        /* let simpleViewController = SimpleViewController()
        simpleViewController.customInit(imageName: sections[indexPath.section].gameTitles[indexPath.row])
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(simpleViewController, animated: true) */
    }

    

}
