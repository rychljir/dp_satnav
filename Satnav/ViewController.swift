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
        //self.performSegue(withIdentifier: "startChapter1", sender:sender)
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "baseChapter") as! ChapterViewController
        vc.indexOfChapter = 1
        self.present(vc, animated: true, completion:nil)
    }
    
    @IBAction func btnChapter2(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "baseChapter") as! ChapterViewController
        vc.indexOfChapter = 2
        self.present(vc, animated: true, completion:nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

