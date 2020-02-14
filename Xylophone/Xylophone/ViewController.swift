//
//  ViewController.swift
//  Xylophone
//
//  Created by Angela Yu on 28/06/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let notes = ["C", "D", "E", "F", "G", "A", "B"]
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        sender.alpha = 0.2
        playSound(notes[sender.tag-1])
        
        // Button is disabled during animation!
        UIView.animate(withDuration: 0.1) {
            sender.alpha = 1.0
        }
        
    }
    
    func playSound(_ note: String) {
        let url = Bundle.main.url(forResource: note, withExtension: "wav")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
                
    }
}

