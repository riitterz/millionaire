//
//  Question.swift
//  Millionaire
//
//  Created by Macbook on 24.03.2022.
//

import Foundation

class QuestionSession: Codable {
    
    var question: String
    let optionA: String
    let optionB: String
    let optionC: String
    let optionD: String
    var correctAnswer: Int = 0
    
    init(questionText: String, choiceA: String, choiceB: String, choiceC: String, choiceD: String, answer: Int) {
        
        question = questionText
        optionA = choiceA
        optionB = choiceB
        optionC = choiceC
        optionD = choiceD
        correctAnswer = answer
    }
}
