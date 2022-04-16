//
//  Game.swift
//  Millionaire
//
//  Created by Macbook on 06.04.2022.
//

import Foundation

final class Game {
    
    static let shared = Game()
    
    private init() {
        self.questions = self.questionCaretacer.retriveQuestion()
    }
    
    private var questionCaretacer = QuestionsCaretacer()
    
    private(set) var questions: [QuestionSession] {
        didSet {
            questionCaretacer.seve(question: self.questions)
        }
    }
    
    var gameSessions: QuestionSession?
    
    func addQuestion(_ question: QuestionSession) {
        self.questions.append(question)
    }
    
    func clearQuestion() {
        self.questions = []
    }
}
