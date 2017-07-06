//
//  CheckOutVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/31/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class CheckOutVC: UIViewController {

    @IBOutlet weak var mChangeAddressBtn:UIButton!
    @IBOutlet weak var mCheckOutBtn:UIButton!
    @IBOutlet weak var mCodeTf:UITextField!
    
    @IBOutlet weak var mDatesView:UIView!
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
        
        mDatesView.layer.borderWidth = 1.0
        mDatesView.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mChangeAddressBtn.layer.borderWidth = 1.0
        mChangeAddressBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mChangeAddressBtn.layer.cornerRadius = 18;
        
        mCheckOutBtn.layer.borderWidth = 1.0
        mCheckOutBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mCheckOutBtn.layer.cornerRadius = 20;
        
        mCodeTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        mCodeTf.layer.borderWidth = 1.0
        mCodeTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
    }
    
    @IBAction func chageAddressBtnAction(sender:UIButton){
        
        let mSelectAddressVC: SelectAddressVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SelectAddressVC") as! SelectAddressVC
        self.navigationController?.pushViewController(mSelectAddressVC, animated: false)
        
    }
    
    @IBAction func gotoDeliveryDetailsVC(sender:UIButton){
        
        let mDeliveryDetailsVC: DeliveryDetailsVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "DeliveryDetailsVC") as! DeliveryDetailsVC
        self.navigationController?.pushViewController(mDeliveryDetailsVC, animated: false)
        
    }
    
}
