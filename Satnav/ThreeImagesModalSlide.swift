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
    var texts: [String]?
    var previews: [UIImage]?
    var imgs: [UIImage]?
    var parentVC:ChapterViewController?
    
    @IBAction func img1Click(_ sender: UIButton) {
        showModal(index: 0)
    }
    
    @IBAction func img2Click(_ sender: UIButton) {
        showModal(index: 1)
    }

    @IBAction func img3Click(_ sender: UIButton) {
        showModal(index: 2)
    }
    
    @IBAction func btn1Click(_ sender: UIButton) {
        showModal(index: 0)
    }
    
    @IBAction func btn2Click(_ sender: UIButton) {
        showModal(index: 1)
    }
    
    @IBAction func btn3Click(_ sender: UIButton) {
        showModal(index: 2)
    }
    
    func initSlide(title :String, captions :[String], previews :[UIImage], images: [UIImage], desc:[String], parent :ChapterViewController){
        labelsView = [label1, label2, label3]
        btnsView = [img1,img2,img3]
        parentVC = parent
        texts = desc
        taskTitle.text = title
        
        imgs = images;
        
        for i in 0 ... 2{
                labelsView[i].text = captions[i]
                btnsView[i].setImage(previews[i], for: .normal)
        }
    }
    
    func showModal(index :Int){
        let label = texts?[index]
        let img = imgs?[index]
        
        parentVC?.showModal(image: img!, text: label!)
    }
}
