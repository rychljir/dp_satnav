//
//  Chapter1ViewController.swift
//  Satnav
//
//  Created by Petr Mares on 24.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class Chapter1ViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    override func viewDidLoad() {

        slideScrollView.delegate = self
        let slides:[UIView] = createSlide()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: slideScrollView)
        view.bringSubview(toFront: pageControl)
    }


    func createSlide() -> [UIView]{
        let slide1: TitleTextSlide = Bundle.main.loadNibNamed("TitleTextSlide", owner: self, options: nil)?.first as! TitleTextSlide
        let title = NSLocalizedString("task01_1_title",comment:"nadpis")
        var text = NSLocalizedString("task01_1_text",comment:"text")
        slide1.initSlide(titleText: title, description: text)
        slide1.setBack(UIImage(named: "task01_1_bck")!)
        
        let slide2: TitleTextSlide = Bundle.main.loadNibNamed("TitleTextSlide", owner: self, options: nil)?.first as! TitleTextSlide
        text = NSLocalizedString("task01_2_text",comment:"text")
        slide2.initSlide(titleText: title, description: text)
        slide2.setBack(UIImage(named: "task01_2_bck")!)
        
        let slide3: TitleTextSlide = Bundle.main.loadNibNamed("TitleTextSlide", owner: self, options: nil)?.first as! TitleTextSlide
        text = NSLocalizedString("task01_3_text",comment:"text")
        slide3.initSlide(titleText: title, description: text)
        slide3.setBack(UIImage(named: "task01_3_bck")!)
        slide3.setTextColor(UIColor.white)
        
        let slide4: Task01_4_Slide = Bundle.main.loadNibNamed("Task01_4_Slide", owner: self, options: nil)?.first as! Task01_4_Slide
        slide4.initSlide()
        slide4.setTitleTextColor(UIColor.white)
        
        let slide5: Task01_5_Slide = Bundle.main.loadNibNamed("Task01_5_Slide", owner: self, options: nil)?.first as! Task01_5_Slide
        slide5.initSlide()
        slide5.setTitleTextColor(UIColor.white)
        
        return [slide1, slide2, slide3, slide4, slide5]
    }
    
    
    func setupSlideScrollView(slides:[UIView]){
        slideScrollView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        //slideScrollView.contentSize = CGSize(width: view.frame.width*CGFloat(slides.count), height: view.frame.height)
        slideScrollView.contentSize = CGSize(width: view.frame.width*CGFloat(slides.count), height: 1.0)
        
        slideScrollView.isPagingEnabled = true
        slideScrollView.showsVerticalScrollIndicator = false
        slideScrollView.showsHorizontalScrollIndicator = false
        
        for i in 0 ..< slides.count{
            slides[i].frame = CGRect(x: view.frame.width*CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height)
            slideScrollView.addSubview(slides[i])
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}
