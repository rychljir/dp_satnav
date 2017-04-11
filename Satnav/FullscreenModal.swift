//
//  FullscreenModal.swift
//  Satnav
//
//  Created by Petr Mares on 11.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class FullscreenModal: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var text: UILabel!

    var image_value: UIImage?
    var text_value: String?
    
    @IBAction func closeBtnClick(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        img.isUserInteractionEnabled = true
        img.addGestureRecognizer(tapGestureRecognizer)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.img.image = image_value
        self.text.text = text_value
    }
    
    func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        dismiss(animated: true, completion: nil)
    }
    
    func setContent(image: UIImage, text: String){
        image_value = image
        text_value = text
    }
}
