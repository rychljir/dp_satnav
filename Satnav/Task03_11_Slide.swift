//
//  Task03_11_Slide.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 03.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task03_11_Slide: UIView {
    var parent: UIViewController?
    
    @IBOutlet weak var evaluate: UIButton!
    
    var correct = [1, 2, 2, 1, 2, 1, 2]
    var answered = [0, 0, 0, 0, 0, 0, 0]
    var yesButtons: [UIButton] = []
    var noButtons: [UIButton] = []

    @IBOutlet weak var yes1: UIButton!
    @IBOutlet weak var no1: UIButton!
    @IBOutlet weak var yes2: UIButton!
    @IBOutlet weak var no2: UIButton!
    @IBOutlet weak var yes3: UIButton!
    @IBOutlet weak var no3: UIButton!
    @IBOutlet weak var yes4: UIButton!
    @IBOutlet weak var no4: UIButton!
    @IBOutlet weak var yes5: UIButton!
    @IBOutlet weak var no5: UIButton!
    @IBOutlet weak var yes6: UIButton!
    @IBOutlet weak var no6: UIButton!
    @IBOutlet weak var yes7: UIButton!
    @IBOutlet weak var no7: UIButton!

    
    @IBAction func yes1Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 0)
    }
    @IBAction func no1Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 0)
    }
    @IBAction func yes2Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 1)
    }
    @IBAction func no2Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 1)
    }
    @IBAction func yes3Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 2)
    }
    @IBAction func no3Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 2)
    }
    @IBAction func yes4Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 3)
    }
    @IBAction func no4Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 3)
    }
    @IBAction func yes5Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 4)
    }
    @IBAction func no5Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 4)
    }
    @IBAction func yes6Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 5)
    }
    @IBAction func no6Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 5)
    }
    @IBAction func yes7Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 6)
    }
    @IBAction func no7Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 6)
    }

    @IBAction func evaluateClick(_ sender: UIButton) {
        sender.backgroundColor = UIColor.black
        
        
        var mistakes = 0
        for i in 1 ... answered.count-1
        {
            if(correct[i] != answered[i]){
                mistakes = mistakes + 1;
                yesButtons[i].backgroundColor = UIColor.black
                noButtons[i].backgroundColor = UIColor.black
                answered[i] = 0
            }
        }
        
        if(mistakes == 0){
            let msg = NSLocalizedString("task_ok", comment: "correct answer")
            parent!.showToast(message: msg)
            taskDone()
        }else{
            let msg = NSLocalizedString("task_fail", comment: "wrong answer")
            parent!.showToast(message: msg)
        }
    
    }
    @IBAction func evaluateRelease(_ sender: UIButton) {
        sender.backgroundColor = (parent as! ChapterViewController).chapterColors[2]
    }

    func performClick(whichButton: Bool, index: Int){
        if(whichButton){
            answered[index] = 1
        }else{
            answered[index] = 2
        }
        
        if(whichButton){
            yesButtons[index].backgroundColor = UIColor.red
            noButtons[index].backgroundColor = UIColor.black
        }else{
            yesButtons[index].backgroundColor = UIColor.black
            noButtons[index].backgroundColor = UIColor.red
        }
    }
    
    func taskDone(){
        evaluate.isEnabled = false
        evaluate.layer.borderColor = UIColor.gray.cgColor
        
        for i in 0 ... yesButtons.count-1{
            yesButtons[i].isEnabled = false
            noButtons[i].isEnabled = false
            yesButtons[i].layer.borderColor = UIColor.gray.cgColor
            noButtons[i].layer.borderColor = UIColor.gray.cgColor
            if(correct[i] == 1){
                yesButtons[i].backgroundColor = UIColor.red
                noButtons[i].backgroundColor = UIColor.black
            }else{
                yesButtons[i].backgroundColor = UIColor.black
                noButtons[i].backgroundColor = UIColor.red
            }
        }
        ApplicationState.setTaskState(index: 2, state: true)
    }
    
    
    
    func initSlide(parent chapterVc:UIViewController){
        yesButtons = [yes1, yes2, yes3, yes4, yes5, yes6, yes7]
        noButtons = [no1, no2, no3, no4, no5, no6, no7]
        self.parent = chapterVc
        
        for i in 0 ... yesButtons.count-1{
            yesButtons[i].layer.cornerRadius = 7.0;
            yesButtons[i].layer.borderColor = (parent as! ChapterViewController).chapterColors[2].cgColor
            yesButtons[i].layer.borderWidth = 1.2
            noButtons[i].layer.cornerRadius = 7.0;
            noButtons[i].layer.borderColor = (parent as! ChapterViewController).chapterColors[2].cgColor
            noButtons[i].layer.borderWidth = 1.2
        }
        evaluate.layer.cornerRadius = 7.0;
        evaluate.layer.borderColor = (parent as! ChapterViewController).chapterColors[2].cgColor
        evaluate.layer.borderWidth = 1.2
        
        if(ApplicationState.getTaskState(index: 2)){
            taskDone()
        }
    }
}
