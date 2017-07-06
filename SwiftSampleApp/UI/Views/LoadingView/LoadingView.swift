//
//  LoadingView.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//


import UIKit

protocol LoadingViewDelegate: class {
    func removeLoadingView();
}

class LoadingView: UIView {
    
    @IBOutlet weak var mRetryBtn: UIButton!
    weak var mDelegate: LoadingViewDelegate?
    
    class func loadnib() -> LoadingView{
        return UINib(nibName: "LoadingView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! LoadingView
    }
    
    public func setUI(){
        mRetryBtn.layer.borderWidth = 1.0
        mRetryBtn.layer.borderColor = UIColor.white.cgColor
        mRetryBtn.layer.cornerRadius = 14;
    }
    
    @IBAction func gotoMain(sender: UIButton){
        self.mDelegate?.removeLoadingView()
    }
    
}
