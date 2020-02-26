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

    var bmi: Float?

    override func viewDidLoad() {
        super.viewDidLoad()

        var advice = ""
        var backgroundColor: UIColor?

        if let bmi = bmi {
            bmiLabel.text = "\(bmi)"

            if bmi < 18.5 {
                advice = "Eat more pies!"
                backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
            } else if bmi < 24.9 {
                advice = "Fit as a fiddle!"
                backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
            } else {
                advice = "Eat fewer pies :("
                backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            }
        } else {
            bmiLabel.text = "\(0.0)"
            advice = "You can't be that short, right?"
            backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
        adviceLabel.text = advice
        view.backgroundColor = backgroundColor

    }

    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
}
