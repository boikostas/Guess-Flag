//
//  LeaderboardViewController.swift
//  Guess Flag
//
//  Created by Стас Бойко on 21.10.2022.
//

import UIKit

class LeaderboardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var leaderboard = [Leaderboard]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "LeaderboardTableViewCell", bundle: nil), forCellReuseIdentifier: "leaderboard cell")
        
        leaderboard = LeaderboardData.shared.leaderboard.sorted { $0.score > $1.score }
    }

}

extension LeaderboardViewController: UITableViewDelegate {
    
}

extension LeaderboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leaderboard.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "leaderboard cell") as? LeaderboardTableViewCell else { return UITableViewCell() }
        
        cell.addData(name: leaderboard[indexPath.row].name, score: leaderboard[indexPath.row].score)
        
        return cell
        
    }
    
    
}
