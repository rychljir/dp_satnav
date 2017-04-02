//
//  Task03_9_Slide.swift
//  Satnav
//
//  Created by Petr Mares on 02.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task03_9_Slide: UIView {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    func initSlide(taskTitle title:String, description descText: String){
        taskTitle.text = title
        desc.text = descText
    }

}
