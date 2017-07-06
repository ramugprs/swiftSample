//
//  LoginVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/30/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class LoginVC: UIViewController,errorViewDelegate,LoadingViewDelegate {

    @IBOutlet weak var mOtpView: UIView!
    @IBOutlet weak var mNumberTf: UITextField!
    @IBOutlet weak var mOtpTf: UITextField!
    @IBOutlet weak var mCountyCodeBtn: UIButton!
    @IBOutlet weak var mNextBtn: UIButton!
    var mErrorView: LoadingView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setUI(){
        mNumberTf.layer.borderWidth = 1.0
        mNumberTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
     
        mOtpTf.layer.borderWidth = 1.0
        mOtpTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mCountyCodeBtn.layer.borderWidth = 1.0
        mCountyCodeBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        
        mNumberTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        mOtpTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        
        self.perform(#selector(createErrorView), with: nil, afterDelay: 3.0)
    }
    
    @IBAction func backBtnAction(sender:UIButton?){
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }
    
    @IBAction func nextBtnAction(sender: Any){
        mOtpView.isHidden = false
        mNextBtn.isHidden = true

    }
    
    func createErrorView(){
        mErrorView = LoadingView.loadnib()
        mErrorView?.frame = UIScreen.main.bounds
        mErrorView?.mDelegate = self
        mErrorView?.setUI()
        self.view.addSubview(mErrorView!)
        
    }
    func removeErrorView(){
        mErrorView?.removeFromSuperview()
        self.backBtnAction(sender: nil)
    
    }
    func removeLoadingView(){
        mErrorView?.removeFromSuperview()
        self.backBtnAction(sender: nil)
    }
}
