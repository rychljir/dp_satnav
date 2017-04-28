//
//  ChapterViewController.swift
//  Satnav
//
//  Created by Petr Mares on 30.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit
import DragDropUI

class ChapterViewController: UIViewController, UIScrollViewDelegate, DDViewDelegate {

    var indexOfChapter = 0
    
    let modalVC = FullscreenModal(nibName: "FullscreenModal", bundle: nil)
    var ddToLineSlide: DragDropToLineSlide?
    var ddToMiddleSlide: DragDropToMiddleSlide?
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var slideScrollView: UIScrollView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var homeButton: UIButton!
    @IBOutlet weak var chapterNameLabel: UILabel!
    @IBOutlet weak var topLine: UIView!
    @IBOutlet weak var bottomLine: UIView!
    
    var chapterColors = [UIColor]()
    var chapterBackImage = [UIImage?]()
    var chapterHomeButtonImage = [UIImage?]()
    var chapterHomeButtonImagePressed = [UIImage?]()
    var chapterNames = [String]()
    
    override func viewDidLoad() {
        slideScrollView.delegate = self
        var slides:[UIView]
        
        initColors()
        initHomeButton()
        initBackgrounds()
        initChapterNames()
        
        setupForChapter(index: indexOfChapter)
        
        switch indexOfChapter {
        case 0:
            slides = createSlidesForChapter1()
        case 1:
            slides = createSlidesForChapter2()
        case 2:
            slides = createSlidesForChapter3()
        case 3:
            slides = createSlidesForChapter4()
        case 4:
            slides = createSlidesForChapter5()
        case 5:
            slides = createSlidesForChapter6()
        case 6:
            slides = createSlidesForChapter7()
        default:
            slides = createSlidesForChapter1()
        }
        
        setupSlideScrollView(slides: slides)
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubview(toFront: slideScrollView)
        view.bringSubview(toFront: pageControl)
        
        if(slides.count >= 9){
            //self.scrollToPage(page: 9, animated: true)
        }
    }
    
    @IBAction func homeButtonClick(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "home") as! ViewController
        self.present(vc, animated: true, completion:nil)
    }
    
    
    func setupSlideScrollView(slides:[UIView]){
    
        slideScrollView.contentSize = CGSize(width: view.frame.width*CGFloat(slides.count), height: slideScrollView.frame.height)
        slideScrollView.isPagingEnabled = true
        slideScrollView.showsVerticalScrollIndicator = false
        slideScrollView.showsHorizontalScrollIndicator = false
        
        for i in 0 ..< slides.count{
            slides[i].frame = CGRect(x: view.frame.width*CGFloat(i), y: 0, width: view.frame.width, height: slideScrollView.frame.height)
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
    
    func initColors(){
        chapterColors.append(UIColor(red: 10/255, green: 113/255, blue: 242/255, alpha: 1))
        chapterColors.append(UIColor(red: 255/255, green: 115/255, blue: 203/255, alpha: 1))
        chapterColors.append(UIColor(red: 242/255, green: 0/255, blue: 42/255, alpha: 1))
        chapterColors.append(UIColor(red: 106/255, green: 255/255, blue: 39/255, alpha: 1))
        chapterColors.append(UIColor(red: 242/255, green: 56/255, blue: 0/255, alpha: 1))
        chapterColors.append(UIColor(red: 242/255, green: 230/255, blue: 0/255, alpha: 1))
        chapterColors.append(UIColor(red: 255/255, green: 143/255, blue: 13/255, alpha: 1))
    }
    
    func initBackgrounds(){
        chapterBackImage.append(UIImage(named: "chapter_bck_1") as UIImage?)
        chapterBackImage.append(UIImage(named: "chapter_bck_2") as UIImage?)
        chapterBackImage.append(UIImage(named: "chapter_bck_3") as UIImage?)
        chapterBackImage.append(UIImage(named: "chapter_bck_4") as UIImage?)
        chapterBackImage.append(UIImage(named: "chapter_bck_5") as UIImage?)
        chapterBackImage.append(UIImage(named: "chapter_bck_6") as UIImage?)
        chapterBackImage.append(UIImage(named: "chapter_bck_7") as UIImage?)
    }
    
    func initHomeButton(){
        chapterHomeButtonImage.append(UIImage(named: "base_home_1") as UIImage?)
        chapterHomeButtonImagePressed.append(UIImage(named: "base_home_1_pressed") as UIImage?)
        chapterHomeButtonImage.append(UIImage(named: "base_home_2") as UIImage?)
        chapterHomeButtonImagePressed.append(UIImage(named: "base_home_2_pressed") as UIImage?)
        chapterHomeButtonImage.append(UIImage(named: "base_home_3") as UIImage?)
        chapterHomeButtonImagePressed.append(UIImage(named: "base_home_3_pressed") as UIImage?)
        chapterHomeButtonImage.append(UIImage(named: "base_home_4") as UIImage?)
        chapterHomeButtonImagePressed.append(UIImage(named: "base_home_4_pressed") as UIImage?)
        chapterHomeButtonImage.append(UIImage(named: "base_home_5") as UIImage?)
        chapterHomeButtonImagePressed.append(UIImage(named: "base_home_5_pressed") as UIImage?)
        chapterHomeButtonImage.append(UIImage(named: "base_home_6") as UIImage?)
        chapterHomeButtonImagePressed.append(UIImage(named: "base_home_6_pressed") as UIImage?)
        chapterHomeButtonImage.append(UIImage(named: "base_home_7") as UIImage?)
        chapterHomeButtonImagePressed.append(UIImage(named: "base_home_7_pressed") as UIImage?)
    }
    
    func initChapterNames(){
        chapterNames.append("title_chapter01")
        chapterNames.append("title_chapter02")
        chapterNames.append("title_chapter03")
        chapterNames.append("title_chapter04")
        chapterNames.append("title_chapter05")
        chapterNames.append("title_chapter06")
        chapterNames.append("title_chapter07")
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
        var taskTitle = NSLocalizedString("task02_1_title",comment:"title")
        let localizedTitle1 = NSLocalizedString("task02_1_capt_a",comment:"capt")
        let localizedTitle2 = NSLocalizedString("task02_1_capt_b",comment:"capt")
        let localizedTitle3 = NSLocalizedString("task02_1_capt_c",comment:"capt")
        let titles = [localizedTitle1, localizedTitle2, localizedTitle3]
        
        let localizedDesc1 = NSLocalizedString("task02_1_desc_a",comment:"desc")
        let localizedDesc2 = NSLocalizedString("task02_1_desc_b",comment:"desc")
        let localizedDesc3 = NSLocalizedString("task02_1_desc_c",comment:"desc")
        let decriptions = [localizedDesc1, localizedDesc2, localizedDesc3]
        
        let images = [UIImage(named: "task02_1_a_full") as UIImage?,UIImage(named: "task02_1_b_full") as UIImage?,UIImage(named: "task02_1_c_full") as UIImage?]
        let previews = [UIImage(named: "task02_1_img1") as UIImage?,UIImage(named: "task02_1_img2") as UIImage?,UIImage(named: "task02_1_img3") as UIImage?]
        slide1.initSlide(title: taskTitle, captions: titles, previews: previews as! [UIImage], images: images as! [UIImage], desc: decriptions, parent: self)
        
        let slide2: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_2_title",comment:"title")
        var desc = NSLocalizedString("task02_2_desc",comment:"desc")
        var image :UIImage?
        image = UIImage(named: "task02_2_img") as UIImage?
        slide2.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide3: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_3_title",comment:"title")
        desc = NSLocalizedString("task02_3_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_3_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_3_img") as UIImage?
        }
        slide3.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide4: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_4_title",comment:"title")
        desc = NSLocalizedString("task02_4_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_4_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_4_img") as UIImage?
        }
        slide4.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide5: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_5_title",comment:"title")
        desc = NSLocalizedString("task02_5_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_5_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_5_img") as UIImage?
        }
        slide5.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide6: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_6_title",comment:"title")
        desc = NSLocalizedString("task02_6_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_6_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_6_img") as UIImage?
        }
        slide6.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide7: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_7_title",comment:"title")
        desc = NSLocalizedString("task02_7_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_7_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_7_img") as UIImage?
        }
        slide7.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide8: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_8_title",comment:"title")
        desc = NSLocalizedString("task02_8_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_8_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_8_img") as UIImage?
        }
        slide8.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide9: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_9_title",comment:"title")
        desc = NSLocalizedString("task02_9_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_9_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_9_img") as UIImage?
        }
        slide9.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide10: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_10_title",comment:"title")
        desc = NSLocalizedString("task02_10_desc",comment:"desc")
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task02_10_img_cs") as UIImage?
        }else{
            image = UIImage(named: "task02_10_img") as UIImage?
        }
        slide10.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide11: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_11_title",comment:"title")
        desc = NSLocalizedString("task02_11_desc",comment:"desc")
        image = UIImage(named: "task02_11_img") as UIImage?
        slide11.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide12: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        taskTitle = NSLocalizedString("task02_12_title",comment:"title")
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
    
    func createSlidesForChapter3() -> [UIView]{
        let slide1: Task03_1_Slide = Bundle.main.loadNibNamed("Task03_1_Slide", owner: self, options: nil)?.first as! Task03_1_Slide
        slide1.initSlide()
        
        let slide2: SatelliteSlide = Bundle.main.loadNibNamed("SatelliteSlide", owner: self, options: nil)?.first as! SatelliteSlide
        var title = NSLocalizedString("task03_2_title",comment:"title")
        var text = NSLocalizedString("task03_2_desc",comment:"sattelite description")
        var stat = NSLocalizedString("task03_2_stats", comment: "statistics")
        slide2.initSlide(title: title, text: text, statistic: stat, flagImg:(UIImage(named: "task03_2_flag") )!, satImg: (UIImage(named: "task03_2_img") )!)
 
        let slide3: SatelliteSlide = Bundle.main.loadNibNamed("SatelliteSlide", owner: self, options: nil)?.first as! SatelliteSlide
        title = NSLocalizedString("task03_3_title",comment:"title")
        text = NSLocalizedString("task03_3_desc",comment:"sattelite description")
        stat = NSLocalizedString("task03_3_stats", comment: "statistics")
        slide3.initSlide(title: title, text: text, statistic: stat, flagImg:(UIImage(named: "task03_3_flag") )!, satImg: (UIImage(named: "task03_3_img") )!)
        
        let slide4: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task03_4_title",comment:"title")
        text = NSLocalizedString("task03_4_text",comment:"desc")
        let image = UIImage(named: "task03_4_img") as UIImage?
        slide4.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide5: SatelliteSlide = Bundle.main.loadNibNamed("SatelliteSlide", owner: self, options: nil)?.first as! SatelliteSlide
        title = NSLocalizedString("task03_5_title",comment:"title")
        text = NSLocalizedString("task03_5_desc",comment:"sattelite description")
        stat = NSLocalizedString("task03_5_stats", comment: "statistics")
        slide5.initSlide(title: title, text: text, statistic: stat, flagImg:(UIImage(named: "task03_5_flag") )!, satImg: (UIImage(named: "task03_5_img") )!)
        
        let slide6: SatelliteSlide = Bundle.main.loadNibNamed("SatelliteSlide", owner: self, options: nil)?.first as! SatelliteSlide
        title = NSLocalizedString("task03_6_title",comment:"title")
        text = NSLocalizedString("task03_6_desc",comment:"sattelite description")
        stat = NSLocalizedString("task03_6_stats", comment: "statistics")
        slide6.initSlide(title: title, text: text, statistic: stat, flagImg:(UIImage(named: "task03_6_flag") )!, satImg: (UIImage(named: "task03_6_img") )!)
        
        let slide7: SatelliteSlide = Bundle.main.loadNibNamed("SatelliteSlide", owner: self, options: nil)?.first as! SatelliteSlide
        title = NSLocalizedString("task03_7_title",comment:"title")
        text = NSLocalizedString("task03_7_desc",comment:"sattelite description")
        stat = NSLocalizedString("task03_7_stats", comment: "statistics")
        slide7.initSlide(title: title, text: text, statistic: stat, flagImg:(UIImage(named: "task03_7_flag") )!, satImg: (UIImage(named: "task03_7_img") )!)
        
        let slide8: Task03_8_Slide = Bundle.main.loadNibNamed("Task03_8_Slide", owner: self, options: nil)?.first as! Task03_8_Slide
        
        let slide9: Task03_9_Slide = Bundle.main.loadNibNamed("Task03_9_Slide", owner: self, options: nil)?.first as! Task03_9_Slide
        title = NSLocalizedString("task03_9_title",comment:"title")
        text = NSLocalizedString("task03_9_text",comment:"desc")
        slide9.initSlide(taskTitle: title, description: text)
        
        let slide10: Task03_10_Slide = Bundle.main.loadNibNamed("Task03_10_Slide", owner: self, options: nil)?.first as! Task03_10_Slide
        slide10.initSlide(parent: self)
        
        let slide11: Task03_11_Slide = Bundle.main.loadNibNamed("Task03_11_Slide", owner: self, options: nil)?.first as! Task03_11_Slide
        slide11.initSlide(parent: self)
        
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9, slide10, slide11]
    }
    
    func createSlidesForChapter4() -> [UIView]{
        let slide1: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        var taskTitle = NSLocalizedString("task04_1_title",comment:"title")
        var desc = NSLocalizedString("task04_1_desc",comment:"desc")
        var image :UIImage?
        if(Locale.current.languageCode=="cs"){
            image = UIImage(named: "task04_1_img") as UIImage?
        }else{
            image = UIImage(named: "task04_1_img") as UIImage?
        }
        slide1.initSlide(taskTitle: taskTitle, description: desc, imageCont: image!)
        
        let slide2: SplitImageDescSubtitleSlide = Bundle.main.loadNibNamed("SplitImageDescSubtitleSlide", owner: self, options: nil)?.first as! SplitImageDescSubtitleSlide
        taskTitle = NSLocalizedString("task04_2_title",comment:"title")
        desc = NSLocalizedString("task04_2_desc",comment:"desc")
        var sub = NSLocalizedString("task04_2_header", comment: "subtitle")
        var header = NSLocalizedString("task04_2_header_2", comment: "header")
        image = UIImage(named: "task04_2_img") as UIImage?
        slide2.initSlide(taskTitle: taskTitle, subtitle: sub, header: header, description: desc, imageCont: image!)
        
        let slide3: SplitImageDescSubtitleSlide = Bundle.main.loadNibNamed("SplitImageDescSubtitleSlide", owner: self, options: nil)?.first as! SplitImageDescSubtitleSlide
        taskTitle = NSLocalizedString("task04_2_title",comment:"title")
        desc = NSLocalizedString("task04_3_desc",comment:"desc")
        sub = NSLocalizedString("task04_3_header", comment: "subtitle")
        header = NSLocalizedString("task04_3_header_2", comment: "header")
        image = UIImage(named: "task04_3_img") as UIImage?
        slide3.initSlide(taskTitle: taskTitle, subtitle: sub, header: header, description: desc, imageCont: image!)
        
        let slide4: SplitImageDescSubtitleSlide = Bundle.main.loadNibNamed("SplitImageDescSubtitleSlide", owner: self, options: nil)?.first as! SplitImageDescSubtitleSlide
        taskTitle = NSLocalizedString("task04_2_title",comment:"title")
        desc = NSLocalizedString("task04_4_desc",comment:"desc")
        sub = NSLocalizedString("task04_4_header", comment: "subtitle")
        header = NSLocalizedString("task04_4_header_2", comment: "header")
        image = UIImage(named: "task04_4_img") as UIImage?
        slide4.initSlide(taskTitle: taskTitle, subtitle: sub, header: header, description: desc, imageCont: image!)
        
        let slide5: SplitImageDescSubtitleSlide = Bundle.main.loadNibNamed("SplitImageDescSubtitleSlide", owner: self, options: nil)?.first as! SplitImageDescSubtitleSlide
        taskTitle = NSLocalizedString("task04_2_title",comment:"title")
        desc = NSLocalizedString("task04_5_desc",comment:"desc")
        sub = NSLocalizedString("task04_5_header", comment: "subtitle")
        header = NSLocalizedString("task04_5_header_2", comment: "subtitle")
        image = UIImage(named: "task04_5_img") as UIImage?
        slide5.initSlide(taskTitle: taskTitle, subtitle: sub, header: header, description: desc, imageCont: image!)
        
        let slide6: DragDropToLineSlide = Bundle.main.loadNibNamed("Task04_6_Slide", owner: self, options: nil)?.first as! DragDropToLineSlide
        let order = [2, 0, 3, 1]
        slide6.initSlide(parent: self, correctOrder: order, colorTheme: chapterColors[3],indexOfChapter: 3)
        
        return [slide1, slide2, slide3, slide4, slide5, slide6]
    }
    
    func createSlidesForChapter5() -> [UIView]{
        let slide1: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        var title = NSLocalizedString("task05_1_title",comment:"title")
        var text = NSLocalizedString("task05_1_text",comment:"desc")
        var image = UIImage(named: "task05_1_img") as UIImage?
        slide1.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide2: ThreeImageModalSlide = Bundle.main.loadNibNamed("ThreeImagesModalSlide", owner: self, options: nil)?.first as! ThreeImageModalSlide
        title = NSLocalizedString("task05_2_title",comment:"title")
        let localizedTitle1 = NSLocalizedString("task05_2_capt_a",comment:"capt")
        let localizedTitle2 = NSLocalizedString("task05_2_capt_b",comment:"capt")
        let localizedTitle3 = NSLocalizedString("task05_2_capt_c",comment:"capt")
        let titles = [localizedTitle1, localizedTitle2, localizedTitle3]
        
        let localizedDesc1 = NSLocalizedString("task05_2_desc_a",comment:"desc")
        let localizedDesc2 = NSLocalizedString("task05_2_desc_b",comment:"desc")
        let localizedDesc3 = NSLocalizedString("task05_2_desc_c",comment:"desc")
        let decriptions = [localizedDesc1, localizedDesc2, localizedDesc3]
        
        let images = [UIImage(named: "task05_2_a_full") as UIImage?,UIImage(named: "task05_2_b_full") as UIImage?,UIImage(named: "task05_2_c_full") as UIImage?]
        let previews = [UIImage(named: "task05_2_a") as UIImage?,UIImage(named: "task05_2_b") as UIImage?,UIImage(named: "task05_2_c") as UIImage?]
        slide2.initSlide(title: title, captions: titles, previews: previews as! [UIImage], images: images as! [UIImage], desc: decriptions,parent: self)
        
        let slide3: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task05_3_title",comment:"title")
        text = NSLocalizedString("task05_3_text",comment:"desc")
        image = UIImage(named: "task05_3_img") as UIImage?
        slide3.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide4: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task05_4_title",comment:"title")
        text = NSLocalizedString("task05_4_text",comment:"desc")
        image = UIImage(named: "task05_4_img") as UIImage?
        slide4.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide5: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task05_5_title",comment:"title")
        text = NSLocalizedString("task05_5_text",comment:"desc")
        image = UIImage(named: "task05_5_img") as UIImage?
        slide5.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide6: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task05_6_title",comment:"title")
        text = NSLocalizedString("task05_6_text",comment:"desc")
        image = UIImage(named: "task05_6_img") as UIImage?
        slide6.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide7: Task05_7_8_Slide = Bundle.main.loadNibNamed("Task05_7_8_Slide", owner: self, options: nil)?.first as! Task05_7_8_Slide
        title = NSLocalizedString("task05_7_title",comment:"title")
        text = NSLocalizedString("task05_7_text",comment:"desc")
        image = UIImage(named: "task05_7_imgbig") as UIImage?
        slide7.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide8: Task05_7_8_Slide = Bundle.main.loadNibNamed("Task05_7_8_Slide", owner: self, options: nil)?.first as! Task05_7_8_Slide
        title = NSLocalizedString("task05_8_title",comment:"title")
        text = NSLocalizedString("task05_8_text",comment:"desc")
        image = UIImage(named: "task05_8_imgbig") as UIImage?
        slide8.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide9: DragDropToLineSlide = Bundle.main.loadNibNamed("Task05_9_Slide", owner: self, options: nil)?.first as! DragDropToLineSlide
        let order = [2, 5, 3, 4, 6, 1, 7, 0]
        slide9.initSlide(parent: self, correctOrder: order, colorTheme: chapterColors[4], indexOfChapter: 4)
        
        
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9]
    }
    
    func createSlidesForChapter6() -> [UIView]{
        let slide1: ThreeImageModalSlide = Bundle.main.loadNibNamed("ThreeImagesModalSlide", owner: self, options: nil)?.first as! ThreeImageModalSlide
        var title = NSLocalizedString("task06_1_title",comment:"title")
        var localizedTitle1 = NSLocalizedString("task06_1_capt_a",comment:"capt")
        var localizedTitle2 = NSLocalizedString("task06_1_capt_b",comment:"capt")
        var localizedTitle3 = NSLocalizedString("task06_1_capt_c",comment:"capt")
        var titles = [localizedTitle1, localizedTitle2, localizedTitle3]
        
        var localizedDesc1 = NSLocalizedString("task06_1_desc_a",comment:"desc")
        var localizedDesc2 = NSLocalizedString("task06_1_desc_b",comment:"desc")
        var localizedDesc3 = NSLocalizedString("task06_1_desc_c",comment:"desc")
        var decriptions = [localizedDesc1, localizedDesc2, localizedDesc3]
        
        var images = [UIImage(named: "task06_1_a_full") as UIImage?,UIImage(named: "task06_1_b_full") as UIImage?,UIImage(named: "task06_1_c_full") as UIImage?]
        var previews = [UIImage(named: "task06_1_a") as UIImage?,UIImage(named: "task06_1_b") as UIImage?,UIImage(named: "task06_1_c") as UIImage?]
        slide1.initSlide(title: title, captions: titles,previews: previews as! [UIImage], images: images as! [UIImage], desc: decriptions, parent: self)
        
        let slide2: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task06_2_title",comment:"title")
        var text = NSLocalizedString("task06_2_text",comment:"desc")
        var image = UIImage(named: "task06_2_img") as UIImage?
        slide2.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide3: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task06_3_title",comment:"title")
        text = NSLocalizedString("task06_3_text",comment:"desc")
        image = UIImage(named: "task06_3_img") as UIImage?
        slide3.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide4: SplitImageDescSlide = Bundle.main.loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        title = NSLocalizedString("task06_4_title",comment:"title")
        text = NSLocalizedString("task06_4_text",comment:"desc")
        image = UIImage(named: "task06_4_img") as UIImage?
        slide4.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide5: ThreeImageModalSlide = Bundle.main.loadNibNamed("ThreeImagesModalSlide", owner: self, options: nil)?.first as! ThreeImageModalSlide
        title = NSLocalizedString("task06_5_title",comment:"title")
        localizedTitle1 = NSLocalizedString("task06_5_capt_a",comment:"capt")
        localizedTitle2 = NSLocalizedString("task06_5_capt_b",comment:"capt")
        localizedTitle3 = NSLocalizedString("task06_5_capt_c",comment:"capt")
        titles = [localizedTitle1, localizedTitle2, localizedTitle3]
        
        localizedDesc1 = NSLocalizedString("task06_5_desc_a",comment:"desc")
        localizedDesc2 = NSLocalizedString("task06_5_desc_b",comment:"desc")
        localizedDesc3 = NSLocalizedString("task06_5_desc_c",comment:"desc")
        decriptions = [localizedDesc1, localizedDesc2, localizedDesc3]
        
        images = [UIImage(named: "task06_5_a_full") as UIImage?,UIImage(named: "task06_5_b_full") as UIImage?,UIImage(named: "task06_5_c_full") as UIImage?]
        previews = [UIImage(named: "task06_5_a") as UIImage?,UIImage(named: "task06_5_b") as UIImage?,UIImage(named: "task06_5_c") as UIImage?]
        slide5.initSlide(title: title, captions: titles, previews: previews as! [UIImage], images: images as! [UIImage], desc: decriptions,parent: self)
        
        let slide6: ThreeImageModalSlide = Bundle.main.loadNibNamed("ThreeImagesModalSlide", owner: self, options: nil)?.first as! ThreeImageModalSlide
        title = NSLocalizedString("task06_6_title",comment:"title")
        localizedTitle1 = NSLocalizedString("task06_6_capt_a",comment:"capt")
        localizedTitle2 = NSLocalizedString("task06_6_capt_b",comment:"capt")
        localizedTitle3 = NSLocalizedString("task06_6_capt_c",comment:"capt")
        titles = [localizedTitle1, localizedTitle2, localizedTitle3]
        
        localizedDesc1 = NSLocalizedString("task06_6_desc_a",comment:"desc")
        localizedDesc2 = NSLocalizedString("task06_6_desc_b",comment:"desc")
        localizedDesc3 = NSLocalizedString("task06_6_desc_c",comment:"desc")
        decriptions = [localizedDesc1, localizedDesc2, localizedDesc3]
        
        images = [UIImage(named: "task06_6_a_full") as UIImage?,UIImage(named: "task06_6_b_full") as UIImage?,UIImage(named: "task06_6_c_full") as UIImage?]
        previews = [UIImage(named: "task06_6_a") as UIImage?,UIImage(named: "task06_6_b") as UIImage?,UIImage(named: "task06_6_c") as UIImage?]
        slide6.initSlide(title: title, captions: titles, previews: previews as! [UIImage], images: images as! [UIImage], desc: decriptions, parent: self)
        
        let slide7: DragDropToMiddleSlide = Bundle.main.loadNibNamed("Task06_7_Slide", owner: self, options: nil)?.first as! DragDropToMiddleSlide
        let order = [3, 4, 5, 2, 1, 0]
        slide7.initSlide(parent: self, correctOrder: order, colorTheme: chapterColors[5], indexOfChapter: 5)
    
        return [slide7, slide1, slide2, slide3, slide4, slide5, slide6]
    }
    
    func createSlidesForChapter7() -> [UIView]{
        let slide1: TitleTextBottomImageSlide = Bundle.main.loadNibNamed("TitleTextBottomImageSlide", owner: self, options: nil)?.first as! TitleTextBottomImageSlide
        var title = NSLocalizedString("task07_1_title",comment:"title")
        var text = NSLocalizedString("task07_1_text",comment:"desc")
        var image = UIImage(named: "task07_1_large") as UIImage?
        slide1.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide2: TitleTextBottomImageSlide = Bundle.main.loadNibNamed("TitleTextBottomImageSlide", owner: self, options: nil)?.first as! TitleTextBottomImageSlide
        title = NSLocalizedString("task07_2_title",comment:"title")
        text = NSLocalizedString("task07_2_text",comment:"desc")
        image = UIImage(named: "task07_2_large") as UIImage?
        slide2.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide3: TitleTextBottomImageSlide = Bundle.main.loadNibNamed("TitleTextBottomImageSlide", owner: self, options: nil)?.first as! TitleTextBottomImageSlide
        title = NSLocalizedString("task07_3_title",comment:"title")
        text = NSLocalizedString("task07_3_text",comment:"desc")
        image = UIImage(named: "task07_3_large") as UIImage?
        slide3.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        let slide4: TitleTextBottomImageSlide = Bundle.main.loadNibNamed("TitleTextBottomImageSlide", owner: self, options: nil)?.first as! TitleTextBottomImageSlide
        title = NSLocalizedString("task07_4_title",comment:"title")
        text = NSLocalizedString("task07_4_text",comment:"desc")
        image = UIImage(named: "task07_4_large") as UIImage?
        slide4.initSlide(taskTitle: title, description: text, imageCont: image!)
        
        return [slide1, slide2, slide3, slide4]
    }
    

    func setupForChapter(index: Int){
        backgroundImage.image = chapterBackImage[index]
        homeButton.setImage(chapterHomeButtonImage[index], for: .normal)
        homeButton.setImage(chapterHomeButtonImagePressed[index], for: .highlighted)
        chapterNameLabel.text = NSLocalizedString(chapterNames[index],comment:"chapterTitle")
        topLine.backgroundColor = chapterColors[index]
        bottomLine.backgroundColor = chapterColors[index]
    }
    
    
    func showModal(image: UIImage, text: String){
        modalVC.setContent(image: image, text: text)
        modalVC.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        modalVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(modalVC, animated: true, completion: nil)
    }
    
    
    // MARK: DDViewDelegate
    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        print("Dragged Point : ", draggedPoint)
        
    }
    
    func viewWasDropped(view droppedView: UIView, droppedPoint: CGPoint) {
        ddToLineSlide?.snapView(view: droppedView, toPosition: droppedPoint)
        ddToMiddleSlide?.snapView(view: droppedView, toPosition: droppedPoint)
    }
}

extension UIViewController {
    func showToast(message : String) {
        let toastLabel = UILabel(frame: CGRect(x: self.view.frame.size.width/2 - 200, y: self.view.frame.size.height-150, width: 400, height: 70))
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
