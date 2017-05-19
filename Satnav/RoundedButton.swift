//
//  RoundedButton.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 24.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//
import Foundation
import UIKit

/*
 
 Object which customizes UIButton
 
 */
class RoundedButton: UIButton {

    required init(coder aDecoder: (NSCoder!)) {
        super.init(coder: aDecoder)!
        self.layer.cornerRadius = 7.0;
        self.layer.borderColor = tintColor.cgColor
        self.layer.borderWidth = 1.2
        self.titleEdgeInsets = UIEdgeInsets(top: 20.0, left: 10.0, bottom: 20.0, right: 10.0)
        self.setTitleColor(tintColor, for: .normal)
        self.setTitleColor(UIColor.black, for: .highlighted)
        self.setTitleColor(UIColor.gray, for: .disabled)
    }

    override open var isHighlighted: Bool {
        didSet {
            if(isHighlighted){
                self.backgroundColor = tintColor
            }else{
                self.backgroundColor = UIColor.black
            }
        }
    }
    
    override open var isEnabled: Bool {
        didSet {
            if(!isEnabled){
                self.layer.borderColor = UIColor.gray.cgColor
            }
        }
    }
}
