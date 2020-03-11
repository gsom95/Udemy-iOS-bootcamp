//
//  WeatherManager.swift
//  Clima
//
//  Created by Igor Sapozhnikov on 04.03.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

protocol WeatherManagerDelegate {
    func didUpdateWeather(_ weather: WeatherModel)
    func didFailWithError(_ error: Error)
}

struct WeatherManager {
    var delegate: WeatherViewController?

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
                    self.delegate?.didFailWithError(error)
                    return
                }

                if let weatherData = data {
                    if let weatherModel = self.parseJSON(fromData: weatherData) {
                        self.delegate?.didUpdateWeather(weatherModel)
                    }
                }
            }

            task.resume()
        }
    }

    func parseJSON(fromData data: Data) -> WeatherModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: data)

            return WeatherModel(cityName: decodedData.name, conditionID: decodedData.weather[0].id, temperature: decodedData.main.temp)
        } catch {
            delegate?.didFailWithError(error)
        }

        return nil
    }
}
