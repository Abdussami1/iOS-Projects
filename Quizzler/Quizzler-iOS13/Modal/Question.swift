//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by Macbook on 01/07/25.
//  Copyright © 2025 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
