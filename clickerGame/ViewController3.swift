//
//  ViewController3.swift
//  clickerGame
//
//  Created by JAYDEN SAWYER on 2/10/25.
//

import UIKit

class ViewController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var games = ["Game: 1", "Game: 2", "Game: 3", "Game: 4", "Game: 5"]


    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        // Do any additional setup after loading the view.
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
