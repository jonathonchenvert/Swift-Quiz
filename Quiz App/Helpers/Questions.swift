//
//  Questions.swift
//  Quiz App
//
//  Created by Jonathon Chenvert on 9/26/20.
//

import Foundation

class Questions {
    
    static let questions: [String: [String: Bool]] = [
        "Where do trees grow?":
            ["At the beach": false,
             "In a car": false,
             "On the ground with dirt": true],
        "What charges your phone?":
            ["Electricity": true,
             "A microwave": false,
             "The ocean": false],
        "How much is a dollar?":
            ["4 quarters": true,
             "9.5 dimes": false,
             "3.14 nickels": false],
        "Is sleep important?":
            ["Huh?": false,
             "No": false,
             "Yes": true],
        "When does the sun come out?":
            ["At night": false,
             "During the day": true,
             "When it's inconvenient": false],
        "When does the moon come out?":
            ["At night": true,
             "During the day": false,
             "When it wants to": false],
        "How do you spell 'Quiz'?":
            ["Q-U-I-Z": true,
             "R-O-C-K": false,
             "T-I-R-E": false],
        "What do people breathe?":
            ["Air": true,
             "Water": false,
             "Earth": false],
        "What is your favorite color?":
            ["Yellow": false,
             "Blue": false,
             "Purple": true],
        "What is the velocity of an unladen swallow?":
            ["10 meters per second": false,
             "African or European swallow?": true,
             "I don't know!": false],
    ]
    
}
