//
//  ViewController.swift
//  clickerGame
//
//  Created by JAYDEN SAWYER on 9/25/24.
//
class points{
    static var points = 0
}

import UIKit

class ViewController: UIViewController {
   var count = 0
    @IBOutlet weak var coinLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func clickAction(_ sender: UIButton) {
        count += 1
        coinLabel.text = "Coins: \(count)"
    }
}

