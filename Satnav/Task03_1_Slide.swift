//
//  Task03_1_Slide.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 03.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task03_1_Slide: UIView {

    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    
    @IBOutlet weak var img1: UIImageView!
    @IBOutlet weak var img2: UIImageView!
    @IBOutlet weak var img3: UIImageView!
    @IBOutlet weak var img4: UIImageView!
    @IBOutlet weak var img5: UIImageView!

    var buttons:[UIButton] = []
    var images:[UIImageView] = []
    var selected: [Bool] = []

    @IBAction func btn1Click(_ sender: UIButton) {
        performClick(index: 0)
    }
    @IBAction func btn2Click(_ sender: UIButton) {
        performClick(index: 1)
    }
    @IBAction func btn3Click(_ sender: UIButton) {
        performClick(index: 2)
    }
    @IBAction func btn4Click(_ sender: UIButton) {
        performClick(index: 3)
    }
    @IBAction func btn5Click(_ sender: UIButton) {
        performClick(index: 4)
    }

    func performClick(index: Int){
        images[index].isHidden = !(images[index].isHidden)
        selected[index] = !selected[index]
        if(selected[index]){
            buttons[index].setTitleColor(.red, for: .normal)
            buttons[index].backgroundColor = UIColor.white
        }else{
            buttons[index].setTitleColor(.white, for: .normal)
            buttons[index].backgroundColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 0.45)
        }

    }
    
    func initSlide(){
        buttons = [btn1, btn2, btn3, btn4, btn5]
        images = [img1, img2, img3, img4, img5]
        selected = [false, false, false, false, false]
        
        for btn in buttons {
            btn.setTitleColor(.white, for: .normal)
            btn.backgroundColor = UIColor(red: 185/255, green: 185/255, blue: 185/255, alpha: 0.45)
        }
    }
    
}
