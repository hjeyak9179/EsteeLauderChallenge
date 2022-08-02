//
//  ViewController.swift
//  EsteeLauderChallenge
//
//  Created by Harshitha Jeyakumar on 8/2/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageSliderCollectionView: UICollectionView!
    @IBOutlet weak var sliderPageControl: UIPageControl!
    
    
    var images = [
        UIImage(named: "6"),
        UIImage(named: "0"),
        UIImage(named: "11")
    ]
    
    var counter = 0
    var timer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sliderPageControl.numberOfPages = images.count
        sliderPageControl.currentPage = 0
        DispatchQueue.main.async {
            self.timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.slide), userInfo: nil, repeats: true)
        }
        // Do any additional setup after loading the view.
    }
    
    func scrollViewDidControl(_ scrollView: UIScrollView) {
        let scrollPos = scrollView.contentOffset.x / view.frame.width
        sliderPageControl.currentPage = Int(scrollPos)
    }

    @objc func slide() {
       
        if counter < images.count {
            let index = IndexPath(item: counter, section: 0)
            self.imageSliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: true)
            sliderPageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
            let index = IndexPath.init(item: counter, section: 0)
            self.imageSliderCollectionView.scrollToItem(at: index, at: .centeredHorizontally, animated: false)
            sliderPageControl.currentPage = counter
            counter = 1
        }
    }

}

