//
//  QuestionList.swift
//  Guess Flag
//
//  Created by Стас Бойко on 19.12.2022.
//

import UIKit


class QuestionList {
    
    static var shared = QuestionList()
    
    private init() {}
    
    let list: [Question] = [
        Question(image: UIImage(named: "ukraine")!,
                 answers: [Answer(name: "Poland"), Answer(name: "France"), Answer(name: "Ukraine", type: .correct), Answer(name: "Bolivia")]),
        Question(image: UIImage(named: "usa")!,
                 answers: [Answer(name: "Canada"), Answer(name: "USA", type: .correct), Answer(name: "Australia"), Answer(name: "Germany")]),
        Question(image: UIImage(named: "china")!,
                 answers: [Answer(name: "North Korea"), Answer(name: "Chile", type: .wrong), Answer(name: "Japan"), Answer(name: "China", type: .correct)]),
        Question(image: UIImage(named: "canada")!,
                 answers: [Answer(name: "Canada", type: .correct), Answer(name: "Mexico"), Answer(name: "Singapore"), Answer(name: "UK")]),
        Question(image: UIImage(named: "germany")!,
                 answers: [Answer(name: "Belgium"), Answer(name: "Germany", type: .correct), Answer(name: "Czech Republic"), Answer(name: "Slovakia")]),
        Question(image: UIImage(named: "denmark")!,
                 answers: [Answer(name: "Denmark", type: .correct), Answer(name: "Sweden"), Answer(name: "India"), Answer(name: "Finland")]),
        Question(image: UIImage(named: "switzerland")!,
                 answers: [Answer(name: "Liechtenstein"), Answer(name: "Switzerland", type: .correct), Answer(name: "Denmark"), Answer(name: "Monaco")]),
        Question(image: UIImage(named: "brazil")!,
                 answers: [Answer(name: "Brazil", type: .correct), Answer(name: "Bolivia"), Answer(name: "Argentina"), Answer(name: "Australia")]),
        Question(image: UIImage(named: "belgium")!,
                 answers: [Answer(name: "Germany"), Answer(name: "Belgium", type: .correct), Answer(name: "Lithuania"), Answer(name: "Austria")]),
        Question(image: UIImage(named: "norway")!,
                 answers: [Answer(name: "Norway", type: .correct), Answer(name: "Denmark"), Answer(name: "Sweden"), Answer(name: "Netherlands")]),
        Question(image: UIImage(named: "cyprus")!,
                 answers: [Answer(name: "Greece"), Answer(name: "Cyprus", type: .correct), Answer(name: "Malta"), Answer(name: "Dominican Republic")]),
        Question(image: UIImage(named: "india")!,
                 answers: [Answer(name: "India", type: .correct), Answer(name: "Nepal"), Answer(name: "Grenada"), Answer(name: "Pakistan")]),
        Question(image: UIImage(named: "japan")!,
                 answers: [Answer(name: "Japan", type: .correct), Answer(name: "China"), Answer(name: "Mongolia"), Answer(name: "North Korea")]),
        Question(image: UIImage(named: "iran")!,
                 answers: [Answer(name: "Iraq"), Answer(name: "Turkmenistan"), Answer(name: "Iran", type: .correct), Answer(name: "Syria")]),
        Question(image: UIImage(named: "kazakhstan")!,
                 answers: [Answer(name: "Kyrgyzstan"), Answer(name: "Uzbekistan"), Answer(name: "Kazakhstan", type: .correct), Answer(name: "Turkmenistan")])
    
    ]
}
