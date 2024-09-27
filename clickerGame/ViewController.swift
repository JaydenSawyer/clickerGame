//
//  ViewController.swift
//  clickerGame
//
//  Created by JAYDEN SAWYER on 9/25/24.
//
class AppData{
    static var count2 = 0
    static var click = 1
}

import UIKit

class ViewController: UIViewController {
   var count = 0
    @IBOutlet weak var coinLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func clickAction(_ sender: UIButton) {
        AppData.count2 += AppData.click
        coinLabel.text = "Coins: \(AppData.count2)"
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        
        //let nvc = segue.destination as! ViewController2
        //nvc.coins = count
    }
    override func viewWillAppear(_ animated: Bool) {
        coinLabel.text = "Coins: \(AppData.count2)"
    }
    
}

