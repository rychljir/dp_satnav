//
//  Task01_4_Slide.swift
//  Satnav
//
//  Created by Petr Mares on 25.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task01_4_Slide: UIView {
    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var textTitle: UILabel!
    @IBOutlet weak var desc: UILabel!


    @IBOutlet weak var img1: UIButton!
    @IBOutlet weak var img2: UIButton!
    @IBOutlet weak var img3: UIButton!
    
    var subTitles: [String] = []
    var texts: [String] = []
    
    @IBAction func img1Click(_ sender: UIButton) {
       img1.alpha = 1
        img2.alpha = 0.3
        img3.alpha = 0.3
        textTitle.text = subTitles[0]
        desc.text = texts[0]
    }

    @IBAction func img2Click(_ sender: UIButton) {
        img1.alpha = 0.3
        img2.alpha = 1
        img3.alpha = 0.3
        textTitle.text = subTitles[1]
        desc.text = texts[1]    }
    
    @IBAction func img3Click(_ sender: UIButton) {
        img1.alpha = 0.3
        img2.alpha = 0.3
        img3.alpha = 1
        textTitle.text = subTitles[2]
        desc.text = texts[2]    }
    

    func initSlide(){
        taskTitle.text = NSLocalizedString("task01_4_title",comment:"task title")
        textTitle.text = ""
        desc.text = NSLocalizedString("task01_4_text",comment:"intro text")
        
        subTitles = [NSLocalizedString("task01_4_titleText1",comment:"text"),NSLocalizedString("task01_4_titleText2",comment:"text"),NSLocalizedString("task01_4_titleText3",comment:"text")]
        texts = [NSLocalizedString("task01_4_text1",comment:"text"),NSLocalizedString("task01_4_text2",comment:"text"),NSLocalizedString("task01_4_text3",comment:"text")]
    }
    
}
