//
//  ViewController.swift
//  Guess Flag
//
//  Created by Стас Бойко on 14.10.2022.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var leaderboardButton: UIButton!
    var nameTextField = UITextField()
    var alert = UIAlertController()

    override func viewDidLoad() {
        super.viewDidLoad()
//        UserDefaults.standard.removeObject(forKey: "leaderboard")
        LeaderboardData.shared.decodeFromUserDefaults()
        
        startButton.layer.cornerRadius = 15
        leaderboardButton.layer.cornerRadius = 15
    }

    @IBAction func startGameButtonPressed(_ sender: Any) {
        alert = UIAlertController(title: "Enter your name", message: nil, preferredStyle: .alert)
        
        alert.addTextField {
            (nameField) -> Void in
            self.nameTextField = nameField
            self.nameTextField.placeholder = "Name"
            self.nameTextField.addTarget(self, action: #selector(self.nameTextFieldDidChanged(_:)), for: .editingChanged)
        }
        
        let startAction = UIAlertAction(title: "Let`s start", style: .default) { action in
            guard let name = self.nameTextField.text else { return }
                
            guard let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "game") as? GameViewController else { return }
            gameVC.name = name
            self.show(gameVC, sender: nil)
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
        alert.addAction(startAction)
        alert.addAction(cancelAction)
        startAction.isEnabled = false
        present(alert, animated: true)
    }
    
    @objc func nameTextFieldDidChanged(_ sender: UITextField) {
        guard let name = nameTextField.text else { return }
        if name.isEmpty {
            alert.actions[0].isEnabled = false
        } else {
            alert.actions[0].isEnabled = true
        }
        
    }
    
    @IBAction func leaderBoardButtonPressed(_ sender: Any) {
    
    }
}

