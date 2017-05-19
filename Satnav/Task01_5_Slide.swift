//
//  Task01_5_Slide.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 28.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task01_5_Slide: UIView {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var desc: UITextView!

    @IBOutlet weak var img1: UIButton!
    @IBOutlet weak var img2: UIButton!
    @IBOutlet weak var img3: UIButton!
    @IBOutlet weak var img4: UIButton!
    @IBOutlet weak var img5: UIButton!
    @IBOutlet weak var img6: UIButton!

    var subTitles: [String] = []
    var texts: [String] = []
    var buttons: [UIButton] = []

    @IBAction func img1Click(_ sender: UIButton) {
        performClick(buttonIndex: 0)
    }
    
    @IBAction func img2Click(_ sender: UIButton) {
        performClick(buttonIndex: 1)    }
    
    @IBAction func img3Click(_ sender: UIButton) {
        performClick(buttonIndex: 2)    }

    
    @IBAction func img4Click(_ sender: UIButton) {
        performClick(buttonIndex: 3)
    }


    @IBAction func img5Click(_ sender: UIButton) {
        performClick(buttonIndex: 4)    }

    @IBAction func img6Click(_ sender: UIButton) {
        performClick(buttonIndex: 5)    }
    
    func performClick(buttonIndex index:Int){
        for i in 0 ... buttons.count-1{
            if(i == index){
                buttons[i].alpha = 1
                textTitle.text = subTitles[i]
                desc.text = texts[i]
            }else{
                buttons[i].alpha = 0.3
            }
        }
    }
    
    func initSlide(){
        taskTitle.text = NSLocalizedString("task01_5_title",comment:"task title")
        textTitle.text = ""
        desc.text = NSLocalizedString("task01_5_text",comment:"intro text")
        
        subTitles = [NSLocalizedString("task01_5_titleText1",comment:"text"),NSLocalizedString("task01_5_titleText2",comment:"text"),NSLocalizedString("task01_5_titleText3",comment:"text"),NSLocalizedString("task01_5_titleText4",comment:"text"),NSLocalizedString("task01_5_titleText5",comment:"text"),NSLocalizedString("task01_5_titleText6",comment:"text")]
        texts = [NSLocalizedString("task01_5_text1",comment:"text"),NSLocalizedString("task01_5_text2",comment:"text"),NSLocalizedString("task01_5_text3",comment:"text"),NSLocalizedString("task01_5_text4",comment:"text"),NSLocalizedString("task01_5_text5",comment:"text"),NSLocalizedString("task01_5_text6",comment:"text")]
        
        buttons = [img1, img2, img3, img4, img5, img6]
    }
    
    func setTitleTextColor(_ color:UIColor){
        taskTitle.textColor = color
    }
}
