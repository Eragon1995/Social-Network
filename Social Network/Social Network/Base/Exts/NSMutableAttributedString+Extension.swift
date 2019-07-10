//
//  NSMutableAttributedString+Extension.swift
//  TokyoLife
//
//  Created by Tran Van Dinh on 7/24/18.
//  Copyright © 2018 EGLIFE. All rights reserved.
//

import Foundation
import UIKit
extension NSMutableAttributedString {
    @discardableResult func bold(_ text: String,fontName : String ,fontsize : CGFloat, textColor : UIColor) -> NSMutableAttributedString
    {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontsize)!, NSAttributedString.Key.foregroundColor: textColor ]
        let boldString = NSMutableAttributedString(string:text, attributes: attrs)
        append(boldString)
        return self
    }
    @discardableResult func normal(_ text: String,fontName : String ,fontsize : CGFloat, textColor : UIColor) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.font: UIFont(name: fontName, size: fontsize)!, NSAttributedString.Key.foregroundColor: textColor ]
        let normalString = NSMutableAttributedString(string:text, attributes: attrs)
        append(normalString)
        return self
    }
    @discardableResult func underline(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineString = NSMutableAttributedString(string:text, attributes: attrs)
        append(underlineString)
        return self
    }
    @discardableResult func strike(_ text: String) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        let strikeString = NSMutableAttributedString(string:text, attributes: attrs)
        append(strikeString)
        return self
    }
    @discardableResult func strikeAndUnderline(_ strikeText: String,_ strikeAndUnderlineText : String) -> NSMutableAttributedString {
        
        let attrs: [NSAttributedString.Key: Any] = [.strikethroughStyle: NSUnderlineStyle.single.rawValue]
        let strikeString = NSMutableAttributedString(string:strikeText, attributes: attrs)
        append(strikeString)
        
        let sAndUattrs: [NSAttributedString.Key: Any] = [.strikethroughStyle: NSUnderlineStyle.single.rawValue,.underlineStyle: NSUnderlineStyle.single.rawValue]
        let strikeAndUnderline = NSMutableAttributedString(string:strikeAndUnderlineText, attributes: sAndUattrs)
        append(strikeAndUnderline)
        return self
    }
    @discardableResult func textColorAndBackgroundColor(_ text: String,textColor : UIColor,backgroundColor : UIColor) -> NSMutableAttributedString {
        let attrs: [NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: textColor,NSAttributedString.Key.backgroundColor : backgroundColor]
        let attrString = NSMutableAttributedString(string:text, attributes: attrs)
        append(attrString)
        return self
    }
}
