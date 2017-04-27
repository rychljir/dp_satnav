//
//  DragDropImageSlide.swift
//  Satnav
//
//  Created by Petr Mares on 27.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit
import DragDropUI

class DragDropToLineSlide: UIView{
    
    var themeColor: UIColor?
    var parent: UIViewController?
    var eval:UIButton?
    var draggables = [UIView]()
    var lineAnswers = [UIView]()
    var originalPositions = [CGPoint]()
    var yPosAnswers = [CGFloat]()
    var correctOrder = [Int]()
    
    func evaluateAnswers() {
        eval!.backgroundColor = UIColor.black
        var correct = true
        for i in 0 ... draggables.count-1{
            if(evaluateAnswer(index: i)){
                let drag = draggables[i] as! DDView
                drag.isUserInteractionEnabled = false
            }else{
                moveViewToPosition(view: draggables[i], position: originalPositions[i])
                correct = false
            }
        }
        
        if(correct){
            let msg = NSLocalizedString("task_ok", comment: "correct answer")
            parent!.showToast(message: msg)
            taskDone()
        }else{
            let msg = NSLocalizedString("task_fail", comment: "bad answer")
            parent!.showToast(message: msg)
        }
    }
    
    func evaluateRelease(){
        eval!.backgroundColor = themeColor
    }
    
    func evaluateAnswer(index: Int) -> Bool{
        let correctPlace = correctOrder[index]
        if(draggables[index].center.y <= yPosAnswers[correctPlace]+20 && draggables[index].center.y >= yPosAnswers[correctPlace]-20){
            return true
        }
        return false
    }
    
    
    func moveViewToPosition(view: UIView, position: CGPoint){
        let drag = view as! DDView
        
        let parentView = drag.superview!
        
        let horizontalConstraint = NSLayoutConstraint(item: drag, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: parentView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: position.x)
        let verticalConstraint = NSLayoutConstraint(item: drag, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: parentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: position.y)
        drag.translatesAutoresizingMaskIntoConstraints = false
        drag.removeConstraintsWithoutDescendants()
        parentView.addConstraint(horizontalConstraint)
        parentView.addConstraint(verticalConstraint)
    }

    func initSlide(parent: UIViewController, correctOrder: [Int], colorTheme: UIColor){
        self.parent = parent
        let subs = self.allSubViews
        themeColor = colorTheme
        self.correctOrder = correctOrder
        for subView in subs {
            if(subView.tag == 1){
                eval = subView as? UIButton
            }
            if(subView.tag == 2){
                draggables.append(subView)
                originalPositions.append(subView.center)
            }
            if(subView.tag == 3){
                lineAnswers.append(subView)
                yPosAnswers.append(subView.center.y)
            }
        }
        if let evalBtn = eval {
            evalBtn.addTarget(self, action: #selector(DragDropToLineSlide.evaluateAnswers), for: .touchUpInside)
            evalBtn.addTarget(self, action: #selector(DragDropToLineSlide.evaluateRelease), for: .touchDown)
            evalBtn.isUserInteractionEnabled = true
            evalBtn.isEnabled = true
            UIApplication.shared.keyWindow!.bringSubview(toFront: evalBtn)
            evalBtn.layer.cornerRadius = 7.0;
            evalBtn.layer.borderColor = themeColor!.cgColor
            evalBtn.layer.borderWidth = 1.2
        }
        
        if(ApplicationState.getTaskState(index: 3)){
            taskDone()
        }
    }
    
    override func didMoveToSuperview() {
        //disable autolayout
        for subView in draggables {
            let drag = subView as! DDView
            
            moveViewToPosition(view: subView, position: drag.center)
            drag.ddDelegate = parent as? DDViewDelegate
        }
    }
    
    func taskDone(){
        eval!.layer.borderColor = UIColor.gray.cgColor
        for i in 0 ... draggables.count-1{
            draggables[i].isUserInteractionEnabled = false
            eval?.isEnabled = false
            let posX = draggables[i].center.x
            let posY = yPosAnswers[i]
            let pos = CGPoint(x: posX, y: posY)
            moveViewToPosition(view: draggables[i],position: pos)
        }
        
         ApplicationState.setTaskState(index: 3, state: true)
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

