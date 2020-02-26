//
//  BMICalculator.swift
//  BMI-Calculator-LayoutPractice
//
//  Created by Igor Sapozhnikov on 26.02.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

// Not that height and weight values are really needed for object
// (after all their values from Sliders can be taken)
// but for the sake for exercising it will be here. ~ Igor Sapozhnikov
class BMICalculator {
    var height: Float {
        didSet {
            height = height.rounded(toPlaces: 2)
        }
    }
    var heightDescription: String {
        return "\(height)m"
    }

    var weight: Int
    var weightDescription: String {
        return "\(weight)Kg"
    }

    var BMI: Float {
        let bmi = Float(weight) / (height * height)
        if bmi == Float.infinity {
            return 0.0
        }
        return bmi.rounded(toPlaces: 1)
    }
    var BMIDescription: String {
        return "\(BMI)"
    }

    init() {
        height = 0.0
        weight = 0
    }
}

// Extension for all those float-y numbers and rounding them up to specified decimal places.
// ~ Igor Sapozhnikov
extension BinaryFloatingPoint {
    public func rounded(toPlaces places: Int) -> Self {
        guard places >= 0 else { return self }

        // Black magic of 'functional' approach
        let divisor = Self((0..<places).reduce(1.0, { (accum, _) in 10.0 * accum}))

        return (self * divisor).rounded() / divisor
    }
}
