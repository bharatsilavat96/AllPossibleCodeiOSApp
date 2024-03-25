//
//  PageControlViewController.swift
//  AllInOneiOSProjectApp
//
//  Created by Apple on 17/04/23.
//

import UIKit

class PageControlViewController: UIViewController,UIScrollViewDelegate {
    
    var scrollView = UIScrollView()
        var pageControl = UIPageControl()
        var isPageControlUsed = false
        
        override func viewDidLoad() {
            super.viewDidLoad()

            var screenFarme = UIScreen.main.bounds
            let screenWidth = screenFarme.size.width
            let screemHeight = screenFarme.size.height
            
            scrollView.frame = screenFarme
            scrollView.isPagingEnabled = true
            scrollView.contentSize = CGSize(width: screenWidth * 2, height: screemHeight)
            scrollView.delegate = self
            
            let pageControllerHeight: CGFloat =  50.0
            let pageControllerRectangle = CGRect(x: 0, y: screemHeight - pageControllerHeight, width: screenWidth, height: pageControllerHeight)
            pageControl.frame = pageControllerRectangle
            pageControl.numberOfPages = 2
            pageControl.currentPage = 0
            pageControl.backgroundColor = UIColor.gray
            pageControl.addTarget(self, action: #selector(pageControllerDidChange), for: .valueChanged)
            
            let firstController = FirstPageSubViewController()
            screenFarme.origin.x = 0
            firstController.view.frame = screenFarme
            
            let secondController = SecondPageSubViewController()
            screenFarme.origin.x = screenFarme.size.width
            secondController.view.frame = screenFarme
            
            scrollView.addSubview(firstController.view)
            scrollView.addSubview(secondController.view)
            
            self.view.addSubview(scrollView)
            self.view.addSubview(pageControl)
            
            
            
        }
        @objc func pageControllerDidChange() {
            let currentPage = (CGFloat)(pageControl.currentPage)
            var frame = scrollView.frame
            frame.origin.x = 0
            
            scrollView.scrollRectToVisible(frame, animated: true)
            isPageControlUsed = true
        }

        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            if (!isPageControlUsed) {
                
                let pageWidth = scrollView.frame.size.width
                let page = floor((scrollView.contentOffset.x - pageWidth/2)/pageWidth) + 1
                pageControl.currentPage = Int(page)
            }
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            isPageControlUsed = false
        }
       
    }
