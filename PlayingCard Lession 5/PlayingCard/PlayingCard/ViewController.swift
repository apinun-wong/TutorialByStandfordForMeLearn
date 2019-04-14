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
    
    @IBOutlet weak var playingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left, .right]
            playingCardView.addGestureRecognizer(swipe)
            
            let pinch = UIPinchGestureRecognizer(target: playingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandingGestureRecognizedBy:)))
            playingCardView.addGestureRecognizer(pinch)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            playingCardView.isFaceUp = !playingCardView.isFaceUp
        default:break
        }   
    }
    
    @objc func nextCard() {
        if let card = dect.draw() {
            playingCardView.rank = card.rank.order
            playingCardView.suit = card.suit.rawValue
        }
    }
}

