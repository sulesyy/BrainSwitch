//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    
    @IBOutlet weak var falseButton: UIButton!

    let questions = [
        ("The sky is blue.", true),
        ("Cats can fly.", false),
        ("2 + 2 equals 4.", true),
        ("The Earth is flat.", false),
        ("Programming is fun.", true),
        ("The moon is made of cheese.", false),
        ("Water freezes at 0°C.", true),
        ("Fish can walk on land.", false),
        ("Humans have two hearts.", false),
        ("The sun rises in the east.", true),
        ("A year has 365 days.", true),
        ("Elephants are the largest land animals.", true),
        ("Coffee is made from berries.", true),
        ("Lightning never strikes the same place twice.", false),
        ("Humans can breathe underwater without equipment.", false),
        ("Python is a type of programming language.", true),
        ("Antarctica is the coldest continent.", true),
        ("Bats are blind.", false),
        ("Tomatoes are vegetables.", false),
        ("Mars is closer to the sun than Earth.", false)
    ]
        
        var questionIndex = 0
    var score = 0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
        }

        @IBAction func answerButtonPressed(_ sender: UIButton) {
            let userAnswer = sender.currentTitle == "True" // Butonun yazısına göre
            let correctAnswer = questions[questionIndex].1
            
            if userAnswer == correctAnswer {
                sender.backgroundColor = .systemGreen
                score += 1
            } else {
                sender.backgroundColor = .systemRed
            }
            
            // Sıradaki soruya geçiş için 0.2 sn bekle
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                self.nextQuestion()
            }
        }
        
        func nextQuestion() {
            questionIndex += 1
            if questionIndex >= questions.count {
                questionIndex = 0
                score = 0
            }
            updateUI() 
        }
        
    func updateUI() {
        questionLabel.text = questions[questionIndex].0
        progressBar.progress = Float(questionIndex + 1) / Float(questions.count)
        scoreLabel.text = "Score: \(score)"
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
    }
        }
        
    


    

