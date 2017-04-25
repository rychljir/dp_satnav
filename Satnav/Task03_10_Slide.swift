//
//  Task03_10_Slide.swift
//  Satnav
//
//  Created by Petr Mares on 25.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task03_10_Slide: UIView {
    
    var mapShown = [false, false, false, false, false]
    var buttons = [UIButton]()
    var images = [UIImageView]()
    var chapterColor: UIColor?

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
    
    
    @IBAction func btnClick(_ sender: UIButton) {
        let index = sender.tag
        mapShown[index] = !mapShown[index]
        if(mapShown[index]){
            images[index].isHidden = false
            sender.backgroundColor = chapterColor
            sender.setTitleColor(UIColor.black, for: .normal)
        }else{
            images[index].isHidden = true
            sender.backgroundColor = UIColor.black
            sender.setTitleColor(chapterColor, for: .normal)
        }
    }
    
    
    func initSlide(parent: UIViewController){
        buttons = [btn1, btn2, btn3, btn4, btn5]
        images = [img1, img2, img3, img4, img5]
        chapterColor = (parent as! ChapterViewController).chapterColors[2]
        
        for img in images {
            img.isHidden = true
        }
        
        for btn in buttons{
            btn.layer.cornerRadius = 7.0;
            btn.layer.borderColor = chapterColor!.cgColor
            btn.layer.borderWidth = 1.2
        }
    }

}
