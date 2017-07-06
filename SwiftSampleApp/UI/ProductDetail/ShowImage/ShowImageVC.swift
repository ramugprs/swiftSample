//
//  ShowImageVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/20/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class ShowImageVC: UIViewController,UIScrollViewDelegate {
    
    @IBOutlet weak var mScollview: UIScrollView!
    @IBOutlet weak var mPagecontroler: UIPageControl!
    var mImagesArray:NSArray!
    @IBOutlet weak var mContentSizeH: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        addImagesToScrollView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        mPagecontroler.currentPage =  Int(scrollView.contentOffset.x / scrollView.bounds.size.width)
    }
    
    @IBAction func closeBtnAction(sender:UIButton){
        self.dismiss(animated: false, completion: nil)
    }
    func addImagesToScrollView(){
        
        mPagecontroler.numberOfPages = mImagesArray.count
        
        for index in 0..<mImagesArray.count{
            
            let mImage :UIImageView = UIImageView()
            
            mImage.frame = CGRect(x: (index * Int(UIScreen.main.bounds.size.width)),y: 0,width: Int(UIScreen.main.bounds.size.width),height: Int(mScollview.frame.size.height))
            mImage.image = UIImage(named: mImagesArray[index] as! String)
            mImage.contentMode = .scaleAspectFit
            mScollview.addSubview(mImage)
            
        }
        
        mContentSizeH.constant = CGFloat(CGFloat(mImagesArray.count) * UIScreen.main.bounds.size.width)
    }
}
