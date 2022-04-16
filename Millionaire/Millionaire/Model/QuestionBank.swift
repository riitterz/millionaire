//
//  QuestionBank.swift
//  Millionaire
//
//  Created by Macbook on 24.03.2022.
//

import Foundation

//var addedQuestion = AddQuestionViewController()

class QuestionBank {

    var list = [QuestionSession]()

    init() {
       list.append(QuestionSession(questionText: "В какой из этих стран один из официальных языков - французский?", choiceA: "Республика Гиати", choiceB: "Кения", choiceC: "Эквадор", choiceD: "Венесуэла", answer: 1 ))

        list.append(QuestionSession(questionText: "В каком году произошла Куликовская битва?", choiceA: "1380", choiceB: "1569", choiceC: "1616", choiceD: "1773", answer: 1 ))

        list.append(QuestionSession(questionText: "Какой титул имел Дон Кихот?", choiceA: "Барон", choiceB: "Маркиз", choiceC: "Идальго", choiceD: "Вождь", answer: 3 ))

        list.append(QuestionSession(questionText: "Кто автор антиутопического романа «О дивный новый мир»?", choiceA: "Олдос Хаксли", choiceB: "Рэй Брэдбери", choiceC: "Джордж Оруэлл", choiceD: "Сомерсет Моэм", answer: 1 ))

        list.append(QuestionSession(questionText: "Как называется самая глубокая точка поверхности Земли, находящаяся на дне Марианской впадины?", choiceA: "Филиппинская плита", choiceB: "Бездна Челленджера", choiceC: "Кермадек", choiceD: "Черное Логово", answer: 2 ))

        list.append(QuestionSession(questionText: "Что открыл Александр Вольта в поисках «горючего воздуха»?", choiceA: "Кислород", choiceB: "Углерод", choiceC: "Метан", choiceD: "Озон", answer: 3 ))

        list.append(QuestionSession(questionText: "Как называется ближайшая к Земле звезда?", choiceA: "Проксиома Центавра", choiceB: "Солнце", choiceC: "Полярная", choiceD: "Сириус", answer: 2 ))
        
        list.append(QuestionSession(questionText: "", choiceA: "", choiceB: "", choiceC: "", choiceD: "", answer: Int("") ?? 0 ))

    }
    
//    var addedQuestion: [QuestionSession] = [QuestionSession(questionText: "",
//                                                            choiceA: "",
//                                                            choiceB: "",
//                                                            choiceC: "",
//                                                            choiceD: "",
//                                                            answer: Int("") ?? 0),
//                                            QuestionSession(questionText: "",
//                                                            choiceA: "",
//                                                            choiceB: "",
//                                                            choiceC: "",
//                                                            choiceD: "",
//                                                            answer: Int("") ?? 0)
//    ]

}
