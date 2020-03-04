//
//  WeatherData.swift
//  Clima
//
//  Created by Igor Sapozhnikov on 05.03.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherData: Decodable {
    let name: String

    struct Main: Decodable {
        let temp: Double
    }
    let main: Main

    struct Weather: Decodable {
        let id: Int
        let description: String
    }
    let weather: [Weather]
}


