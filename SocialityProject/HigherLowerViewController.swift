//
//  HigherLowerViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 27/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class HigherLowerViewController: UIViewController {
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


    @IBOutlet weak var CurrentCard: UIImageView!
    @IBOutlet weak var UsedCards: UIImageView!
    var isOpen = false
    
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
                print("win")
                
            } else {
                print("lose")
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
                print("win")
                
            } else {

                print("lose")
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
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        CurrentCard.image = UIImage(named: "cardDeck")
        
        deck = Card.createDeck()
        oldCard = deck[0]
        cardValue = String(oldCard.rank.desc()) + oldCard.suit.desc()
        print(cardValue)
        cardFlip(isOpen: isOpen, card: cardValue)
        deck.remove(at: 0)
        
        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
