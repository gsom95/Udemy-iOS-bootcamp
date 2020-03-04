//
//  WeatherManager.swift
//  Clima
//
//  Created by Igor Sapozhnikov on 04.03.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let baseRequestURL = "https://api.openweathermap.org/data/2.5/weather?appid=0b82089e6d8a0e9a68234ce2dd49d901&q=%@&units=%@"

    func fetchWeather(forCity city: String, units: String = "metric") {
        let request = String(format: baseRequestURL, city, units)
        performRequest(request)
    }

    func performRequest(_ urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }

                if let weatherData = data {
                    self.parseJSON(fromData: weatherData)
                }
            }

            task.resume()
        }
    }

    func parseJSON(fromData data: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)
            let condition = getConditionName(fromID: decodedData.weather[0].id)
        } catch {
            print("Error during data decoding: \(error)")
        }
    }

    func getConditionName(fromID id: Int) -> String {
        var condition: String
        switch id {
            case 200...232:
                condition = "cloud.bolt"
            case 300..<321:
                condition = "cloud.drizzle"
            case 500..<531:
                condition = "cloud.rain"
            case 600..<622:
                condition = "cloud.snow"
            case 700..<781:
                condition = "cloud.fog"
            case 800:
                condition = "sun.max"
            case 801...804:
                condition = "cloud"
            default:
                condition = "cloud"
        }

        return condition
    }
}
