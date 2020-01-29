//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by Angela Yu on 14/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let ballArray = [#imageLiteral(resourceName: "ball1.png"),#imageLiteral(resourceName: "ball2.png"),#imageLiteral(resourceName: "ball3.png"),#imageLiteral(resourceName: "ball4.png"),#imageLiteral(resourceName: "ball5.png")]

    @IBOutlet var magicBall: UIImageView!
    @IBOutlet var askButton: UIButton!
    
    func changeBallPicture() {
        askButton.isEnabled = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.magicBall.image = self.ballArray.randomElement()
            self.askButton.isEnabled = true
        }
    }
    
    @IBAction func askButtonPressed(_ sender: UIButton) {
        changeBallPicture()
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        changeBallPicture()
    }
}

