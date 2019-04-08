//
//  ProtocolExt.swift
//  Tutorial1
//
//  Created by Apinun Wongintawang on 1/24/19.
//  Copyright © 2019 Apinun Wongintawang. All rights reserved.
//

import Foundation

extension Array: TextRepresentable where Element: TextRepresentable {
    var textualDescription: String {
        let itemsAsText = self.map { $0.textualDescription }
        return "[" + itemsAsText.joined(separator: ", ") + "]"
    }
}

protocol TextRepresentable {
    var textualDescription: String { get }
}

class Dice: TextRepresentable {
    var slide: Int = 10
    var textualDescription: String {
        return "A \(slide)-sided dice"
    }
}
