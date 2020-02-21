//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!

    let storyBrain = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }


    @IBAction func choiceMade(_ sender: UIButton) {
        if let nextStep = storyBrain.currentStory.choices[sender.tag - 1].nextStep {
            storyBrain.currentStep = nextStep
            updateUI()
        }
    }

    func updateUI() {
        let currentStory = storyBrain.currentStory

        storyLabel.text = currentStory.text

        choice1Button.setTitle(currentStory.choices[0].text, for: .normal)
        if currentStory.choices.count < 2 {
            choice2Button.isHidden = true
        } else {
            choice2Button.isHidden = false
            choice2Button.setTitle(currentStory.choices[1].text, for: .normal)
        }
    }
}

