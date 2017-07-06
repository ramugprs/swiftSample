//
//  ProductListVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/15/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class ProductListVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var mCollectionView:UICollectionView!
    var mProductArray:NSArray!
    var mSelectedVal:Int!
    var isFrom:Bool = false // dummmy
    @IBOutlet weak var mProductListTv:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mSelectedVal = 0
        mProductArray = ["Vegetables","Fruits","Fruits & Vegetables"]
        
        self.tappedBtnAction(sender: self.view.viewWithTag(100) as! UIButton)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mProductArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifer:String = "Cell"
        let cell:productCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as! productCVCell
        
        cell.mTitleLabel.text = mProductArray[indexPath.item] as? String
        if mSelectedVal == indexPath.row {
            cell.mBottomLine.isHidden = false
            cell.mBackImage.isHidden = true
            cell.mTitleLabel.textColor = UIColor.init(colorLiteralRed: 0.87 , green: 0.38, blue: 0.22, alpha: 1.0)
        }
        else{
            cell.mBottomLine.isHidden = true
            cell.mBackImage.isHidden = false
            cell.mTitleLabel.textColor = UIColor.darkGray
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:140,height:45)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mSelectedVal = indexPath.row
        self.mCollectionView.reloadData()
    }
    
    @IBAction func backBtnAction(sender:UIButton){
        
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }

    @IBAction func tappedBtnAction( sender: UIButton){
        
        for i in 100..<103{
            let mBtn:UIButton = self.view.viewWithTag(i) as! UIButton
            mBtn.isSelected = false
            mBtn.layer.cornerRadius = 18
            mBtn.layer.borderWidth = 1.0
            mBtn.layer.borderColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 1.0).cgColor
            mBtn.clipsToBounds = true
            
        }
        let mBtn:UIButton = sender
        mBtn.isSelected = true
        mBtn.layer.cornerRadius = 18
        mBtn.layer.borderWidth = 1.0
        mBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mBtn.clipsToBounds = true
        
    }
    
    //Mark UITableViewDelegate and Datasource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5;
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier:String = "Cell"
        
        let cell:ProductTVCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProductTVCell
        
        cell.mperscentLbl.layer.borderWidth = 1.0
        cell.mperscentLbl.layer.cornerRadius = 4.0
        cell.mperscentLbl.layer.borderColor = UIColor.init(red: 18/255.0, green: 136/255.0, blue: 51/255.0, alpha: 1.0).cgColor
        cell.mperscentLbl.clipsToBounds = true
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: cell.mDiscountLbl.text!)
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.lightGray, range: NSMakeRange(0, attributeString.length))

        cell.mDiscountLbl.attributedText = attributeString
        
        cell.mPlusBtn.tag = indexPath.row
        cell.mMinusBtn.tag = indexPath.row
        
        cell.mPlusBtn.addTarget(self, action: #selector(addProduct), for: .touchUpInside)
        cell.mMinusBtn.addTarget(self, action: #selector(minusProduct), for: .touchUpInside)
        
        if isFrom {
            cell.mMinusBtn.isHidden = false
        }
        else{
            cell.mMinusBtn.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mProductDetailVC:ProductDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        self.navigationController?.pushViewController(mProductDetailVC, animated: false)
        
    }
    
    func addProduct(sender:UIButton){
        isFrom = true
        let paths = IndexPath(row: sender.tag, section: 0)
        mProductListTv.reloadRows(at: [paths], with: .none)
    }
    func minusProduct(sender:UIButton){
        isFrom = false
        let paths = IndexPath(row: sender.tag, section: 0)
        mProductListTv.reloadRows(at: [paths], with: .none)
    }
    
    @IBAction func switchedCategoryBtnAction(sender: UIButton){
        
        let mSwitchCategoryVC:SwitchCategoryVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SwitchCategoryVC") as! SwitchCategoryVC
        self.present(mSwitchCategoryVC, animated: false, completion: nil)
        
    }
    
    @IBAction func filterByBtnAcion(sender: UIButton){
        
        let mFilterByVC: FilterByVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "FilterByVC") as! FilterByVC
        self.present(mFilterByVC, animated: false, completion: nil)
        
        
    }
}
