//
//  HigherLowerViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 27/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class HigherLowerViewController: UIViewController {
    @IBOutlet weak var startbutton: UIButton!
    
    @IBOutlet weak var higher: UIButton!
    
    @IBOutlet weak var lower: UIButton!
    
    @IBAction func clickStartButton(_ sender: Any) {
        
        self.startbutton.isHidden = true
        self.higher.isHidden = false
        self.lower.isHidden = false
        self.addPlayer.isHidden = true
        self.playerText.isHidden = true
        playerTurn.text = "It's your turn " + players[0]
        
        cardFlip(isOpen: isOpen, card: cardValue)
        
    }
    
    var cardValue = ""
    var deck = [Card]()
    var newCard = Card.init(rank: HigherLowerViewController.Rank(rawValue: 1)!, suit: HigherLowerViewController.Suit.Clubs)
    var oldCard = Card.init(rank: HigherLowerViewController.Rank(rawValue: 1)!, suit: HigherLowerViewController.Suit.Clubs)
    enum Rank: Int{
        case Ace = 1
        case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
        case Eleven, Twelve, Thirteen
        
        func desc() -> Int{
        switch self {
        case .Ace: return 1
        case .Eleven: return 11
        case .Twelve: return 12
        case .Thirteen: return 13
    
        default: return Int(self.rawValue)
            }
        }
    }
    
    enum Suit{
        case Spades, Hearts, Diamonds, Clubs
        func desc() -> String{
            switch self {
            case .Spades: return "S"
            case .Clubs: return "C"
            case .Diamonds: return "D"
            case .Hearts: return "H"
            }
        }
    }
    
    func cardInfo(HigherLowerViewController: Card) ->(Rank: Int, Suit: String ) {
        let cardRank = HigherLowerViewController.rank.desc()
        let cardSuit = HigherLowerViewController.suit.desc()
        let card = (cardRank,cardSuit)
        return card
    }
    
    
    
    struct Card {
        var rank: Rank
        var suit: Suit
        func desc() -> String{
            return "the " + String(rank.desc()) + " of " + suit.desc()
        }
        static func createDeck() -> [Card]{
            let ranks = [Rank.Ace, Rank.Two, Rank.Three, Rank.Four, Rank.Five, Rank.Six, Rank.Seven, Rank.Eight, Rank.Nine, Rank.Ten, Rank.Eleven, Rank.Twelve, Rank.Thirteen]
            let suits = [Suit.Spades, Suit.Hearts, Suit.Diamonds, Suit.Clubs]
            var deck = [Card]()
            for suit in suits {
                for rank in ranks {
                    deck.append(Card(rank: rank, suit: suit))
                }
            }
            deck.shuffle()
            return deck
        }
        
    }

    
    @IBOutlet weak var playerTurn: UILabel!
    
    @IBOutlet weak var CurrentCard: UIImageView!
    @IBOutlet weak var playerText: UITextField!
    
    @IBOutlet weak var UsedCards: UIImageView!
    var isOpen = false
    var players = [String]()
    var count = 0
    @IBOutlet weak var addPlayer: UIButton!
    @IBAction func ClickAddPlayer(_ sender: Any) {
        if playerText.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter a player name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else{
        count += 1
        
        if count <= 4 {
            players.append(playerText.text!)
            
            playerTurn.text = "Please enter player" + String(count+1) + "'s name"
            
            playerText.text = ""
            
            self.startbutton.isHidden = false

        }
        if count == 4{
            addPlayer.isHidden = true
            playerText.isHidden = true
            playerTurn.text = "There is no room for more players"
            self.startbutton.isHidden = false
            
        }
        }
    }
    var winCount = 0
    var playerCount = 0
    @IBAction func HigherButton(_ sender: Any) {
        isOpen = true
        cardFlip(isOpen: isOpen, card: "cardDeck")
        
        if deck.count == 0{
            print("Changed deck, click again")
            deck = Card.createDeck()
            oldCard = deck[0]
            deck.remove(at: 0)
        } else{
            newCard = deck[0]
            let newinfo = cardInfo(HigherLowerViewController: newCard)
            let newrank = newinfo.Rank
            let oldinfo = cardInfo(HigherLowerViewController: oldCard)
            let oldrank = oldinfo.Rank
            
            let newCardInfo = String(newCard.rank.desc()) + newCard.suit.desc()
            isOpen = false
            
            print(newCardInfo)
            cardFlip(isOpen: isOpen, card: newCardInfo)
            
            
            
            if newrank >= oldrank{
                winCount += 1
                if winCount == 3 {
                    let alertController = UIAlertController(title: "You've won", message: "You guessed three in a row, it's the next players turn", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alertController, animated: true)
                    winCount = 0
                    playerCount += 1
                    if playerCount < count{
                        print(playerCount)
                        print(players[playerCount])
                        playerTurn.text = "It's your turn " + players[playerCount]
                        playerCount += 1
                        
                    }else {
                        playerCount = 0
                        playerTurn.text = "It's your turn " + players[0]
                        playerCount += 1
                    }
                }
                
            } else {
                winCount = 0
                let alertController = UIAlertController(title: "You guessed wrong", message: "Have a sip of your drink and try again", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alertController, animated: true)
            }
            
            oldCard = newCard
            deck.remove(at: 0)

        }
    }
    
    @IBAction func LowerButton(_ sender: Any) {isOpen = true
        cardFlip(isOpen: isOpen, card: "cardDeck")
        
        if deck.count == 0{
            print("Changed deck, click again")
            deck = Card.createDeck()
            oldCard = deck[0]
            deck.remove(at: 0)
        } else{
            newCard = deck[0]
            let newinfo = cardInfo(HigherLowerViewController: newCard)
            let newrank = newinfo.Rank
            let oldinfo = cardInfo(HigherLowerViewController: oldCard)
            let oldrank = oldinfo.Rank
            
            let newCardInfo = String(newCard.rank.desc()) + newCard.suit.desc()
            isOpen = false
            
            print(newCardInfo)
            cardFlip(isOpen: isOpen, card: newCardInfo)
            
            
            print(String(newrank) + " " + String(oldrank))

            if newrank <= oldrank{
                winCount += 1
                if winCount == 3 {
                    let alertController = UIAlertController(title: "You've won", message: "You guessed three in a row, it's the next players turn", preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                    self.present(alertController, animated: true)
                    playerCount += 1
                    winCount = 0
                    if playerCount < count{
                        print(playerCount)
                        print(players[playerCount])
                        playerTurn.text = "It's your turn " + players[playerCount]
                        playerCount += 1
                        
                    }else {
                        playerCount = 0
                        playerTurn.text = "It's your turn " + players[0]
                        playerCount += 1
                    }
                }
                
            } else {

                winCount = 0
                let alertController = UIAlertController(title: "You guessed wrong", message: "Have a sip of your drink and try again", preferredStyle: .alert)
                alertController.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alertController, animated: true)
            }
            
            oldCard = newCard
            deck.remove(at: 0)
            
        }
    }
    
    func cardFlip(isOpen: Bool, card: String){
        if isOpen{
            let image = UIImage(named: card)
            CurrentCard.image = image
            UIView.transition(with: CurrentCard, duration: 0.3, options: .transitionFlipFromLeft, animations: nil, completion: nil)
        } else{
            let image = UIImage(named: card)
            CurrentCard.image = image
            UIView.transition(with: CurrentCard, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.startbutton.backgroundColor = UIColor.green
        self.higher.backgroundColor = UIColor.green
        self.lower.backgroundColor = UIColor.red
        
        self.higher.layer.cornerRadius = 23
        self.lower.layer.cornerRadius = 23
        self.startbutton.layer.cornerRadius = 23
        
        self.higher.isHidden = true
        self.lower.isHidden = true
        
        self.addPlayer.backgroundColor = UIColor.white
        self.addPlayer.layer.cornerRadius = 14
        
        
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        CurrentCard.image = UIImage(named: "cardDeck")
        playerTurn.text = "Please enter player1's name"
        deck = Card.createDeck()
        oldCard = deck[0]
        cardValue = String(oldCard.rank.desc()) + oldCard.suit.desc()
        print(cardValue)
        self.startbutton.isHidden = true
        //cardFlip(isOpen: isOpen, card: cardValue)
        deck.remove(at: 0)
    }
}
