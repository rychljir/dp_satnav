//
//  SplitImageDescSubtitleSlide.swift
//  Satnav
//
//  Created by Petr Mares on 06.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class SplitImageDescSubtitleSlide: UIView {

    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var subtitle: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var header: UILabel!

    func initSlide(taskTitle title:String, subtitle sub: String, header head: String, description descText: String, imageCont cont:UIImage){
        taskTitle.text = title
        subtitle.text = sub
        img.image = cont
        desc.text = descText
        header.text = head
        
        //desc.font = UIFont(name: "HelveticaNeue-Light", size: 12) //This is here to set up rest of the texts font
        let stringStyler =  StringStyler()
        
        desc.attributedText = stringStyler.convertText(inputText: descText)
    }
}
