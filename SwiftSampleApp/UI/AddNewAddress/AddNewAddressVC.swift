//
//  AddNewAddressVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/5/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class AddNewAddressVC: UIViewController {
    @IBOutlet weak var mNameTf: UITextField!
    @IBOutlet weak var mFlatNoTf: UITextField!
    @IBOutlet weak var mAddressTf: UITextField!
    @IBOutlet weak var mSaveBtn: UIButton!
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
        
        mFlatNoTf.layer.borderWidth = 1.0
        mFlatNoTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mAddressTf.layer.borderWidth = 1.0
        mAddressTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mSaveBtn.layer.borderWidth = 1.0
        mSaveBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mSaveBtn.layer.cornerRadius = 20;
        
        mAddressTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        mNameTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        mFlatNoTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
    }
    
    @IBAction func selectBtnAction(sender:UIButton){
        
        for tag in 100..<102 {
            let btn: UIButton = self.view.viewWithTag(tag) as! UIButton
            btn.isSelected = false
            
        }
        let btn: UIButton = sender
        btn.isSelected = true
    }
    
}
