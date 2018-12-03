//
//  UILabelExtension.swift
//  Kobeios
//
//  Created by Thomas Delgado on 27/08/18.
//

import Foundation
import UIKit

public extension UILabel {
    
    func setCharacterSpacing(characterSpacing: CGFloat = 0.0) {
        guard let labelText = text else { return }
        
        let attributedString: NSMutableAttributedString
        if let labelAttributedText = attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelAttributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // Character spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSMakeRange(0, attributedString.length))
        
        attributedText = attributedString
    }
    
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {
        
        guard let labelText = self.text else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineSpacing
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        
        let attributedString:NSMutableAttributedString
        if let labelattributedText = self.attributedText {
            attributedString = NSMutableAttributedString(attributedString: labelattributedText)
        } else {
            attributedString = NSMutableAttributedString(string: labelText)
        }
        
        // (Swift 4.2 and above) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        
        // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
        
        self.attributedText = attributedString
    }
    
    func setFont(fontName: String, fontSize: CGFloat) {
        self.font = UIFont(name: fontName, size: fontSize)
    }
    
    func setFontColor(color: UIColor) {
        self.textColor = color
    }
    
    func configure(text: String, fontName: String="SF Mono Regular", fontSize: CGFloat=15.0, textColor: UIColor=UIColor.black, lineSpacing: CGFloat=0.0, characterSpacing: CGFloat=0.0) {
        self.text = text
        self.setFont(fontName: fontName, fontSize: fontSize)
        self.setFontColor(color: textColor)
        self.setLineSpacing(lineSpacing: lineSpacing)
        self.setCharacterSpacing(characterSpacing: characterSpacing)
    }
}
