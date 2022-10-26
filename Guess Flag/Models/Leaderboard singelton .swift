//
//  Leaderboard singelton .swift
//  Guess Flag
//
//  Created by Стас Бойко on 26.10.2022.
//

import Foundation

class LeaderboardData {
    static var shared = LeaderboardData()
    var leaderboard = [Leaderboard]()
    
    private init() {}
    
    func decodeFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: "leaderboard") {
            do {
                let decoder = JSONDecoder()
                leaderboard = try decoder.decode([Leaderboard].self, from: data)
            } catch {
                print("Unable to decoded Leaderboard \(error)")
            }
        }
    }
    
    func encodeToUserDefaults() {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(leaderboard)
            UserDefaults.standard.set(data, forKey: "leaderboard")
        } catch {
            print("Unable to encode array of Leaderboard: \(error)")
        }
    }
}
