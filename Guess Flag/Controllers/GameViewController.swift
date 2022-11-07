//
//  GameViewController.swift
//  Guess Flag
//
//  Created by Стас Бойко on 14.10.2022.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var undertableView: UIView!
    @IBOutlet weak var flagImage: UIImageView?
    @IBOutlet var answerOptions: [UIButton]!
    @IBOutlet weak var submitButton: UIButton!
    
    var name: String?
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
                 answers: [Answer(name: "Canada", type: .correct), Answer(name: "Mexico"), Answer(name: "Singapore"), Answer(name: "UK")]),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        submitButton.isHidden = true
        displayQuestions()
    }
    
    //MARK: Setup UI
    private func setupUI() {
        undertableView.layer.cornerRadius = 20
        answerOptions.forEach { $0.setTitleColor(.black, for: .disabled) }
        flagImage?.layer.cornerRadius = 20
        flagImage?.layer.borderWidth = 0.5
        flagImage?.layer.borderColor = UIColor.lightGray.cgColor
        
        answerOptions.forEach {
            $0.setTitleColor(.black, for: .normal)
            $0.layer.cornerRadius = 15
            $0.layer.borderWidth = 0.5
            $0.layer.borderColor = UIColor.lightGray.cgColor
        }
    }
    
    //MARK: Display questions mthd
    private func displayQuestions() {
        questionNumberLabel.text = "QUESTION \(selectedQuestion + 1) OF \(questions.count)"
        flagImage?.image = questions[selectedQuestion].image
        for i in 0..<(answerOptions?.count ?? 0) {
            answerOptions[i].setTitle(questions[selectedQuestion].answers[i].name, for: .normal)
            answerOptions[i].tag = i
            answerOptions[i].backgroundColor = .white
            answerOptions[i].isEnabled = true
        }
    }
    
    //MARK: Click on answer
    @IBAction func clickOnButton(_ sender: UIButton) {
        let indexAnswer = sender.tag
        let currentQuestion = questions[selectedQuestion]
        
        if sender.titleLabel?.text == currentQuestion.answers[indexAnswer].name && currentQuestion.answers[indexAnswer].type == .correct {
            sender.backgroundColor = .green
            playerScores += 1
        } else {
            sender.backgroundColor = .red
            
            for button in answerOptions {
                for i in 0..<currentQuestion.answers.count {
                    if button.titleLabel?.text == currentQuestion.answers[i].name && currentQuestion.answers[i].type == .correct {
                        button.backgroundColor = .green
                    }
                }
            }
        }
        answerOptions.forEach { $0.isEnabled = false }
        
        if selectedQuestion < questions.count - 1 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                self.selectedQuestion += 1
                self.displayQuestions()
            }
        } else {
            submitButton.isHidden = false
        }
    }
    
    //MARK: Click on submit
    @IBAction func submitButtonPressed(_ sender: Any) {
        guard let name = name else { return }
        var playersList = LeaderboardData.shared.leaderboard
    
            if let index = playersList.firstIndex(where: { $0.name == name }) {
                playersList[index] = Leaderboard(name: name, score: playerScores)
            } else {
                playersList.append(Leaderboard(name: name, score: playerScores))
            }
        
        LeaderboardData.shared.leaderboard = playersList
        LeaderboardData.shared.encodeToUserDefaults()
        
        navigationController?.popViewController(animated: true)
        }
    }
    
    

