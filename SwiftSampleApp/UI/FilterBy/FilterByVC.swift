//
//  FilterByVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class FilterByVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mTableView:UITableView!
    @IBOutlet weak var clearBtn:UIButton!
    @IBOutlet weak var mShortItemsbtn:UIButton!
    
    @IBOutlet weak var mSeparatorX:NSLayoutConstraint!
    @IBOutlet weak var mVerSeparatorX:NSLayoutConstraint!
    
    var mCommonDict = [String: NSMutableArray]()
    
    var mCommonArray:NSMutableArray = []
    
    var mPriceSelectedArray:NSMutableArray = []
    var mBrandSelectedArray:NSMutableArray = []
    var mOtherSelectedArray:NSMutableArray = []
    var mCommonSelectedArray:NSMutableArray = []
    var filterType:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mCommonDict = ["priceArray":["Less than ₹20","₹20 - ₹50","₹51 - ₹100","₹101 - ₹200","₹201 - ₹300","₹301 - ₹500","More than ₹500"],"brandsArray":["Everest Fresh","Namdhari Fresh","Ooty Organic Farm","Mandya Sugar Factory","Gopalan Heritage Organic","Sparsha Bio","Village Nati Specials"],"OthersArray":["Popularity","Price - Low to High","Price - High to Low","Alphabetical Order","Deals/Saving - High to Low","Deals/Saving - Low to High","Off in % - High to Low"]]
        self.selectFilterBtnAction(sender: self.view.viewWithTag(100) as! UIButton)
        
        clearBtn.layer.cornerRadius = 25; clearBtn.layer.borderWidth = 1.0; clearBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor; clearBtn.clipsToBounds = true
        
        mShortItemsbtn.layer.cornerRadius = 25; mShortItemsbtn.layer.borderWidth = 1.0; mShortItemsbtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor; mShortItemsbtn.clipsToBounds = true
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeBtnAction(sender:UIButton){
        self.dismiss(animated: false, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: FilterByCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! FilterByCell
        cell.mPriceLbl.text = self.mCommonArray[indexPath.row] as? String
        
        
        
        if mCommonSelectedArray .contains(indexPath.row) {
            cell.mSelectedImage.image = UIImage(named: "circle_green")
            cell.mBgView.backgroundColor = UIColor(red:240/255.0, green:245/255.0, blue:247/255.0, alpha:1.0)
        }
        else{
            cell.mSelectedImage.image = UIImage(named: "Circle_gray")
            cell.mBgView.backgroundColor = UIColor.white
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.mCommonArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        mCommonSelectedArray = []
        if filterType == "price" {
            if mPriceSelectedArray .contains(indexPath.row) {
                mPriceSelectedArray.remove(indexPath.row)
            }
            else{
                mPriceSelectedArray.add(indexPath.row)
            }
            mCommonSelectedArray = mPriceSelectedArray
        }
        else if filterType == "brands" {
            if mBrandSelectedArray .contains(indexPath.row) {
                mBrandSelectedArray.remove(indexPath.row)
            }
            else{
                mBrandSelectedArray.add(indexPath.row)
            }
            mCommonSelectedArray = mBrandSelectedArray
        }
        else{
            if mOtherSelectedArray .contains(indexPath.row) {
                mOtherSelectedArray.remove(indexPath.row)
            }
            else{
                mOtherSelectedArray.add(indexPath.row)
            }
            mCommonSelectedArray = mOtherSelectedArray
        }
        mTableView.reloadData()
    }
    
    @IBAction func selectFilterBtnAction(sender:UIButton){
        
        mCommonSelectedArray = []
        for tag in 100..<103 {
            let btn:UIButton = self.view.viewWithTag(tag) as! UIButton
            btn.backgroundColor = UIColor.clear
            btn.isSelected = false
        }
        
        let btn:UIButton = self.view.viewWithTag(sender.tag) as! UIButton
        btn.backgroundColor = UIColor.white
        btn.isSelected = true
        
        if mCommonArray.count > 0 {
            self.mCommonArray = []
        }
        
        if sender.tag == 100 {
            self.mCommonArray = mCommonDict["priceArray"]!
            mSeparatorX.constant = 0
            mVerSeparatorX.constant = 2*UIScreen.main.bounds.width/3
            filterType = "price"
            mCommonSelectedArray = mPriceSelectedArray
        }
        else if sender.tag == 101 {
            self.mCommonArray = mCommonDict["brandsArray"]!
            mSeparatorX.constant = UIScreen.main.bounds.width/3
            filterType = "brands"
            mCommonSelectedArray = mBrandSelectedArray
        }
        else if sender.tag == 102 {
            self.mCommonArray = mCommonDict["OthersArray"]!
            mSeparatorX.constant = 2*UIScreen.main.bounds.width/3
            mVerSeparatorX.constant = UIScreen.main.bounds.width/3
            filterType = "Others"
            mCommonSelectedArray = mOtherSelectedArray
        }
        
        mTableView.reloadData()
    }
    
    @IBAction func clearAllorShortItems(sender:UIButton){
        if sender.tag == 200 {
            //clear all
            
            if filterType == "price" {
                mPriceSelectedArray = []
            }
            else if filterType == "brands" {
                mBrandSelectedArray = []
            }
            else{
                mOtherSelectedArray = []
            }
            mCommonSelectedArray = []
        }
        else{
            //Short Items
        }
        mTableView.reloadData()
    }
}
