//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let quiz = [
        Question(text: "2 + 4 = 5", answer: false),
        Question(text: "3 + 1 = 4", answer: true),
    ]
    
    var currentQuestionNumber = 0
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var progressBar: UIProgressView!
    @IBOutlet var trueButton: UIButton!
    @IBOutlet var falseButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = Bool(sender.currentTitle!.lowercased())
        let rightAnswer = quiz[currentQuestionNumber].answer

        if userAnswer == rightAnswer {
            print("Right!")
        } else {
            print("wrong-o")
        }

        if currentQuestionNumber + 1 < quiz.count {
            currentQuestionNumber += 1
        } else {
            currentQuestionNumber = 0
        }

        updateUI()
    }
    
    func updateUI() {
        questionLabel.text = quiz[currentQuestionNumber].text
    }
}
