//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var progressView: UIProgressView!
    
    let secondsInMinute = 1
    var totalTime = 0
    var secondsPassed = 0
    var player: AVAudioPlayer!
    
    var timer: Timer? = nil
    @IBAction func hardnessSelected(_ sender: UIButton) {
        timer?.invalidate()
        
        totalTime = 0
        secondsPassed = 0
        
        progressView.progress = 0
        
        switch sender.tag {
        case 1:
            totalTime = 5 * secondsInMinute
            titleLabel.text = "So you want your eggs soft..."
        case 2:
            totalTime = 7 * secondsInMinute
            titleLabel.text = "So you want your eggs medium"
        case 3:
            totalTime = 12 * secondsInMinute
            titleLabel.text = "So you want your eggs hard!"
        default:
            print("Something is wrong")
            return
        }
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
        timer!.tolerance = 0.3
        
    }
    
    @objc func updateCounter() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressView.progress = Float(secondsPassed) / Float(totalTime)
            print("\(secondsPassed) has passed")
        } else {
            timer!.invalidate()
            timer = nil
            titleLabel.text = "Done!\n" + "Do you want to cook more eggs?"
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
        }
    }
}
