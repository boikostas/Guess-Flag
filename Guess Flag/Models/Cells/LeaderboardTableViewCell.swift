//
//  LeaderboardTableViewCell.swift
//  Guess Flag
//
//  Created by Стас Бойко on 21.10.2022.
//

import UIKit

class LeaderboardTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var scoresLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func addData(name: String, score: Int) {
        nameLabel.text = name
        scoresLabel.text = String(score)
    }
    
}
