//
//  GameViewController.swift
//  Guess Flag
//
//  Created by Стас Бойко on 14.10.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var flagImage: UIImageView?
    @IBOutlet var answerOptions: [UIButton]! {
        didSet {
            answerOptions.forEach { $0.setTitleColor(.black, for: .disabled) }
        }
    }
    @IBOutlet weak var submitButton: UIButton!
    
    var selectedQuestion = 0
    var playerScores = 0
    
    // MARK: Questions list
    let questions = [
        Question(image: UIImage(named: "ukraine")!,
                 answers: [Answer(name: "Poland"), Answer(name: "France"), Answer(name: "Ukraine", type: .correct), Answer(name: "Bolivia")]),
        Question(image: UIImage(named: "usa")!,
                 answers: [Answer(name: "Canada"), Answer(name: "USA", type: .correct), Answer(name: "Australia"), Answer(name: "Germany")]),
        Question(image: UIImage(named: "china")!,
                 answers: [Answer(name: "North Korea"), Answer(name: "Chile", type: .wrong), Answer(name: "Japan"), Answer(name: "China", type: .correct)]),
        Question(image: UIImage(named: "canada")!,
                 answers: [Answer(name: "Canada", type: .correct), Answer(name: "Mexico"), Answer(name: "Singapore"), Answer(name: "UK", type: .wrong)]),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        submitButton.isEnabled = false
        displayQuestions()
    }
    
    //MARK: Display questions mthd
    private func displayQuestions() {
            flagImage?.image = questions[selectedQuestion].image
        submitButton.isEnabled = false
            for i in 0..<(answerOptions?.count ?? 0) {
                answerOptions[i].setTitle(questions[selectedQuestion].answers[i].name, for: .normal)
                answerOptions[i].tag = i
                answerOptions[i].backgroundColor = .white
                answerOptions[i].setTitleColor(.black, for: .normal)
                answerOptions[i].layer.cornerRadius = 15
                answerOptions[i].isEnabled = true
            }
    }

    //MARK: Click on answer
    @IBAction func clickOnButton(_ sender: UIButton) {
        let indexAnswer = sender.tag
        let currentQuestion = questions[selectedQuestion]
        
        if sender.titleLabel?.text == currentQuestion.answers[indexAnswer].name && currentQuestion.answers[indexAnswer].type == .correct {
            sender.backgroundColor = .green
            //sender.setTitleColor(.white, for: .normal)
            playerScores += 1
        } else {
            sender.backgroundColor = .systemRed
            //sender.setTitleColor(.white, for: .normal)
            
            for button in answerOptions {
                for i in 0..<currentQuestion.answers.count {
                    if button.titleLabel?.text == currentQuestion.answers[i].name && currentQuestion.answers[i].type == .correct {
                        button.backgroundColor = .green
                        //button.setTitleColor(.white, for: .normal)
                    }
                }
            }
        }
        answerOptions.forEach { $0.isEnabled = false}
        submitButton.isEnabled = true
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
//            self.selectedQuestion += 1
//            self.showQuestions()
//        }
    }
    
    //MARK: Click on submit
    @IBAction func submitButtonPressed(_ sender: Any) {
        if selectedQuestion < questions.count - 1 {
            selectedQuestion += 1
            displayQuestions()
        } else {
            guard let firstVC = storyboard?.instantiateViewController(withIdentifier: "first screen") as? FirstScreenViewController else { return }
            print(firstVC.savePlayer)
            firstVC.savePlayer = { name in
                UserDefaults.standard.set(self.playerScores, forKey: name)
                for (key, value) in UserDefaults.standard.dictionaryRepresentation() {
                    print("\(key) = \(value) \n")
                }
            }
        }
        
    }
    
}

