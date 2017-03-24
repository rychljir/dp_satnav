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
        let slides:[Slide] = createSlide()
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: slideScrollView)
        view.bringSubview(toFront: pageControl)
    }


    func createSlide() -> [Slide]{
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.label.text = "Slide1"
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.label.text = "Slide2"
        return [slide1, slide2]
    }
    
    func setupSlideScrollView(slides:[Slide]){
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
