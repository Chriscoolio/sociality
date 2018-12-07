//
//  SocialGameViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 04/12/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class SocialGameViewController: UIViewController {
    
    var players = [String]()
    var tasks = [String]()
    
    var count = 0
    var playerCount = 0
    
    
    
    @IBOutlet weak var playerTask: UITextView!
    @IBOutlet weak var playerTurn: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var addPlayer: UIButton!
    @IBOutlet weak var noMorePlayers: UIButton!
    @IBOutlet weak var nextQuestion: UIButton!
    
   
    
    @IBAction func addPlayerClick(_ sender: Any) {
        if nameField.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter a player name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
        count += 1
        
        if count <= 4 {
            players.append(nameField.text!)
            
            playerTask.text = "Enter name of  Player " + String(count+1)
            
            nameField.text = ""
            noMorePlayers.isHidden = false
            
            print(playerTask.text)
        }
        if count == 4{
            addPlayer.isHidden = true
            nameField.isHidden = true
            playerTask.text = "There is no room for more players"
            noMorePlayers.setTitle("Start", for: .normal)
            
        }
        
        
    }
    
    @IBAction func noMorePlayersClick(_ sender: Any) {
        playerTask.isHidden = false
        playerTurn.isHidden = false
        noMorePlayers.isHidden = true
        addPlayer.isHidden = true
        nameField.isHidden = true
        nextQuestion.isHidden = false
        playerTurn.text = "It's your turn " + players[0]
        playerTask.text = tasks[0]
        
    }
    
    @IBAction func nextQuestionClick(_ sender: Any) {
        print(count)
        print(playerCount)
        playerCount += 1
        if playerCount < count{
            
            playerTurn.text = "It's your turn " + players[playerCount]
            //playerCount += 1
            getTask()
            
        } else {
            playerCount = 0
            playerTurn.text = "It's your turn " + players[0]
        
            getTask()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        playerTask.text = "Enter name of Player 1"
        noMorePlayers.isHidden = true
        nextQuestion.isHidden = true
        playerTurn.isHidden = true
        loadTasks()
        nextQuestion.setTitle("Next", for: .normal)
        noMorePlayers.setTitle("Start", for: .normal)
        self.nameField.layer.cornerRadius = 23
        self.addPlayer.layer.cornerRadius = 14
        self.noMorePlayers.layer.cornerRadius = 23
        self.noMorePlayers.backgroundColor = UIColor.green
        self.nextQuestion.layer.cornerRadius = 23
        self.nextQuestion.backgroundColor = UIColor.green
    }
    func loadTasks(){
        let taskload = ["Tell a joke. If someone laughs they drink 3 sips, but if no one laughs you drink 3 sips", "The player to your left drinks","The player to your right drinks","The youngest player drinks","The oldest player drinks","All females drink","All males drink","Decide who amongst you is most likely to go home early, that player has to drink 5 sips"]
        
        tasks = taskload
        
    }
    func getTask(){
        if !tasks.isEmpty{
            let number = Int.random(in: 0...tasks.count-1)
            print(number)
            print(tasks.count)
            playerTask.text = tasks[number]
            
            
        } else{
            print("No more questions")
        }
    }
}
    




