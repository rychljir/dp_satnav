//
//  DragDropToMiddleSlide.swift
//  Satnav
//
//  Created by Petr Mares on 28.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit
import DragDropUI

class DragDropToMiddleSlide: UIView {
    
    var themeColor: UIColor?
    var parent: UIViewController?
    var eval:UIButton?
    var draggables = [UIView]()
    var lineAnswers = [UIView]()
    var originalPositions = [CGPoint]()
    var yPosAnswers = [CGFloat]()
    var correctOrder = [Int]()
    var indexOfChapter:Int?
    
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
        let dy = Float(draggables[index].center.y)
        let dx = Float(draggables[index].center.x)
        let amaxy = Float(lineAnswers[correctPlace].frame.maxY)
        let amaxx = Float(lineAnswers[correctPlace].frame.maxX)
        let aminy = Float(lineAnswers[correctPlace].frame.minY)
        let aminx = Float(lineAnswers[correctPlace].frame.minX)
        print("dx: ", dx)
        print("dy: ", dy)
        print("maxx: ", amaxx)
        print("minx: ", aminx)
        print("maxy: ", amaxy)
        print("miny: ", aminy)
        if(Float(draggables[index].center.y) <= Float(lineAnswers[correctPlace].frame.maxY) && Float(draggables[index].center.y) >= Float(lineAnswers[correctPlace].frame.minY) &&
            Float(draggables[index].center.x) <= Float(lineAnswers[correctPlace].frame.maxX) && Float(draggables[index].center.x) >= Float(lineAnswers[correctPlace].frame.minX) ){
            return true
        }
        return false
    }
    
    
    func moveViewToPosition(view: UIView, position: CGPoint){
        let drag = view
        
        let parentView = drag.superview!
        
        let horizontalConstraint = NSLayoutConstraint(item: drag, attribute: NSLayoutAttribute.centerX, relatedBy: NSLayoutRelation.equal, toItem: parentView, attribute: NSLayoutAttribute.leading, multiplier: 1, constant: position.x)
        let verticalConstraint = NSLayoutConstraint(item: drag, attribute: NSLayoutAttribute.centerY, relatedBy: NSLayoutRelation.equal, toItem: parentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: position.y)
        drag.translatesAutoresizingMaskIntoConstraints = false
        
        drag.setNeedsLayout()
        parentView.setNeedsLayout()
        drag.removeConstraintsWithoutDescendants()
        parentView.addConstraint(horizontalConstraint)
        parentView.addConstraint(verticalConstraint)
    }
    
    func snapView(view dropped: UIView, toPosition: CGPoint){
        let currentPosX = dropped.center.x
        let currentPosY = dropped.center.y
        var foundIndex = -1
        for i in 0 ... lineAnswers.count-1{
            if(currentPosY <= lineAnswers[i].frame.maxY && currentPosY >= lineAnswers[i].frame.minY &&
                currentPosX <= lineAnswers[i].frame.maxX && currentPosX >= lineAnswers[i].frame.minX){
                    foundIndex = i
                    break
            }
        }
        
        if(foundIndex>=0){
            let posX = lineAnswers[foundIndex].center.x
            let posY = lineAnswers[foundIndex].center.y
            let pos = CGPoint(x: posX, y:posY)
            moveViewToPosition(view: dropped, position: pos)
        }else{
            let posX = currentPosX
            let posY = currentPosY
            let pos = CGPoint(x: posX, y:posY)
            moveViewToPosition(view: dropped, position: pos)
        }
    }
    
    func initSlide(parent: UIViewController, correctOrder: [Int], colorTheme: UIColor, indexOfChapter: Int){
        self.parent = parent
        let subs = self.allSubViews
        self.indexOfChapter = indexOfChapter
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
        
    }
    
    override func didMoveToSuperview() {
        //disable autolayout
        for subView in lineAnswers {
            moveViewToPosition(view: subView, position: subView.center)
        }
        
        for subView in draggables {
            let drag = subView as! DDView
            
            moveViewToPosition(view: subView, position: drag.center)
            drag.ddDelegate = parent as? DDViewDelegate
        }
        
        
        
        (parent as! ChapterViewController).ddToMiddleSlide = self
        
        if(ApplicationState.getTaskState(index: indexOfChapter!)){
            taskDone()
        }
        
    }
    
    func taskDone(){
        eval!.layer.borderColor = UIColor.gray.cgColor
        for i in 0 ... draggables.count-1{
            draggables[i].isUserInteractionEnabled = false
            eval?.isEnabled = false
            let posX = lineAnswers[correctOrder[i]].center.x
            let posY = lineAnswers[correctOrder[i]].center.y
            print("posX: ", posX)
            print("posY: ", posY)
            let pos = CGPoint(x: posX, y: posY)
            moveViewToPosition(view: draggables[i],position: pos)
            draggables[i].superview!.bringSubview(toFront: draggables[i])
        }
        ApplicationState.setTaskState(index: indexOfChapter!, state: true)
    }
}
