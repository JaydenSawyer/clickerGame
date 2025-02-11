//
//  ViewController2.swift
//  clickerGame
//
//  Created by JAYDEN SAWYER on 1/10/25.
//

import UIKit

class ViewController2: UIViewController {

    @IBOutlet weak var coinLabel: UILabel!
    @IBOutlet weak var error2Label: UILabel!
    @IBOutlet weak var error1Label: UILabel!
    var coins = 0
    var defaults = UserDefaults.standard
    override func viewDidLoad() {
        super.viewDidLoad()
        AppData.buttonClicked = defaults.integer(forKey: "Up")
        coinLabel.text = "Coins: \(AppData.count2)"
    }
    
    @IBAction func upgrade1Button(_ sender: UIButton) {
        if AppData.count2 >= 75{
            AppData.count2 -= 75
            AppData.click *= 2
            coinLabel.text =  "Coins: \( AppData.count2)"
            AppData.buttonClicked += 1
            defaults.set(AppData.buttonClicked, forKey: "Up")
            print(AppData.buttonClicked)
        } else {
            error1Label.text = "You do not have enough coins to buy this upgrade "
        }
            }
    
    @IBAction func upgrade2Button(_ sender: UIButton) {
        if AppData.count2 >= 1000{
            AppData.count2 -= 1000
            AppData.click *= 4
            coinLabel.text = "Coins: \( AppData.count2)"
            defaults.set(AppData.buttonClicked, forKey: "Up")
            print(AppData.buttonClicked)
        } else {
            error2Label.text = "You do not have enough coins to buy this upgrade "
        }
    }
    
    

}
