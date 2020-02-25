//
//  ResultViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Igor Sapozhnikov on 25.02.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet var bmiLabel: UILabel!
    @IBOutlet var adviceLabel: UILabel!

    var bmi: String?

    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmi
    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
