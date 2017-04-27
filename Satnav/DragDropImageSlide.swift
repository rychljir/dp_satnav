//
//  DragDropImageSlide.swift
//  Satnav
//
//  Created by Petr Mares on 27.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit
import DragDropUI

class DragDropImageSlide: UIView{
    
    var parent: UIViewController?
    var eval:UIButton?
    var draggables = [UIView]()
    

    func initSlide(parent: UIViewController){
        self.parent = parent
        let subs = self.allSubViews
        for subView in subs {
            if(subView.tag==1){
                eval = subView as? UIButton
            }
            if(subView.tag==2){
                draggables.append(subView)
            }
        }
    }
    
    override func didMoveToSuperview() {
        for subView in draggables {
            let drag = subView as! DDView
            drag.ddDelegate = parent as? DDViewDelegate
            
            let parentView = drag.superview!
            
            let horizontalConstraint = NSLayoutConstraint(item: drag, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: parentView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: drag.center.x)
            let verticalConstraint = NSLayoutConstraint(item: drag, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: parentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: drag.center.y)
            drag.translatesAutoresizingMaskIntoConstraints = false
            drag.removeConstraintsWithoutDescendants()
            parentView.addConstraint(horizontalConstraint)
            parentView.addConstraint(verticalConstraint)

        }
    }
}

extension UIView {
    var allSubViews : [UIView] {
        var array = [self.subviews].flatMap {$0}
        array.forEach { array.append(contentsOf: $0.allSubViews) }
        return array
    }
    
    func removeConstraintsWithoutDescendants() {
        
        let constraints = self.superview?.constraints.filter{
            $0.firstItem as? UIView == self || $0.secondItem as? UIView == self
            } ?? []
        
        self.superview?.removeConstraints(constraints)
        //self.removeConstraints(self.constraints)
    
    }
}

