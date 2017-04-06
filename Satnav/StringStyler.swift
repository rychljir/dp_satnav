//
//  StringStyler.swift
//  Satnav
//
//  Created by Petr Mares on 31.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class StringStyler{
    
    //method for string conversation
    func convertText(inputText: String) -> NSAttributedString {
        
        var attrString = NSMutableAttributedString(string: inputText)
        let boldFont = UIFont(name: "Helvetica-Bold", size: 20)
        let italicFont = UIFont(name: "Verdana-Italic", size: 20)
        let fontForIndex:UIFont? = UIFont(name: "Helvetica", size:15)
        
        attrString = fixText(inputText: attrString, attributeName: NSBaselineOffsetAttributeName as AnyObject, attributeValue: -5 as AnyObject, propsIndicator: "<sub>", propsEndIndicator: "</sub>")
        attrString = fixText(inputText: attrString, attributeName: NSBaselineOffsetAttributeName as AnyObject, attributeValue: 5 as AnyObject, propsIndicator: "<sup>", propsEndIndicator: "</sup>")
        attrString = fixText(inputText: attrString, attributeName: NSFontAttributeName as AnyObject, attributeValue: boldFont!, propsIndicator: "<b>", propsEndIndicator: "</b>")
        attrString = fixText(inputText: attrString, attributeName: NSFontAttributeName as AnyObject, attributeValue: fontForIndex!, propsIndicator: "<small>", propsEndIndicator: "</small>")
        attrString = fixText(inputText: attrString, attributeName: NSFontAttributeName as AnyObject, attributeValue: boldFont!, propsIndicator: "<b>", propsEndIndicator: "</b>")
        attrString = fixText(inputText: attrString, attributeName: NSUnderlineStyleAttributeName as AnyObject, attributeValue: NSUnderlineStyle.styleDouble.rawValue as AnyObject, propsIndicator: "<u>", propsEndIndicator: "</u>")
        attrString = fixText(inputText: attrString, attributeName: NSFontAttributeName as AnyObject, attributeValue: italicFont!, propsIndicator: "<i>", propsEndIndicator: "</i>")
        
        return attrString
    }
    
    func fixText(inputText:NSMutableAttributedString, attributeName:AnyObject, attributeValue:AnyObject, propsIndicator:String, propsEndIndicator:String)->NSMutableAttributedString{
        var r1 = (inputText.string as NSString).range(of: propsIndicator)
        while r1.location != NSNotFound {
            let r2 = (inputText.string as NSString).range(of: propsEndIndicator)
            if r2.location != NSNotFound  && r2.location > r1.location {
                let r3 = NSMakeRange(r1.location + r1.length, r2.location - r1.location - r1.length)
                inputText.addAttribute(attributeName as! String, value: attributeValue, range: r3)
                inputText.replaceCharacters(in: r2, with: "")
                inputText.replaceCharacters(in: r1, with: "")
            } else {
                break
            }
            r1 = (inputText.string as NSString).range(of: propsIndicator)
        }
        return inputText
    }
    
}
