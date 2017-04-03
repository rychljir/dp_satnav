//
//  Task03_11_Slide.swift
//  Satnav
//
//  Created by Petr Mares on 03.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Task03_11_Slide: UIView {

    @IBOutlet weak var yes1: UIButton!
    @IBOutlet weak var no1: UIButton!
    @IBOutlet weak var yes2: UIButton!
    @IBOutlet weak var no2: UIButton!
    @IBOutlet weak var yes3: UIButton!
    @IBOutlet weak var no3: UIButton!
    @IBOutlet weak var yes4: UIButton!
    @IBOutlet weak var no4: UIButton!
    @IBOutlet weak var yes5: UIButton!
    @IBOutlet weak var no5: UIButton!
    @IBOutlet weak var yes6: UIButton!
    @IBOutlet weak var no6: UIButton!
    @IBOutlet weak var yes7: UIButton!
    @IBOutlet weak var no7: UIButton!
    
    @IBAction func yes1Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 0)
    }
    @IBAction func no1Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 0)
    }
    @IBAction func yes2Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 1)
    }
    @IBAction func no2Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 1)
    }
    @IBAction func yes3Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 2)
    }
    @IBAction func no3Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 2)
    }
    @IBAction func yes4Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 3)
    }
    @IBAction func no4Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 3)
    }
    @IBAction func yes5Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 4)
    }
    @IBAction func no5Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 4)
    }
    @IBAction func yes6Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 5)
    }
    @IBAction func no6Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 5)
    }
    @IBAction func yes7Click(_ sender: UIButton) {
        performClick(whichButton: true, index: 6)
    }
    @IBAction func no7Click(_ sender: UIButton) {
        performClick(whichButton: false, index: 6)
    }

    func performClick(whichButton: Bool, index: Int){
        
    }
}
