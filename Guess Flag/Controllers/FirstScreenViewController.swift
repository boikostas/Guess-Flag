//
//  ViewController.swift
//  Guess Flag
//
//  Created by Стас Бойко on 14.10.2022.
//

import UIKit

class FirstScreenViewController: UIViewController {
    
    var nameTextField = UITextField()
    var alert = UIAlertController()
    var savePlayer: ((String) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
            self.savePlayer?(name)
                
            guard let gameVC = self.storyboard?.instantiateViewController(withIdentifier: "game") as? GameViewController else { return }
            
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

