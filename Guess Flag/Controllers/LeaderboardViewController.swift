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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
