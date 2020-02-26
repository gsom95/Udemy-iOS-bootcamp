//
//  ViewController.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Angela Yu on 21/08/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {
    @IBOutlet var heightLabel: UILabel!
    @IBOutlet var weightLabel: UILabel!
    @IBOutlet var heightSlider: UISlider!
    @IBOutlet var weightSlider: UISlider!

    var bmiCalc = BMICalculator()

    override func viewDidLoad() {
        super.viewDidLoad()

        bmiCalc.height = heightSlider.value
        bmiCalc.weight = Int(weightSlider.value)
    }

    @IBAction func heightSliderChanged(_ sender: UISlider) {
        bmiCalc.height = sender.value
        heightLabel.text = bmiCalc.heightDescription
    }

    @IBAction func weightSliderChanged(_ sender: UISlider) {
        bmiCalc.weight = Int(sender.value)
        weightLabel.text = bmiCalc.weightDescription
    }

    @IBAction func calculatePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToResult", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController

            destination.bmi = bmiCalc.BMI
        }
    }
}

