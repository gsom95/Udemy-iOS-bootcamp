//
//  WeatherModel.swift
//  Clima
//
//  Created by Igor Sapozhnikov on 06.03.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherModel {
    let cityName: String

    let conditionID: Int
    var conditionName: String {
        switch conditionID {
            case 200...232:
                return "cloud.bolt"
            case 300..<321:
                return "cloud.drizzle"
            case 500..<531:
                return "cloud.rain"
            case 600..<622:
                return "cloud.snow"
            case 700..<781:
                return "cloud.fog"
            case 800:
                return "sun.max"
            case 801...804:
                return "cloud"
            default:
                return "cloud"
        }
    }

    let temperature: Double
    var temperatureString: String {
        String(format: "%.1f", temperature)
    }
}
