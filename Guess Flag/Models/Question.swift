//
//  Question.swift
//  Guess Flag
//
//  Created by Стас Бойко on 14.10.2022.
//

import Foundation
import UIKit

enum AnswerType {
    case correct
    case wrong
}

struct Question {
    var image: UIImage
    var answers: [Answer]
}

struct Answer {
    var name: String
    var type: AnswerType = .wrong
}
