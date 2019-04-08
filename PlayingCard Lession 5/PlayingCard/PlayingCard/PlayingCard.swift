//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Apinun Wongintawang on 3/17/19.
//  Copyright © 2019 Apinun Wongintawang. All rights reserved.
//

import Foundation

struct PlayingCard: CustomStringConvertible {
    var description: String {
        return "\(rank) \(suit)"
    }
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String {
        case spades = "♠︎"
        case hearts = "♥︎"
        case diamonds = "♦︎"
        case clubs = "♣︎"
        
        static var all = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
    }
    
    enum Rank {
        case ace
        case face(String)
        case numberic(Int)
        
        var order: Int {
            switch self {
            case .ace: return 1
            case .numberic(let pips): return pips
            case .face(let kind) where kind == "J" : return 11
            case .face(let kind) where kind == "Q" : return 12
            case .face(let kind) where kind == "K" : return 13
            default: return 0
            }
        }
        
        static var all: [Rank] {
            var allRanks = [Rank.ace]
            for pips in 2...10 {
                allRanks.append(Rank.numberic(pips))
            }
            allRanks += [Rank.face("J"), Rank.face("Q"), Rank.face("K")]
            return allRanks
        }
    }
}
