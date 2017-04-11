//
//  ThreeImageModalSlide.swift
//  Satnav
//
//  Created by Petr Mares on 30.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class ThreeImageModalSlide: UIView {


    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var img1: UIButton!
    @IBOutlet weak var img2: UIButton!
    @IBOutlet weak var img3: UIButton!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    var labelsView:[UILabel] = []
    var btnsView:[UIButton] = []
    var parentVC:ChapterViewController?
    
    @IBAction func img1Click(_ sender: UIButton) {
        parentVC?.showModal()
    }
    
    @IBAction func img2Click(_ sender: UIButton) {
    }

    @IBAction func img3Click(_ sender: UIButton) {
    }
    
    
    func initSlide(taskTitle title:String, captions labels:[String], images imgs:[UIImage], descriptions desc:[String], parent modalVC:ChapterViewController){
        labelsView = [label1, label2, label3]
        btnsView = [img1,img2,img3]
        parentVC = modalVC
        
        taskTitle.text = title
        for i in 0 ... 2{
                labelsView[i].text = labels[i]
                btnsView[i].setImage(imgs[i], for: .normal)
        }
    }
}
