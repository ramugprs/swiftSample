//
//  DeliveryDetailsVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/6/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class DeliveryDetailsVC: UIViewController {

    @IBOutlet weak var mCashBackTf: UITextField!
    @IBOutlet weak var mProceedBtn: UIButton!
    
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
        mCashBackTf.layer.borderWidth = 1.0
        mCashBackTf.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        
        mProceedBtn.layer.borderWidth = 1.0
        mProceedBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mProceedBtn.layer.cornerRadius = 18;
        
        mCashBackTf.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
    }
    
    @IBAction func addNewAddressBtnAction(sender:UIButton){
        
        let mAddNewAddressVC: AddNewAddressVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(mAddNewAddressVC, animated: false)
    }
    
    @IBAction func proceedPayment(sender:UIButton){
        
        let mMyOrderVC: MyOrderVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MyOrderVC") as! MyOrderVC
        mMyOrderVC.isFromController = "Delivery"
        self.navigationController?.pushViewController(mMyOrderVC, animated: false)
    }
    
}
