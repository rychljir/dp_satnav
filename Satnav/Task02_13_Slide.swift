//
//  Task02_13_Slide.swift
//  Satnav
//
//  Created by Petr Mares on 30.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task02_13_Slide: UIView {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var taskDesc: UILabel!
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    var parent: UIViewController?
    var answerIndex = -1
    var buttons:[UIButton] = []

    @IBAction func btn1Click(_ sender: UIButton) {
        evaluateAnswer(0)
    }

    @IBAction func btn2Click(_ sender: UIButton) {
        evaluateAnswer(1)
    }
    
    @IBAction func btn3Click(_ sender: UIButton) {
        evaluateAnswer(2)
    }
    
    @IBAction func btn4Click(_ sender: UIButton) {
        evaluateAnswer(3)
    }
    
    @IBAction func btn5Click(_ sender: UIButton) {
        evaluateAnswer(4)
    }
    
    func evaluateAnswer(_ index: Int){
        if(index == answerIndex){
            let msg = NSLocalizedString("task_ok", comment: "correct answer")
            parent!.showToast(message: msg)
            taskDone()
        }else {
            let msg = NSLocalizedString("task_fail", comment: "wrong aswer")
            let hint = NSLocalizedString("task02_13_hint", comment: "hint")
            parent!.showToast(message: "\(msg)\n\(hint)")
        }
    }
    
    func initSlide(taskTitle title:String, description descText: String, taskOptions taskValues: [String],parent chapterVc:UIViewController){
        answerIndex = Int(arc4random_uniform(4))
        let stringStyler = StringStyler()
        let formattedFilledTask = "\(descText) \(taskValues[answerIndex])."
        let taskValue = stringStyler.convertText(inputText: formattedFilledTask)
        
        taskTitle.text = title
        taskDesc.attributedText = taskValue
        
        self.parent = chapterVc
    }
    
    func taskDone(){
        for btn in buttons {
            btn.isEnabled = false
        }
    }

}
