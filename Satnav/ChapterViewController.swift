//
//  ChapterViewController.swift
//  Satnav
//
//  Created by Jiri Rychlovsky on 30.03.17.
//  Copyright © 2017 Scientica. All rights reserved.
//

import UIKit
import DragDropUI
import ios_core

/*
 
 ViewController which displays content of a chapter
 
 */
class ChapterViewController: UIViewController, UIScrollViewDelegate, DDViewDelegate, ChapterProtocol {
    
    var indexOfChapter = 0
    
    let modalVC = FullscreenModal(nibName: "FullscreenModal", bundle: Bundle(for: FullscreenModal.self))
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
        
        //init setups for all chapters
        initColors()
        initHomeButton()
        initBackgrounds()
        initChapterNames()
        
        //setup chapter by its index
        setupForChapter(index: indexOfChapter)
        
        //creates slides based on chapter index
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
        let slide1: TitleTextSlide = prepareTitleTextSlide(titleId: "task01_1_title", textId: "task01_1_text", bckImgName: "task01_1_bck")
        
        let slide2: TitleTextSlide = prepareTitleTextSlide(titleId: "task01_1_title", textId: "task01_2_text", bckImgName: "task01_2_bck")
        
        let slide3: TitleTextSlide = prepareTitleTextSlide(titleId: "task01_1_title", textId: "task01_3_text", bckImgName: "task01_3_bck")
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
        let captions = ["task02_1_capt_a","task02_1_capt_b","task02_1_capt_c"]
        let descs = ["task02_1_desc_a","task02_1_desc_b","task02_1_desc_c"]
        let images  = ["task02_1_a_full","task02_1_b_full","task02_1_c_full"]
        let previews = ["task02_1_img1","task02_1_img2","task02_1_img3"]
        let slide1: ThreeImagesModalSlide = prepareThreeImagesModalSlide(titleId: "task02_1_title", captionsId: captions, descsId: descs, imagesName: images, previewsName: previews)
        
        var img = UIImage(named: "task02_2_img")!
        let slide2 = prepareSplitImageDescSlide(titleId: "task02_2_title", descId: "task02_2_desc", image: img)
        
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_3_img_cs")!
        }else{
            img = UIImage(named: "task02_3_img")!
        }
        let slide3 = prepareSplitImageDescSlide(titleId: "task02_3_title", descId: "task02_3_desc", image: img)
        
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_4_img_cs")!
        }else{
            img = UIImage(named: "task02_4_img")!
        }
        let slide4 = prepareSplitImageDescSlide(titleId: "task02_4_title", descId: "task02_4_desc", image: img)
        
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_5_img_cs")!
        }else{
            img = UIImage(named: "task02_5_img")!
        }
        let slide5 = prepareSplitImageDescSlide(titleId: "task02_5_title", descId: "task02_5_desc", image: img)
        
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_6_img_cs")!
        }else{
            img = UIImage(named: "task02_6_img")!
        }
        let slide6 = prepareSplitImageDescSlide(titleId: "task02_6_title", descId: "task02_6_desc", image: img)
        
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_7_img_cs")!
        }else{
            img = UIImage(named: "task02_7_img")!
        }
        let slide7 = prepareSplitImageDescSlide(titleId: "task02_7_title", descId: "task02_7_desc", image: img)
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_8_img_cs")!
        }else{
            img = UIImage(named: "task02_8_img")!
        }
        let slide8 = prepareSplitImageDescSlide(titleId: "task02_8_title", descId: "task02_8_desc", image: img)
        
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_9_img_cs")!
        }else{
            img = UIImage(named: "task02_9_img")!
        }
        let slide9 = prepareSplitImageDescSlide(titleId: "task02_9_title", descId: "task02_9_desc", image: img)
        
        
        if(Locale.current.languageCode=="cs"){
            img = UIImage(named: "task02_10_img_cs")!
        }else{
            img = UIImage(named: "task02_10_img")!
        }
        let slide10 = prepareSplitImageDescSlide(titleId: "task02_10_title", descId: "task02_10_desc", image: img)
        
        img = UIImage(named: "task02_11_img")!
        let slide11 = prepareSplitImageDescSlide(titleId: "task02_11_title", descId: "task02_11_desc", image: img)
        
        img = UIImage(named: "task02_12_img")!
        let slide12 = prepareSplitImageDescSlide(titleId: "task02_12_title", descId: "task02_12_desc", image: img)
        
        let slide13: Task02_13_Slide = Bundle.main.loadNibNamed("Task02_13_Slide", owner: self, options: nil)?.first as! Task02_13_Slide
        let taskTitle = NSLocalizedString("task02_13_title",comment:"nadpis")
        let desc = NSLocalizedString("task02_13_desc",comment:"desc")
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
        
        let slide2 = prepareSatelliteSlide(titleId: "task03_2_title", descId: "task03_2_desc", statsId: "task03_2_stats", flagImageName: "task03_2_flag", satImageName: "task03_2_img")
        
        let slide3 = prepareSatelliteSlide(titleId: "task03_3_title", descId: "task03_3_desc", statsId: "task03_3_stats", flagImageName: "task03_3_flag", satImageName: "task03_3_img")
        
        let img = UIImage(named: "task03_4_img")!
        let slide4 = prepareSplitImageDescSlide(titleId: "task03_4_title", descId: "task03_4_text", image: img)
        
        let slide5 = prepareSatelliteSlide(titleId: "task03_5_title", descId: "task03_5_desc", statsId: "task03_5_stats", flagImageName: "task03_5_flag", satImageName: "task03_5_img")
        
        let slide6 = prepareSatelliteSlide(titleId: "task03_6_title", descId: "task03_6_desc", statsId: "task03_6_stats", flagImageName: "task03_6_flag", satImageName: "task03_6_img")
        
        let slide7 = prepareSatelliteSlide(titleId: "task03_7_title", descId: "task03_7_desc", statsId: "task03_7_stats", flagImageName: "task03_7_flag", satImageName: "task03_7_img")
        
        let slide8: Task03_8_Slide = Bundle.main.loadNibNamed("Task03_8_Slide", owner: self, options: nil)?.first as! Task03_8_Slide
        
        let slide9: Task03_9_Slide = Bundle.main.loadNibNamed("Task03_9_Slide", owner: self, options: nil)?.first as! Task03_9_Slide
        let title = NSLocalizedString("task03_9_title",comment:"title")
        let text = NSLocalizedString("task03_9_text",comment:"desc")
        slide9.initSlide(taskTitle: title, description: text)
        
        let slide10: Task03_10_Slide = Bundle.main.loadNibNamed("Task03_10_Slide", owner: self, options: nil)?.first as! Task03_10_Slide
        slide10.initSlide(parent: self)
        
        let slide11: Task03_11_Slide = Bundle.main.loadNibNamed("Task03_11_Slide", owner: self, options: nil)?.first as! Task03_11_Slide
        slide11.initSlide(parent: self)
        
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7, slide8, slide9, slide10, slide11]
    }
    
    func createSlidesForChapter4() -> [UIView]{
        let img = UIImage(named: "task04_1_img")!
        let slide1 = prepareSplitImageDescSlide(titleId: "task04_1_title", descId: "task04_1_desc", image: img)
        
        let slide2 = prepareSplitImageDescSubtitleSlide(taskId: "task04_2_title", descId: "task04_2_desc", subId: "task04_2_header", headerId: "task04_2_header_2", imageName: "task04_2_img")
        
        let slide3 = prepareSplitImageDescSubtitleSlide(taskId: "task04_2_title", descId: "task04_3_desc", subId: "task04_3_header", headerId: "task04_3_header_2", imageName: "task04_3_img")
        
        let slide4 = prepareSplitImageDescSubtitleSlide(taskId: "task04_2_title", descId: "task04_4_desc", subId: "task04_4_header", headerId: "task04_4_header_2", imageName: "task04_4_img")
        
        let slide5 = prepareSplitImageDescSubtitleSlide(taskId: "task04_2_title", descId: "task04_5_desc", subId: "task04_5_header", headerId: "task04_5_header_2", imageName: "task04_5_img")
        
        let slide6: DragDropToLineSlide = Bundle.main.loadNibNamed("Task04_6_Slide", owner: self, options: nil)?.first as! DragDropToLineSlide
        let order = [2, 0, 3, 1]
        slide6.initSlide(parent: self, correctOrder: order, colorTheme: chapterColors[3],indexOfChapter: 3)
        
        return [slide1, slide2, slide3, slide4, slide5, slide6]
    }
    
    func createSlidesForChapter5() -> [UIView]{
        var img = UIImage(named: "task05_1_img")!
        let slide1 = prepareSplitImageDescSlide(titleId: "task05_1_title", descId: "task05_1_text", image: img)
        
        let captions = ["task05_2_capt_a","task05_2_capt_b","task05_2_capt_c"]
        let descs = ["task05_2_desc_a","task05_2_desc_b","task05_2_desc_c"]
        let images  = ["task05_2_a_full","task05_2_b_full","task05_2_c_full"]
        let previews = ["task05_2_a","task05_2_b","task05_2_c"]
        let slide2: ThreeImagesModalSlide = prepareThreeImagesModalSlide(titleId: "task05_2_title", captionsId: captions, descsId: descs, imagesName: images, previewsName: previews)
        
        img = UIImage(named: "task05_3_img")!
        let slide3 = prepareSplitImageDescSlide(titleId: "task05_3_title", descId: "task05_3_text", image: img)
        
        img = UIImage(named: "task05_4_img")!
        let slide4 = prepareSplitImageDescSlide(titleId: "task05_4_title", descId: "task05_4_text", image: img)
        
        img = UIImage(named: "task05_5_img")!
        let slide5 = prepareSplitImageDescSlide(titleId: "task05_5_title", descId: "task05_5_text", image: img)
        
        img = UIImage(named: "task05_6_img")!
        let slide6 = prepareSplitImageDescSlide(titleId: "task05_6_title", descId: "task05_6_text", image: img)
        
        let slide7: Task05_7_8_Slide = Bundle.main.loadNibNamed("Task05_7_8_Slide", owner: self, options: nil)?.first as! Task05_7_8_Slide
        var title = NSLocalizedString("task05_7_title",comment:"title")
        var text = NSLocalizedString("task05_7_text",comment:"desc")
        var image = UIImage(named: "task05_7_imgbig") as UIImage?
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
        var captions = ["task06_1_capt_a","task06_1_capt_b","task06_1_capt_c"]
        var descs = ["task06_1_desc_a","task06_1_desc_b","task06_1_desc_c"]
        var images  = ["task06_1_a_full","task06_1_b_full","task06_1_c_full"]
        var previews = ["task06_1_a","task06_1_b","task06_1_c"]
        let slide1: ThreeImagesModalSlide = prepareThreeImagesModalSlide(titleId: "task06_1_title", captionsId: captions, descsId: descs, imagesName: images, previewsName: previews)
        
        var img = UIImage(named: "task06_2_img")!
        let slide2 = prepareSplitImageDescSlide(titleId: "task06_2_title", descId: "task06_2_text", image: img)
        
        img = UIImage(named: "task06_3_img")!
        let slide3 = prepareSplitImageDescSlide(titleId: "task06_3_title", descId: "task06_3_text", image: img)
        
        img = UIImage(named: "task06_4_img")!
        let slide4 = prepareSplitImageDescSlide(titleId: "task06_4_title", descId: "task06_4_text", image: img)
        
        captions = ["task06_5_capt_a","task06_5_capt_b","task06_5_capt_c"]
        descs = ["task06_5_desc_a","task06_5_desc_b","task06_5_desc_c"]
        images  = ["task06_5_a_full","task06_5_b_full","task06_5_c_full"]
        previews = ["task06_5_a","task06_5_b","task06_5_c"]
        let slide5: ThreeImagesModalSlide = prepareThreeImagesModalSlide(titleId: "task06_5_title", captionsId: captions, descsId: descs, imagesName: images, previewsName: previews)
        
        captions = ["task06_6_capt_a","task06_6_capt_b","task06_6_capt_c"]
        descs = ["task06_6_desc_a","task06_6_desc_b","task06_6_desc_c"]
        images  = ["task06_6_a_full","task06_6_b_full","task06_6_c_full"]
        previews = ["task06_6_a","task06_6_b","task06_6_c"]
        let slide6: ThreeImagesModalSlide = prepareThreeImagesModalSlide(titleId: "task06_6_title", captionsId: captions, descsId: descs, imagesName: images, previewsName: previews)
        
        let slide7: DragDropToMiddleSlide = Bundle.main.loadNibNamed("Task06_7_Slide", owner: self, options: nil)?.first as! DragDropToMiddleSlide
        let order = [3, 4, 5, 2, 1, 0]
        slide7.initSlide(parent: self, correctOrder: order, colorTheme: chapterColors[5], indexOfChapter: 5)
    
        return [slide1, slide2, slide3, slide4, slide5, slide6, slide7]
    }
    
    func createSlidesForChapter7() -> [UIView]{
        
        let slide1 = prepareTitleTextBottomImageSlide(titleId: "task07_1_title", textId: "task07_1_text", imageName: "task07_1_large")
        
        let slide2 = prepareTitleTextBottomImageSlide(titleId: "task07_2_title", textId: "task07_2_text", imageName: "task07_2_large")
        
        let slide3 = prepareTitleTextBottomImageSlide(titleId: "task07_3_title", textId: "task07_3_text", imageName: "task07_3_large")
        
        let slide4 = prepareTitleTextBottomImageSlide(titleId: "task07_4_title", textId: "task07_4_text", imageName: "task07_4_large")
        
        return [slide1, slide2, slide3, slide4]
    }
    
    func prepareTitleTextSlide(titleId: String, textId: String, bckImgName: String) -> TitleTextSlide{
        let slide: TitleTextSlide = Bundle(for: TitleTextSlide.self).loadNibNamed("TitleTextSlide", owner: self, options: nil)?.first as! TitleTextSlide
        let title = NSLocalizedString(titleId,comment:"nadpis")
        let text = NSLocalizedString(textId,comment:"text")
        slide.initSlide(titleText: title, description: text)
        slide.setBack(UIImage(named: bckImgName)!)
        return slide
    }
    
    func prepareThreeImagesModalSlide(titleId: String, captionsId: [String], descsId: [String], imagesName: [String], previewsName: [String]) -> ThreeImagesModalSlide{
        let slide: ThreeImagesModalSlide = Bundle(for: ThreeImagesModalSlide.self).loadNibNamed("ThreeImagesModalSlide", owner: self, options: nil)?.first as! ThreeImagesModalSlide
        let taskTitle = NSLocalizedString(titleId,comment:"title")
        
        var titles = [String]()
        for i in 0 ..< captionsId.count{
            titles.append(NSLocalizedString(captionsId[i],comment:"capt"))
        }
        
        var descriptions = [String]()
        for i in 0 ..< descsId.count{
            descriptions.append(NSLocalizedString(descsId[i],comment:"capt"))
        }
        
        var images = [UIImage]()
        for i in 0 ..< imagesName.count{
            images.append((UIImage(named: imagesName[i]) as UIImage?)!)
        }
        
        var previews = [UIImage]()
        for i in 0 ..< previewsName.count{
            previews.append((UIImage(named: previewsName[i]) as UIImage?)!)
        }
        
        slide.initSlide(title: taskTitle, captions: titles, previews: previews , images: images , desc: descriptions, parent: self)
        
        return slide
    }
    
    func prepareSplitImageDescSlide(titleId: String, descId: String, image: UIImage) -> SplitImageDescSlide{
        let slide: SplitImageDescSlide = Bundle(for: SplitImageDescSlide.self).loadNibNamed("SplitImageDescSlide", owner: self, options: nil)?.first as! SplitImageDescSlide
        let title = NSLocalizedString(titleId,comment:"title")
        let desc = NSLocalizedString(descId,comment:"desc")
        slide.initSlide(taskTitle: title, description: desc, imageCont: image)
        return slide
    }
    
    func prepareSplitImageDescSubtitleSlide(taskId: String, descId: String, subId: String, headerId: String, imageName:String) -> SplitImageDescSubtitleSlide{
        let slide: SplitImageDescSubtitleSlide = Bundle(for: SplitImageDescSlide.self).loadNibNamed("SplitImageDescSubtitleSlide", owner: self, options: nil)?.first as! SplitImageDescSubtitleSlide
        let taskTitle = NSLocalizedString(taskId,comment:"title")
        let desc = NSLocalizedString(descId,comment:"desc")
        let sub = NSLocalizedString(subId, comment: "subtitle")
        let header = NSLocalizedString(headerId, comment: "header")
        let image = UIImage(named: imageName) as UIImage?
        slide.initSlide(taskTitle: taskTitle, subtitle: sub, header: header, description: desc, imageCont: image!)
        return slide
    }
    
    func prepareSatelliteSlide(titleId: String, descId: String, statsId: String, flagImageName: String, satImageName: String) -> SatelliteSlide{
        let slide: SatelliteSlide = Bundle.main.loadNibNamed("SatelliteSlide", owner: self, options: nil)?.first as! SatelliteSlide
        let title = NSLocalizedString(titleId,comment:"title")
        let text = NSLocalizedString(descId,comment:"sattelite description")
        let stat = NSLocalizedString(statsId, comment: "statistics")
        slide.initSlide(title: title, text: text, statistic: stat, flagImg:(UIImage(named: flagImageName) )!, satImg: (UIImage(named: satImageName) )!)
        return slide
    }
    
    func prepareTitleTextBottomImageSlide(titleId:String, textId: String, imageName: String) -> TitleTextBottomImageSlide{
        let slide: TitleTextBottomImageSlide = Bundle(for: TitleTextBottomImageSlide.self).loadNibNamed("TitleTextBottomImageSlide", owner: self, options: nil)?.first as! TitleTextBottomImageSlide
        let title = NSLocalizedString(titleId,comment:"title")
        let text = NSLocalizedString(textId,comment:"desc")
        let image = UIImage(named: imageName) as UIImage?
        slide.initSlide(taskTitle: title, description: text, imageCont: image!)
        return slide
    }

    //adapts theme by chapter index
    func setupForChapter(index: Int){
        backgroundImage.image = chapterBackImage[index]
        homeButton.setImage(chapterHomeButtonImage[index], for: .normal)
        homeButton.setImage(chapterHomeButtonImagePressed[index], for: .highlighted)
        chapterNameLabel.text = NSLocalizedString(chapterNames[index],comment:"chapterTitle")
        topLine.backgroundColor = chapterColors[index]
        bottomLine.backgroundColor = chapterColors[index]
    }
    
    //shows fullscreen modal
    func showModal(image: UIImage, text: String){
        modalVC.setContent(image: image, text: text)
        modalVC.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        modalVC.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        present(modalVC, animated: true, completion: nil)
    }
    
    
    func viewWasDragged(view: UIView, draggedPoint: CGPoint) {
        print("Dragged Point : ", draggedPoint)
        
    }
    
    func viewWasDropped(view droppedView: UIView, droppedPoint: CGPoint) {
        ddToLineSlide?.snapView(view: droppedView, toPosition: droppedPoint)
        ddToMiddleSlide?.snapView(view: droppedView, toPosition: droppedPoint)
    }
}


//Extension which simulates behaviour of Toast in Android OS
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
