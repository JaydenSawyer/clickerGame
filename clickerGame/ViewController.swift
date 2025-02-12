//
//  ViewController.swift
//  clickerGame
//
//  Created by JAYDEN SAWYER on 2/10/25.
//

import UIKit
import FirebaseCore
import FirebaseDatabase

class Players {
    var score = AppData.count2
    var names = ""
    var ref = Database.database().reference()
    
    func saveToFirebase() {
        let dict = ["name": names, "score": score] as [String: Any]
        ref.child("Leaderboard").childByAutoId().setValue(dict)
    }
}

class AppData {
    static var count2 = 0
    static var click = 1
    static var buttonClicked = 0
    static var name = ""
}

class ViewController: UIViewController {
    var playersArray: [Players] = []
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    var defaults = UserDefaults.standard
    var ref: DatabaseReference!
    @IBOutlet weak var coinLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        AppData.count2 = defaults.integer(forKey: "EndScore")
        AppData.click = defaults.integer(forKey: "Up")
        AppData.name = defaults.string(forKey: "Name") ?? ""
        nameLabel.text = AppData.name
        nameField.text = AppData.name
        coinLabel.text = "Coins: \(AppData.count2)"
    }
    
    @IBAction func clickAction(_ sender: UIButton) {
        AppData.count2 += AppData.click
        coinLabel.text = "Coins: \(AppData.count2)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        coinLabel.text = "Coins: \(AppData.count2)"
    }
    
    @IBAction func saveButton(_ sender: UIButton) {
        defaults.set(AppData.count2, forKey: "EndScore")
        defaults.set(AppData.click, forKey: "Up")
        if let name = nameField.text {
            AppData.name = name
            defaults.set(AppData.name, forKey: "Name")
            nameLabel.text = AppData.name
        }
    }
    
    @IBAction func ResetButton(_ sender: UIButton) {
        AppData.count2 = 0
        AppData.click = 1
        AppData.name = ""
        nameLabel.text = ""
        coinLabel.text = "Coins: \(AppData.count2)"
    }
    
    @IBAction func LeaderBoardButton(_ sender: UIButton) {
        let player = Players()
        player.names = nameField.text ?? "Unknown"
        player.score = AppData.count2
        playersArray.append(player)
        player.saveToFirebase()
    }
}
