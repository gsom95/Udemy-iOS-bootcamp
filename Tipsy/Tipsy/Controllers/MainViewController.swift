//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPercentButton: UIButton!
    @IBOutlet var tenPercentButton: UIButton!
    @IBOutlet var twentyPercentButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!

    let tipCalc = TipCalculator()

    // To hide keyboard when billTextField editing is finished
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        _ = [zeroPercentButton, tenPercentButton, twentyPercentButton].map {
            $0?.isSelected = false
        }
        sender.isSelected = true

        switch sender.tag {
            case 1:
                tipCalc.currentPercent = 0
            case 2:
                tipCalc.currentPercent = 0.1
            case 3:
                tipCalc.currentPercent = 0.2
            default:
                fatalError("Unknown sender tag for tip buttons")
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = "\(Int(sender.value))"
        tipCalc.splitBetween = sender.value
    }

    @IBAction func calculateButtonPressed(_ sender: UIButton) {
        if let t = billTextField.text, t.isEmpty {
            let alert = UIAlertController(title: "Bill is not entered", message: "Enter how much you have spent to split the bill", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))

            present(alert, animated: true)
        } else {
            performSegue(withIdentifier: "goToResult", sender: self)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let bill = Double(billTextField.text!) else {
            return
        }
        
        tipCalc.bill = bill
        if segue.identifier == "goToResult" {
            let vc = segue.destination as! ResultViewController

            vc.totalText = tipCalc.totalEachPays
            vc.settingsText = tipCalc.settings
        }
    }
}

