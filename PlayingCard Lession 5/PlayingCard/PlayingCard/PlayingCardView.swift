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
    var suit: String = "♥️" { didSet { setNeedsDisplay(); setNeedsLayout()} }
    var isFaceUp: Bool = true { didSet { setNeedsDisplay(); setNeedsLayout()} }
    
    private lazy var upperLeftCornerLabel: UILabel = createCornerLabel()
    private lazy var upperRightCornerLabel: UILabel = createCornerLabel()

    private func createCornerLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        addSubview(label)
        return label
    }
    
    private func configureCornerLabel(_ label: UILabel) {
        label.attributedText = cornerString
        label.frame.size = .zero
        label.sizeToFit()
        label.isHidden = !isFaceUp
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        configureCornerLabel(upperLeftCornerLabel)
        upperLeftCornerLabel.frame.origin = bounds.origin.offsetBy(dx: cornerOffset, dy: cornerOffset)
    }
    
    private func centerAttributedString(_ string: String, fontSize: CGFloat) -> NSAttributedString {
        var font = UIFont.preferredFont(forTextStyle: .body).withSize(fontSize)
        font = UIFontMetrics(forTextStyle: .body).scaledFont(for: font)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .center
        return NSAttributedString(string: string, attributes: [.paragraphStyle: paragraphStyle, .font: font])
    }
    
    private var cornerString: NSAttributedString {
        return centerAttributedString("\(rank)\n\(suit)", fontSize: cornerFontSize)
    }
    
    override func draw(_ rect: CGRect) {
        let roundedRect = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        roundedRect.addClip()
        UIColor.white.setFill()
        roundedRect.fill()
    }
}

extension PlayingCardView {
    private struct SizeRatio {
        static let cornerFontSizeToBoundsHeight: CGFloat = 0.085
        static let cornerRadiusToBoundsHeight: CGFloat = 0.06
        static let cornerOffsetToCornerRadius: CGFloat = 0.33
        static let forceCardImageSizeToBoundsSize: CGFloat = 0.75
    }
    
    private var cornerRadius: CGFloat {
        return bounds.size.height * SizeRatio.cornerRadiusToBoundsHeight
    }
    
    private var cornerOffset: CGFloat {
        return cornerRadius * SizeRatio.cornerOffsetToCornerRadius
    }
    
    private var cornerFontSize: CGFloat {
        return cornerRadius * SizeRatio.cornerFontSizeToBoundsHeight
    }
    
    private var rankString: String {
        switch rank {
        case 1: return "A"
        case 2...10: return String(rank)
        case 11: return "J"
        case 12: return "Q"
        case 13: return "K"
        default: return "?"
        }
    }
}

extension CGRect {
    var leftHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    
    var rightHalf: CGRect {
        return CGRect(x: minX, y: minY, width: width/2, height: height)
    }
    
    func inset(by size: CGSize) -> CGRect {
        return insetBy(dx: size.width, dy: size.height)
    }
    
    func sized(by size: CGSize) -> CGRect {
        return CGRect(origin: origin, size: size)
    }
    
    func zoom(by scale: CGFloat) -> CGRect {
        let newHeight = height * scale
        let newWidth = width * scale
        return insetBy(dx: (width - newWidth)/2, dy: (height-newHeight)/2)
    }
}

extension CGPoint {
    func offsetBy(dx: CGFloat, dy: CGFloat) -> CGPoint {
        return CGPoint(x: x+dx, y: y+dy)
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
