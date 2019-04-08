//
//  PlayingCardView.swift
//  PlayingCard
//
//  Created by Apinun Wongintawang on 3/24/19.
//  Copyright © 2019 Apinun Wongintawang. All rights reserved.
//

import UIKit

class PlayingCardView: UIView {
    var rank: Int = 5 { didSet { setNeedsDisplay(); setNeedsLayout()} }
    var suit: String = "♥︎" { didSet { setNeedsDisplay(); setNeedsLayout()} }
    var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout()} }
    
    private func centerAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
    }
    
    private var cornerString: NSAttributedString {
        return centerAttributedString 
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
    }
}




//override func draw(_ rect: CGRect) {
//    let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: 16.0)
//
//    //        if let context = UIGraphicsGetCurrentContext() {
//    //            context.addArc(center: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//    //            context.setLineWidth(5.0)
//    //            UIColor.green.setFill()
//    //            UIColor.red.setStroke()
//    //            context.strokePath()
//    //            context.fillPath()
//    //        }
//    //
//    //        let path = UIBezierPath()
//    //        path.addArc(withCenter: CGPoint(x: bounds.midX, y: bounds.midY), radius: 100.0, startAngle: 0, endAngle: 2*CGFloat.pi, clockwise: true)
//    //        path.lineWidth = 5.0
//    //        UIColor.green.setFill()
//    //        UIColor.red.setStroke()
//    //        path.stroke()
//    //        path.fill()
//}
