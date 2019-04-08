//
//  ViewController.swift
//  PlayingCard
//
//  Created by Apinun Wongintawang on 3/17/19.
//  Copyright © 2019 Apinun Wongintawang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dect = PlayingCardDeck()

    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = dect.draw() {
                print("\(card)")
            }
        }
    }


}

