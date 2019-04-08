//
//  ViewController.swift
//  Tutorial1
//
//  Created by Apinun Wongintawang on 8/19/18.
//  Copyright © 2018 Apinun Wongintawang. All rights reserved.
//

import UIKit

class ConcentrateViewController: UIViewController {
    //MARK: View Properties
    @IBOutlet private weak var flipsCountLabel: UILabel!
    @IBOutlet private var cardButtons: [UIButton]!
    
    private lazy var game =  Concentration(numberOfPairsOfCard: numberOfPairOfCard)
    private var numberOfPairOfCard: Int {
        return (cardButtons.count + 1) / 2
    }
    
    //MARK: Properties
    fileprivate func udpateFlipCountLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.cyan
        ]
        let attributedString = NSAttributedString(string: "Flips: \(flipCount)", attributes: attributes)
        flipsCountLabel.attributedText = attributedString
    }
    
    var flipCount: Int = 0{
        didSet{
            udpateFlipCountLabel()
        }
    }
    
    private func configureI(){
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureI()
    }
    
    private func updateFromViewModel(){
        guard cardButtons != nil else {
            return
        }
        
        for index in self.cardButtons.indices{
            let button = cardButtons[index]
            let card = self.game.cards[index]
            if card.isFaceUp == true{
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: .normal)
                button.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
            }
        }
    }
    
//    private var emojiChoices: Array<String> = ["🐱", "🐷", "🐭", "🐨", "🔥", "💂🏻‍♀️", "🦄", "👨‍🔧"]
    private var emojiChoices: String = "🐱🐷🐭🐨🔥💂🏻‍♀️🦄👨‍🔧"
    private var emoji = [Card: String]()
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateFromViewModel()
        }
    }
    
    private func emoji(for card: Card) -> String {
        
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomStringIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomStringIndex))
        }
        
        return emoji[card] ?? "?"
    }
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        
        if let cardNumber = cardButtons.index(of: sender){
            
            self.game.chooseCard(at: cardNumber)
            self.updateFromViewModel()
        }else{
            print("choosen card was not in cardButtons.")
        }
        
    }
}

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(self)))
        } else {
            return 0
        }
    }
}

