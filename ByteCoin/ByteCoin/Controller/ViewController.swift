//
//  ViewController.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var currencyLabel: UILabel!
    @IBOutlet var bitcoinCostLabel: UILabel!
    @IBOutlet var currencyPicker: UIPickerView!

    var coinManager = CoinManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        coinManager.delegate = self
        currencyPicker.dataSource = self
        currencyPicker.delegate = self

        currencyLabel.text = coinManager.currencyArray[0]
        coinManager.getCoinPrice(for: coinManager.currencyArray[0])
    }
}

extension ViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

extension ViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coinManager.currencyArray[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let currentCurrency = coinManager.currencyArray[row]
        currencyLabel.text = currentCurrency
        coinManager.getCoinPrice(for: currentCurrency)
    }
}

extension ViewController: CoinManagerDelegate {
    func didFailWithError(_ error: Error) {
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Error occurred", message: error.localizedDescription, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }

    func didUpdateExchangeRate(_ rate: Double) {
        DispatchQueue.main.async {
            self.bitcoinCostLabel.text = String(format: "%.2f", rate)
        }
    }
}
