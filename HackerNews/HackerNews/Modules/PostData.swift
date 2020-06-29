//
//  News.swift
//  HackerNews
//
//  Created by Igor on 29.06.2020.
//  Copyright © 2020 GsomGsom. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Identifiable, Decodable {
    var id: String {
        return objectID
    }

    let objectID: String
    let title: String
    let url: String?
    let points: Int
}
