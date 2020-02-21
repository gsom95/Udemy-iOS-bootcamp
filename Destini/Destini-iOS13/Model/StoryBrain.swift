//
//  StoryBrain.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation

class StoryBrain {
    let stories: [Story] = [
        Story(
            text: "Your car has blown a tire on a winding road in the middle of nowhere with no cell phone reception. You decide to hitchhike. A rusty pickup truck rumbles to a stop next to you. A man with a wide brimmed hat with soulless eyes opens the passenger door for you and asks: 'Need a ride, boy?'.",
            choices: [
                (text: "Better ask him if he's a murderer first.", nextStep: 1),
                (text: "I'll hop in. Thanks for the help!", nextStep: 2),
            ]
        ),
        Story(
            text: "He nods slowly, unfazed by the question.",
            choices: [
                (text: "At least he's honest. I'll climb in.", nextStep: 2),
                (text: "Wait, I know how to change a tire.", nextStep: 3),
            ]
        ),
        Story(
            text: "As you begin to drive, the stranger starts talking about his relationship with his mother. He gets angrier and angrier by the minute. He asks you to open the glovebox. Inside you find a bloody knife, two severed fingers, and a cassette tape of Elton John. He reaches for the glove box.",
            choices: [
                (text: "It's him or me! You take the knife and stab him.", nextStep: 4),
                (text: "I love Elton John! Hand him the cassette tape.", nextStep: 5),
            ]
        ),
        Story(
            text: "What? Such a cop out! Did you know traffic accidents are the second leading cause of accidental death for most adult age groups?",
            choices: [
                (text: "The end", nextStep: nil),
            ]
        ),
        Story(
            text: "As you smash through the guardrail and careen towards the jagged rocks below you reflect on the dubious wisdom of stabbing someone while they are driving a car you are in.",
            choices: [
                (text: "The end", nextStep: nil),
            ]
        ),
        Story(
            text: "You bond with the murderer while crooning verses of 'Can you feel the love tonight'. He drops you off at the next town. Before you go he asks you if you know any good places to dump bodies. You reply: 'Try the pier.'",
            choices: [
                (text: "The end", nextStep: nil),
            ]
        ),
    ]

    var currentStep = 0

    var currentStory: Story {
        return stories[currentStep]
    }
}
