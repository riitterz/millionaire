//
//  ResultsController.swift
//  Millionaire
//
//  Created by Macbook on 24.03.2022.
//

import UIKit

class ResultsController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    var name: String = ""
    var allCorrectAnswers: Int = 0
    var score: Int = 0
    
//    result.text = "\(score)$"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.text = name
       
    }

}
