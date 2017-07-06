//
//  SignUpVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/30/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet weak var mNameTf: UITextField!
    @IBOutlet weak var mEmailTf: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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
    
    func setUI(){
        mNameTf.layer.borderWidth = 1.0
        mNameTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mEmailTf.layer.borderWidth = 1.0
        mEmailTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mNameTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        mEmailTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
    }
}
