//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Şule Yılmaz on 1.08.2025.
//  Copyright © 2025 The App Brewery. All rights reserved.
//
import Foundation

struct QuizBrain {
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
    
    var questionNumber = 0
    var score = 0
    
    func getQuestionText() -> String {
        return questions[questionNumber].0
    }
    
    mutating func checkAnswer(_ userAnswer: Bool) -> Bool {
        let correctAnswer = questions[questionNumber].1
        if userAnswer == correctAnswer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getScore() -> Int {
        return score
    }
    
    func getProgress() -> Float {
        return Float(questionNumber + 1) / Float(questions.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < questions.count {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
}
