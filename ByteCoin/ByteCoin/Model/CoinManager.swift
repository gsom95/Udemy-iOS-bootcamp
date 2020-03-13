//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

protocol CoinManagerDelegate {
    func didFailWithError(_ error: Error)
    func didUpdateExchangeRate(_ rate: Double)
}

struct CoinManager {
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = ProcessInfo.processInfo.environment["API_KEY"]
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]

    var delegate: CoinManagerDelegate?

    func getCoinPrice(for currency: String) {
        let request = baseURL + "/" + currency
        performRequest(withURL: request)
    }

    func performRequest(withURL requestString: String) {
        if let url = URL(string: requestString) {
            let session = URLSession.shared
            var request = URLRequest(url: url)
            request.setValue(apiKey, forHTTPHeaderField: "X-CoinAPI-Key")

            let task = session.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    self.delegate?.didFailWithError(error)
                    return
                }

                if let data = data, let rate = self.parseJSON(data) {
                    self.delegate?.didUpdateExchangeRate(rate)
                }
            }

            task.resume()
        }
    }

    func parseJSON(_ data: Data) -> Double? {
        var rate: Double? = nil
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: data)
            rate = decodedData.rate
        } catch {
            delegate?.didFailWithError(error)
        }

        return rate
    }
}
