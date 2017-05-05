//
//  ViewController.swift
//  Satnav
//
//  Created by Petr Mares on 14.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit
import ios_core

class ViewController: UIViewController {
    @IBAction func btnChapter1(_ sender: UIButton) {
        startChapter(0)
    }
    
    @IBAction func btnChapter2(_ sender: UIButton) {
        startChapter(1)
    }
    
    @IBAction func btnChapter3(_ sender: UIButton) {
        startChapter(2)
    }
    
    @IBAction func btnChapter4(_ sender: UIButton) {
        startChapter(3)
    }
    
    @IBAction func btnChapter5(_ sender: UIButton) {
        startChapter(4)
    }
    
    @IBAction func btnChapter6(_ sender: UIButton) {
        startChapter(5)
    }
    
    @IBAction func btnChapter7(_ sender: UIButton) {
        startChapter(6)
    }
    
    @IBAction func eraseDataClick(_ sender: UIButton) {
        ApplicationState.deleteTaskStates()
        let msg = NSLocalizedString("erased_data",comment:"Data were deleted.")
        showToast(message: msg)
    }
    
    func startChapter(_ index: Int){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "baseChapter") as! ChapterViewController
        vc.indexOfChapter = index
        self.present(vc, animated: true, completion:nil)    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ApplicationState.loadTaskStates()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

