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

    @IBAction func btn1Click(_ sender: UIButton) {
    }

    @IBAction func btn2Click(_ sender: UIButton) {
    }
    
    @IBAction func btn3Click(_ sender: UIButton) {
    }
    
    @IBAction func btn4Click(_ sender: UIButton) {
    }
    
    @IBAction func btn5Click(_ sender: UIButton) {
    }
    
    func initSlide(taskTitle title:String, description descText: String){
        taskTitle.text = title
        taskDesc.text = descText
    }

}
