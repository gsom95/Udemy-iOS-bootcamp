//
//  TipCalculator.swift
//  Tipsy
//
//  Created by Igor Sapozhnikov on 03.03.2020.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import Foundation

class TipCalculator {
    var currentPercent: Double
    var splitBetween: Double
    var bill: Double

    init() {
        splitBetween = 2
        currentPercent = 0.1
        bill = 0
    }

    private func calculateEachPay() -> Double {
        return bill * (1 + currentPercent) / splitBetween
    }

    var totalEachPays: String {
        return String(format: "%.2f", calculateEachPay())
    }

    var settings: String {
        return "Split between \(Int(splitBetween)) people, with \(currentPercent * 100)% tip."
    }
}
