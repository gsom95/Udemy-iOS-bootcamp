//
//  ResultViewController.swift
//  Tipsy
//
//  Created by Igor Sapozhnikov on 29.02.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    @IBOutlet var totalLabel: UILabel!
    @IBOutlet var settingsLabel: UILabel!

    var totalText: String!
    var settingsText: String!

    override func viewDidLoad() {
        super.viewDidLoad()

        totalLabel.text = totalText
        settingsLabel.text = settingsText
    }
    
    @IBAction func recalculateButtonPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
