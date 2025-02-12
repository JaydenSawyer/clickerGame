//
//  ViewController3.swift
//  clickerGame
//
//  Created by JAYDEN SAWYER on 2/10/25.
//
import UIKit
import FirebaseDatabaseInternal

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var games = [String]()
    @IBOutlet weak var tableView: UITableView!
    var ref: DatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        ref = Database.database().reference()
        loadLeaderboard()
    }
    
    func loadLeaderboard() {
        ref.child("Leaderboard").observe(.value) { snapshot in
            self.games.removeAll()
            for child in snapshot.children {
                if let childSnapshot = child as? DataSnapshot,
                   let dict = childSnapshot.value as? [String: Any],
                   let name = dict["name"] as? String,
                   let score = dict["score"] as? Int {
                    self.games.append("\(name): \(score) Coins")
                }
            }
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")!
        cell.textLabel?.text = games[indexPath.row]
        return cell
    }
}
