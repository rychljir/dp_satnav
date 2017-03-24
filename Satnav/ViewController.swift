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
        self.performSegue(withIdentifier: "startChapter1", sender:sender)
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

