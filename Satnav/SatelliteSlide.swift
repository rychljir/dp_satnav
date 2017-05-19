//
//  SatelliteSlide.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 02.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class SatelliteSlide: UIView {


    @IBOutlet weak var taskTitle: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var stats: UILabel!
    @IBOutlet weak var flag: UIImageView!
    @IBOutlet weak var img: UIImageView!

    func initSlide(title:String, text:String, statistic :String, flagImg:UIImage, satImg:UIImage){
        taskTitle.text = title
        desc.text = text
        stats.text = statistic
        stats.sizeToFit()
        flag.image = flagImg
        img.image = satImg
    }
    
}
