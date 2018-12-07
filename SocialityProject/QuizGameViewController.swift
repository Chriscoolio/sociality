//
//  QuizGameViewController.swift
//  SocialityProject
//
//  Created by Christopher Chytræus on 30/11/2018.
//  Copyright © 2018 Christopher Chytræus. All rights reserved.
//

import UIKit

class QuizGameViewController: UIViewController {
    
    struct Question {
        let question: String
        let answers: [String]
        let correct: Int
    }
    
    

    @IBOutlet weak var theQuestion: UILabel!
    
    
    @IBOutlet weak var answer0: UIButton!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    
    
    @IBAction func clickAnswer0(_ sender: Any) {
        let trueFalse = correctAnswer(idx: 0)
        if trueFalse == 1{
            print("test")
            self.answer0.backgroundColor = UIColor.green
            
        } else{
            self.answer0.backgroundColor = UIColor.red
            /*let correctanswer = currentQuestion?.correct
            if correctanswer == 1{
                self.answer1.backgroundColor = UIColor.green
            } else if correctanswer == 2{
                self.answer2.backgroundColor = UIColor.green
            } else {
                self.answer3.backgroundColor = UIColor.green
            }*/
            
        }
        
        nextQuestion()
    }
    
    @IBAction func clickAnswer1(_ sender: Any) {
        let trueFalse = correctAnswer(idx: 1)
        if trueFalse == 1{
            self.answer1.backgroundColor = UIColor.green
            
        } else{
            self.answer1.backgroundColor = UIColor.red
        
        }
        
    
        nextQuestion()
        
    }
    
    @IBAction func clickAnswer2(_ sender: Any) {
        let trueFalse = correctAnswer(idx: 2)
        if trueFalse == 1{
            self.answer2.backgroundColor = UIColor.green
            print("green")
            
        } else{
            self.answer2.backgroundColor = UIColor.red
            print("red")
        
        }
        
        nextQuestion()
        
    }
    @IBAction func clickAnswer3(_ sender: Any) {
        let trueFalse = correctAnswer(idx: 3)
        if trueFalse == 1{
            self.answer3.backgroundColor = UIColor.green
        
        } else{
            self.answer3.backgroundColor = UIColor.red
        }
        
        nextQuestion()
        
    }
    
    var questions: [Question] = [
        Question(
            question: "What is the biggest mammal in the world?",
            answers: ["Elephant", "Tiger", "Blue whale", "Giraffe"],
            correct: 2),
        Question(
            question: "What is the fastest animal in the world",
            answers: ["Cheetah", "Pellegrin falcon", "Tiger", "Ostrich"],
            correct: 1),
        Question(
            question: "What is the name of the worlds largest reef system?",
            answers: ["Great barrier reef", "Red sea coral reef", "New Caledonia barrier reef", "The messoamerican barrier reef"],
            correct: 0),
        Question(
            question: "What state of the USA is the Grand Canyon",
            answers: ["Utah", "California", "Arizona", "Texas"],
            correct: 2),
        Question(
            question: "Ayers rock in Australia is also known as what?",
            answers: ["Zuma", "Uluru", "Sigiriya", "Devil's tower"],
            correct: 1),
        Question(
            question: "What is the brightest star in the night sky?",
            answers: ["Sirius", "Canopus", "Arcturus", "Vega"],
            correct: 0),
        Question(
            question: "What color is the most-prized variaty of jade?",
            answers: ["Pink", "Blue", "Green", "Red"],
            correct: 2),
        Question(
            question: "To which animal does the word Lupine refer",
            answers: ["Lion", "Wolf", "Owl", "Bobcat"],
            correct: 1),
        Question(
            question: "Dry ice is a frozen form of which gas?",
            answers: ["Helium", "Oxygen", "Nitrogen", "Carbondioxide"],
            correct: 3),
        Question(
            question: "What is the strongest animal relative to it's weight?",
            answers: ["Dung Beetle", "Rhinoceros Beetle", "Leafcutter Ant", "African Bush Elephant"],
            correct: 0)
    ]
    
    var currentQuestion: Question?
    var currentQuestionPos = 0
    var noCorrect = 0
   
    func correctAnswer(idx: Int) -> Int{
        if idx == currentQuestion?.correct {
            noCorrect += 1
        
            return 1
            
        } else {
        
            return 0}
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ScoreBoardViewController {
            let vc = segue.destination as? ScoreBoardViewController
            vc?.noCorrect = noCorrect
            
        }
    } 
    
    
    
    func nextQuestion() {
        if currentQuestionPos + 1 < questions.count{
            currentQuestionPos += 1
            currentQuestion = questions[currentQuestionPos]
            
        } else {
            print("you've won")
            print(noCorrect)
            
            performSegue(withIdentifier: "goToScoreBoard", sender: self)
            
                        
            
            
            
        }
        setQuestion()
        self.answer0.backgroundColor = UIColor.white
        self.answer1.backgroundColor = UIColor.white
        self.answer2.backgroundColor = UIColor.white
        self.answer3.backgroundColor = UIColor.white
    }
    
    func setQuestion(){
        theQuestion.text = currentQuestion!.question
        answer0.setTitle(currentQuestion!.answers[0], for: .normal)
        answer1.setTitle(currentQuestion!.answers[1], for: .normal)
        answer2.setTitle(currentQuestion!.answers[2], for: .normal)
        answer3.setTitle(currentQuestion!.answers[3], for: .normal)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named:"backgroundgradient2")!)
        self.answer0.layer.cornerRadius = 35
        self.answer1.layer.cornerRadius = 35
        self.answer2.layer.cornerRadius = 35
        self.answer3.layer.cornerRadius = 40
        currentQuestion = questions[0]
        setQuestion()
    }
}
