//
//  FeedbackVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class FeedbackVC: UIViewController {
    
    @IBOutlet weak var mCommentsTf: UITextField!
    @IBOutlet weak var mQueBtn: UIButton!
    @IBOutlet weak var mAnsBtn: UIButton!
    @IBOutlet weak var mSendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        mCommentsTf.layer.borderWidth = 1.0
        mCommentsTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        mCommentsTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 5, 0)
        
        mQueBtn.layer.borderWidth = 1.0
        mQueBtn.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mAnsBtn.layer.borderWidth = 1.0
        mAnsBtn.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mSendBtn.layer.borderWidth = 1.0
        mSendBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mSendBtn.layer.cornerRadius = 16;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func backBtnAction(sender:UIButton){
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }
}
