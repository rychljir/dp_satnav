//
//  ChapterViewController.swift
//  Satnav
//
//  Created by Petr Mares on 30.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit

class ChapterViewController: UIViewController, UIScrollViewDelegate {

    var indexOfChapter = 0
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var chapterNameLabel: UILabel!
    
    override func viewDidLoad() {
        slideScrollView.delegate = self
        var slides:[UIView]
        switch indexOfChapter {
        case 1:
            slides = createSlidesForChapter1()
            setupForChapter1()
        case 2:
            slides = createSlidesForChapter2()
            setupForChapter2()
            chapterNameLabel.text = ""
        default:
            slides = createSlidesForChapter1()
            setupForChapter1()
        }
        
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: slideScrollView)
        view.bringSubview(toFront: pageControl)
        
        self.scrollToPage(page: 12, animated: true)
    }
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(vc, animated: true, completion:nil)
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
    
    func scrollToPage(page: Int, animated: Bool) {
        var frame: CGRect = self.slideScrollView.frame
        frame.origin.x = frame.size.width * CGFloat(page);
        frame.origin.y = 0;
        self.slideScrollView.scrollRectToVisible(frame, animated: animated)
    }
    
    func createSlidesForChapter1() -> [UIView]{
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
    
    func createSlidesForChapter2() -> [UIView]{
        let slide1: ThreeImageModalSlide = Bundle.main.loadNibNamed("ThreeImagesModalSlide", owner: self, options: nil)?.first as! ThreeImageModalSlide
        var taskTitle = NSLocalizedString("task02_1_title",comment:"nadpis")
        let localizedTitle1 = NSLocalizedString("task02_1_capt_a",comment:"capt")
        let localizedTitle2 = NSLocalizedString("task02_1_capt_b",comment:"capt")
        let localizedTitle3 = NSLocalizedString("task02_1_capt_c",comment:"capt")
        let titles = [localizedTitle1, localizedTitle2, localizedTitle3]
        
        let localizedDesc1 = NSLocalizedString("task02_1_desc_a",comment:"desc")
        let localizedDesc2 = NSLocalizedString("task02_1_desc_b",comment:"desc")
        let localizedDesc3 = NSLocalizedString("task02_1_desc_c",comment:"desc")
        let decriptions = [localizedDesc1, localizedDesc2, localizedDesc3]
        
        let images = [UIImage(named: "task02_1_img1") as UIImage?,UIImage(named: "task02_1_img2") as UIImage?,UIImage(named: "task02_1_img3") as UIImage?]
        slide1.initSlide(taskTitle: taskTitle, captions: titles, images: images as! [UIImage], descriptions: decriptions)
        
        let slide2: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_2_title",comment:"nadpis")
        var desc = NSLocalizedString("task02_2_desc",comment:"desc")
        var image = UIImage(named: "task02_2_img") as UIImage?
        slide2.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide3: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_3_title",comment:"nadpis")
        desc = NSLocalizedString("task02_3_desc",comment:"desc")
        image = UIImage(named: "task02_3_img") as UIImage?
        slide3.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide4: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_4_title",comment:"nadpis")
        desc = NSLocalizedString("task02_4_desc",comment:"desc")
        image = UIImage(named: "task02_4_img") as UIImage?
        slide4.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide5: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_5_title",comment:"nadpis")
        desc = NSLocalizedString("task02_5_desc",comment:"desc")
        image = UIImage(named: "task02_5_img") as UIImage?
        slide5.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide6: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_6_title",comment:"nadpis")
        desc = NSLocalizedString("task02_6_desc",comment:"desc")
        image = UIImage(named: "task02_6_img") as UIImage?
        slide6.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide7: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_7_title",comment:"nadpis")
        desc = NSLocalizedString("task02_7_desc",comment:"desc")
        image = UIImage(named: "task02_7_img") as UIImage?
        slide7.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide8: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_8_title",comment:"nadpis")
        desc = NSLocalizedString("task02_8_desc",comment:"desc")
        image = UIImage(named: "task02_8_img") as UIImage?
        slide8.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide9: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_9_title",comment:"nadpis")
        desc = NSLocalizedString("task02_9_desc",comment:"desc")
        image = UIImage(named: "task02_9_img") as UIImage?
        slide9.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide10: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_10_title",comment:"nadpis")
        desc = NSLocalizedString("task02_10_desc",comment:"desc")
        image = UIImage(named: "task02_10_img") as UIImage?
        slide10.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide11: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_11_title",comment:"nadpis")
        desc = NSLocalizedString("task02_11_desc",comment:"desc")
        image = UIImage(named: "task02_11_img") as UIImage?
        slide11.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide12: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_12_title",comment:"nadpis")
        desc = NSLocalizedString("task02_12_desc",comment:"desc")
        image = UIImage(named: "task02_12_img") as UIImage?
        slide12.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide13: Task02_13_Slide = Bundle.main.loadNibNamed("Task02_13_Slide", owner: self, options: nil)?.first as! Task02_13_Slide
        taskTitle = NSLocalizedString("task02_13_title",comment:"nadpis")
        desc = NSLocalizedString("task02_13_desc",comment:"desc")
        let opt1 = NSLocalizedString("task02_13_val1", comment: "taskValue")
        let opt2 = NSLocalizedString("task02_13_val2", comment: "taskValue")
        let opt3 = NSLocalizedString("task02_13_val3", comment: "taskValue")
        let opt4 = NSLocalizedString("task02_13_val4", comment: "taskValue")
        slide13.initSlide(taskTitle: taskTitle, description: desc, taskOptions: [opt1, opt2, opt3, opt4], parent: self)
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9, slide10, slide11, slide12, slide13]
    }
    

    func setupForChapter1()  {
        backgroundImage.image = UIImage(named: "chapter_bck_1") as UIImage?
        homeButton.setImage(UIImage(named: "base_home_1") as UIImage?, for: .normal)
        homeButton.setImage(UIImage(named: "base_home_1_pressed") as UIImage?, for: .highlighted)
        chapterNameLabel.text = NSLocalizedString("title_chapter01",comment:"chapterTitle")
    }
    
    func setupForChapter2()  {
        backgroundImage.image = UIImage(named: "chapter_bck_2") as UIImage?
        homeButton.setImage(UIImage(named: "base_home_2") as UIImage?, for: .normal)
        homeButton.setImage(UIImage(named: "base_home_2_pressed") as UIImage?, for: .highlighted)
        chapterNameLabel.text = NSLocalizedString("title_chapter02",comment:"chapterTitle")
        chapterNameLabel.sizeToFit()
    }
    
}

extension UIViewController {
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 200, y: self.view.frame.size.height-100, width: 400, height: 70))
        toastLabel.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        toastLabel.textColor = UIColor.white
        toastLabel.numberOfLines = 2
        toastLabel.textAlignment = .center;
        toastLabel.font = UIFont(name: "Montserrat-Light", size: 12.0)
        toastLabel.text = message
        toastLabel.alpha = 1.0
        toastLabel.layer.cornerRadius = 10;
        toastLabel.clipsToBounds  =  true
        self.view.addSubview(toastLabel)
        UIView.animate(withDuration: 8.0, delay: 0.1, options: .curveEaseOut, animations: {
            toastLabel.alpha = 0.0
        }, completion: {(isCompleted) in
            toastLabel.removeFromSuperview()
        })
    }
}
