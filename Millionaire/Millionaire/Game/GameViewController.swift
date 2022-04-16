//
//  GameViewController.swift
//  Millionaire
//
//  Created by Macbook on 24.03.2022.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var questionCounterLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    var questionArray = [QuestionSession]()
    let allQuestions = QuestionBank()
    var questionNumber: Int = 0
    var score: Int = 0
    var selectedAnswer: Int = 0
    
    let game = Game.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateQuestion()
        updateUI()
        //updateAddedQuestion()

    }
    
    @IBAction func ExitButtonAction(_ sender: Any) {
        
        let alert = UIAlertController(title: "Вы уверены, что хотите покинуть игру?", message: "", preferredStyle: .alert)
        let actionYes = UIAlertAction(title: "Да", style: .cancel, handler: { action in
            self.scoreResult()})
        let actionNo = UIAlertAction(title: "Нет", style: .default, handler: nil)
        alert.addAction(actionYes)
        alert.addAction(actionNo)
        present(alert, animated: true, completion: nil)
    
    }
        
    @IBAction func answerPressed(_ sender: UIButton) {
        if sender.tag == selectedAnswer {
            print("верно")
            score += 10
        } else {
            print("не верно")
            score -= 5
        }
        
        questionNumber += 1
        updateQuestion()
        //updateAddedQuestion()
    }
    
    func updateQuestion() {

        if questionNumber <= allQuestions.list.count - 1 {
            questionLabel.text = allQuestions.list[questionNumber].question
            optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
            optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
            optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
            optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
            selectedAnswer = allQuestions.list[questionNumber].correctAnswer

            updateUI()

        } else {
            let alert = UIAlertController(title: "Конец теста.", message: "Хотите начать сначала?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Начать сначала", style: .default, handler: { action in self.restartQuiz()})
            let endQuizAction = UIAlertAction(title: "На главную", style: .default, handler: { action in
                self.scoreResult()})
            alert.addAction(restartAction)
            alert.addAction(endQuizAction)
            present(alert, animated: true, completion: nil)
        }

    }
    
//    func updateAddedQuestion() {
//
//        if questionNumber <= allQuestions.addedQuestion.count - 1 {
////        if questionNumber <= allQuestions.addedQuestion.count - 1 {
//            questionLabel.text = allQuestions.addedQuestion[questionNumber].question
//            optionA.setTitle(allQuestions.addedQuestion[questionNumber].optionA, for: UIControl.State.normal)
//            optionB.setTitle(allQuestions.addedQuestion[questionNumber].optionB, for: UIControl.State.normal)
//            optionC.setTitle(allQuestions.addedQuestion[questionNumber].optionC, for: UIControl.State.normal)
//            optionD.setTitle(allQuestions.addedQuestion[questionNumber].optionD, for: UIControl.State.normal)
//            selectedAnswer = allQuestions.addedQuestion[questionNumber].correctAnswer
//
//            updateUI()
//        } else {
//        }
////        } else if questionNumber <= allQuestions.list.count - 1 {
////                questionLabel.text = allQuestions.list[questionNumber].question
////                optionA.setTitle(allQuestions.list[questionNumber].optionA, for: UIControl.State.normal)
////                optionB.setTitle(allQuestions.list[questionNumber].optionB, for: UIControl.State.normal)
////                optionC.setTitle(allQuestions.list[questionNumber].optionC, for: UIControl.State.normal)
////                optionD.setTitle(allQuestions.list[questionNumber].optionD, for: UIControl.State.normal)
////                selectedAnswer = allQuestions.list[questionNumber].correctAnswer
////
////                updateUI()
////        }
//    }
    
    func updateUI() {
        scoreLabel.text = "Счет: \(score)$"
        questionCounterLabel.text = "\(questionNumber + 1)/\(allQuestions.list.count)"

    }
        
    func scoreResult() {
        if let resultView = storyboard!.instantiateViewController(identifier: "RV") as? MainScreenViewController {
            resultView.name = scoreLabel.text!
            resultView.name = "Результат: \(score)$"
            show(resultView, sender: nil)
        }
    }
    
    func restartQuiz() {
        score = 0
        questionNumber = 0
        updateQuestion()
        //updateAddedQuestion()

    }

}
