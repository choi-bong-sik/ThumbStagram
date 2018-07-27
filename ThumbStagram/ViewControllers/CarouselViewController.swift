//
//  CarouselViewController.swift
//  ThumbStagram
//
//  Created by jake on 2018. 7. 27..
//  Copyright © 2018년 jake. All rights reserved.
//

import UIKit

class CarouselViewController: DetailViewController,UIScrollViewDelegate {
    @IBOutlet weak var scrContent: UIScrollView!
    
    var pageControl = UIPageControl()
    override func viewDidLoad() {
        super.viewDidLoad()
        if contentData != nil {
            self.setViews()
        }
    }
    override func setViews() {
        super.setViews()
        var imgCounter = 0
        for data in self.contentData!.carouselMedia {
            if data.type == "image" {
                let imgView = UIImageView()
                imgView.loadImageUsingCache(withUrl: data.images.standardResolution.url)
                scrContent.addSubview(imgView)
                imgView.frame = CGRect(x: CGFloat(imgCounter) * scrContent.frame.size.width,
                                       y: 0,
                                       width: scrContent.frame.size.width,
                                       height: scrContent.frame.size.height)
                imgView.contentMode = UIViewContentMode.scaleAspectFit
                imgCounter += 1
            }
        }
        scrContent.contentSize = CGSize(width: CGFloat(imgCounter)*scrContent.frame.size.width,
                                        height: 0)
        self.configurePageControl(count: imgCounter)
    }
    func configurePageControl(count:Int) {
        // The total number of pages that are available is based on how many available colors we have.
        self.pageControl.frame = CGRect(x: 0, y: self.view.frame.size.height - 40, width: self.view.frame.size.width, height: 20)
        self.pageControl.addTarget(self, action: #selector(self.changePage(sender:)), for: UIControlEvents.valueChanged)
        self.pageControl.currentPageIndicatorTintColor = .lightGray
        self.pageControl.pageIndicatorTintColor = .darkGray
        self.pageControl.numberOfPages = count
        self.pageControl.currentPage = 0
        self.view.addSubview(self.pageControl)
        
    }
    
    // MARK : TO CHANGE WHILE CLICKING ON PAGE CONTROL
    @objc func changePage(sender: AnyObject) -> () {
        let x = CGFloat(pageControl.currentPage) * scrContent.frame.size.width
        scrContent.setContentOffset(CGPoint(x:x, y:0), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}
