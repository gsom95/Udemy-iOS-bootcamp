//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let secondsInMinute = 1
    var timerSeconds = 0
    
    var timer: Timer? = nil
    @IBAction func hardnessSelected(_ sender: UIButton) {
        if timer == nil {
            switch sender.tag {
            case 1:
                timerSeconds = 5 * secondsInMinute
            case 2:
                timerSeconds = 7 * secondsInMinute
            case 3:
                timerSeconds = 12 * secondsInMinute
            default:
                print("Smth fucked up!")
            }
            
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
            timer?.tolerance = 0.3
        } else {
            print("Timer is running")
        }
    }
    
    @objc func updateCounter() {
        if timerSeconds > 0 {
            print("\(timerSeconds) till the end")
            timerSeconds -= 1
        } else {
            timer!.invalidate()
            timer = nil
            print("That's all folks!")
        }
    }
}
