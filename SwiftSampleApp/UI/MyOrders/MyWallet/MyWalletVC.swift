//
//  MyWalletVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/20/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class MyWalletVC: UIViewController {

    @IBOutlet weak var mWalletLbl: UILabel!
    @IBOutlet weak var mRechargeBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        let attributeStr = NSMutableAttributedString(string: "₹ 171")
        
        attributeStr.addAttribute(NSForegroundColorAttributeName, value: UIColor.lightGray, range: NSRange(location: 0, length: 1))
        
        mWalletLbl.attributedText = attributeStr
        
        mRechargeBtn.layer.borderWidth = 1.0
        mRechargeBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mRechargeBtn.layer.cornerRadius = 16;
        
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
