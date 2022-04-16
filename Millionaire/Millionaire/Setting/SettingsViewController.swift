//
//  SettingsViewController.swift
//  Millionaire
//
//  Created by Macbook on 02.04.2022.
//

import UIKit

class SettingsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    var game = Game.shared
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    @IBAction func clearQuestionAction(_ sender: Any) {
        
        game.clearQuestion()
    }
    
}
