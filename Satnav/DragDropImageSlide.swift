//
//  DragDropImageSlide.swift
//  Satnav
//
//  Created by Petr Mares on 27.04.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class DragDropImageSlide: UIView {
    var eval:UIButton?
    var draggables = [UIView]()
    

    func initSlide(){
        let subs = self.allSubViews
        for subView in subs {
            if(subView.tag==1){
                eval = subView as? UIButton
            }
            if(subView.tag==2){
                draggables.append(subView)
            }
        }
        var i = 0
    }

}

extension UIView {
    var allSubViews : [UIView] {
        var array = [self.subviews].flatMap {$0}
        array.forEach { array.append(contentsOf: $0.allSubViews) }
        return array
    }
}
