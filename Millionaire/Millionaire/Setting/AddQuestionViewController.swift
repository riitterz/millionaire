//
//  AddQuestionViewController.swift
//  Millionaire
//
//  Created by Macbook on 08.04.2022.
//

import UIKit

enum MessageEnum: String {
    case isEmpty = "Остались незаполненные поля"
    case isMatch = "Верный ответ не соответвует ни одному из вариантов ответов"
    case isSaved = "Ваш вопрос сохранен"
    
}

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var answerBTextField: UITextField!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var answerDTextField: UITextField!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    @IBOutlet weak var saveQuestionButton: UIButton!
    
    var game = Game.shared
    
    var questionBank = QuestionBank()
    var questionSession = [QuestionSession]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func saveQuestionButtonAction(_ sender: Any) {
        
        saveQuestion()
    }
    
    func saveQuestion() {
        
        //var questionSession = [QuestionSession]()
        
        let question = questionTextField.text
        let answerA = answerATextField.text
        let answerB = answerBTextField.text
        let answerC = answerCTextField.text
        let answerD = answerDTextField.text
        let rightAnswer = Int(rightAnswerTextField.text!)
        
        let questionArray = QuestionSession(questionText: question ?? "",
                                            choiceA: answerA ?? "",
                                            choiceB: answerB ?? "",
                                            choiceC: answerC ?? "",
                                            choiceD: answerD ?? "",
                                            answer: ((rightAnswer ?? Int("")) ?? 0))
        
        
        if question == "" || answerA == "" || answerB == "" || answerC == "" || answerD == "" || rightAnswer == Int("") {
        
            self.showErrorAlert(MessageEnum.isEmpty.rawValue)
            
        } else if rightAnswer == 1 || rightAnswer == 2 || rightAnswer == 3 || rightAnswer == 4 {
            
            game.addQuestion(questionArray)
            showSavedAlert(MessageEnum.isSaved.rawValue)
           
            // if rightAnswer ?? 0 > 4
        } else {

            self.showErrorAlert(MessageEnum.isMatch.rawValue)
        }
    }
    
    @IBAction func savedButtonPressed(_ sender: UIButton) {
//
//        questionTextField = questionBank.addedQuestion
//        questionBank.addedQuestion = questionTextField
    }

    private func showSavedAlert(_ message: String){
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: {action in self.dismiss(animated: true, completion: nil)})
        alert.addAction(action)
        self.present(alert, animated: true,completion: nil)
    }
 
    
    private func showErrorAlert(_ message: String){
        let alert = UIAlertController(title: "Ошибка",
                                      message: message,
                                      preferredStyle: .alert)
        let action = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: {action in print("кнопка алетрт нажата")})
        alert.addAction(action)
        self.present(alert, animated: true,completion: nil)
    }

}
