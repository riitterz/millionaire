//
//  ResultsController.swift
//  Millionaire
//
//  Created by Macbook on 24.03.2022.
//

import UIKit

class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var result: UILabel!
    
    var name: String = ""
    var correctAnswer: Int = 0
    var score: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        result.text = name
       
    }
    
}
