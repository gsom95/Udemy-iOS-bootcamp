//
//  NetworkManager.swift
//  HackerNews
//
//  Created by Igor on 29.06.2020.
//  Copyright © 2020 GsomGsom. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    let baseURL = "http://hn.algolia.com/api/v1/"

    @Published var posts = [Post]()

    func fetchData() {
        if let url = URL(string: "\(baseURL)search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, reponse, error in
                if let err = error {
                    print("Error: \(err.localizedDescription)")
                    return
                }

                if let data = data {
                    let decoder = JSONDecoder()
                    do {
                        let results = try decoder.decode(Results.self, from: data)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch let err {
                        print("error: \(err.localizedDescription)")
                        return
                    }
                }

            }

            task.resume()
        }

    }
}
