//
//  Sotry.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

typealias StoryChoice = (text: String, nextStep: Int?)

class Story {
    let text: String

    var choices: [StoryChoice]

    init(text: String, choices: [StoryChoice] = []) {
        self.text = text
        self.choices = choices
    }
}
