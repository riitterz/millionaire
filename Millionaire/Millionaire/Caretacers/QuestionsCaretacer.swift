//
//  QuestionsCaretacer.swift
//  Millionaire
//
//  Created by Macbook on 02.04.2022.
//

import Foundation

final class QuestionsCaretacer {
   
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    
    private let key = "question"
    
    func seve(question: [QuestionSession]) {
        do {
            let data = try self.encoder.encode(question)
            UserDefaults.standard.set(data, forKey: key)
        } catch {
            print(error)
        }
    }
    
    func retriveQuestion() -> [QuestionSession] {
        guard let data = UserDefaults.standard.data(forKey: key) else {return []}
        
        do {
            return try self.decoder.decode([QuestionSession].self, from: data)
        } catch {
            print(error)
            return []
        }
    }
}
