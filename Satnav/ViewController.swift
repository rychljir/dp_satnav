//
//  ViewController.swift
//  Satnav
//
//  Created by Petr Mares on 14.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func btnChapter1(_ sender: UIButton) {
        startChapter(1)
    }
    
    @IBAction func btnChapter2(_ sender: UIButton) {
        startChapter(2)
    }
    
    @IBAction func btnChapter3(_ sender: UIButton) {
        startChapter(3)
    }
    
    func startChapter(_ index: Int){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "baseChapter") as! ChapterViewController
        vc.indexOfChapter = index
        self.present(vc, animated: true, completion:nil)    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

