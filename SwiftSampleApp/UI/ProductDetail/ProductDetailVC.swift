//
//  ProductDetailVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/18/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class ProductDetailVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var mKgCV:UICollectionView!
    @IBOutlet weak var mPicsCV:UICollectionView!
    @IBOutlet weak var mCategoriesCV:UICollectionView!
    @IBOutlet weak var mperscentLbl:UILabel!
    @IBOutlet weak var mDiscountLbl:UILabel!
    @IBOutlet weak var mCompareBtn:UIButton!
    @IBOutlet weak var mBigImageBtn:UIButton!
    
    var mPicsArray:NSArray!
    var mProductArray:NSArray!
    var mKgIndexRow:Int = 0
    var mPicIndex:Int = 0
    var mCategoryInedx:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mPicsArray = ["FrenchBeans","mixedPotato","Onion","OotyCarrot","potato"]
        mProductArray = ["OverView","Nutrition Facts","Ingradients"]
        selectedImge(imagestr: mPicsArray[0] as! String)
        mperscentLbl.layer.borderWidth = 1.0
        mperscentLbl.layer.cornerRadius = 4.0
        mperscentLbl.layer.borderColor = UIColor.init(red: 18/255.0, green: 136/255.0, blue: 51/255.0, alpha: 1.0).cgColor
        mperscentLbl.clipsToBounds = true
        
        mCompareBtn.layer.borderWidth = 1
        mCompareBtn.layer.cornerRadius = 14
        mCompareBtn.layer.borderColor = UIColor.init(red: 0.87 , green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mCompareBtn.clipsToBounds = true
        
        let attributedStr:NSMutableAttributedString = NSMutableAttributedString(string: mDiscountLbl.text!)
        
        attributedStr.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.lightGray, range: NSMakeRange(0,attributedStr.length))
        attributedStr.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0,attributedStr.length))
        
        mDiscountLbl.attributedText = attributedStr
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backbtnAction(sender:UIButton){
        
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }

    }

    // MARK: - UICollectionViewDelegate,UICollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier:String = "Cell"
        if collectionView == mKgCV {
            let cell:KgCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! KgCell
            
            cell.mKgLabel.text = "\(indexPath.item + 1) Kg"
            
            cell.mKgLabel.layer.borderWidth = 1.0
            cell.mKgLabel.layer.cornerRadius = 5.0
            cell.mKgLabel.clipsToBounds = true
            
            if indexPath.item == mKgIndexRow {
                
                cell.mKgLabel.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
                cell.mKgLabel.textColor = UIColor.init(colorLiteralRed: 0.87, green: 0.38, blue: 0.22, alpha: 1.0)
            }
            else{
                cell.mKgLabel.layer.borderColor = UIColor.lightGray.cgColor
                cell.mKgLabel.textColor = UIColor.lightGray
            }
            
            return cell
        }
        else if collectionView == mPicsCV {
            
            let cellIdentifer:String = "Cell"
            let cell:SelectPicCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as! SelectPicCell
            cell.mImage.image = UIImage(named: mPicsArray[indexPath.item] as! String)
            
            cell.mImage.layer.borderWidth = 1.0
            cell.mImage.layer.cornerRadius = 3.0
            cell.mImage.clipsToBounds = true
            
            if indexPath.item == mPicIndex {
                
                cell.mImage.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
                
            }
            else{
                cell.mImage.layer.borderColor = UIColor.clear.cgColor
                
            }
            
            return cell
        }
        else  {
            let cellIdentifer:String = "Cell"
            let cell:productCVCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifer, for: indexPath) as! productCVCell
            
            cell.mTitleLabel.text = mProductArray[indexPath.item] as? String
            if mCategoryInedx == indexPath.row {
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
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == mKgCV {
            mKgIndexRow = indexPath.item
            mKgCV.reloadData()

        }
        else if collectionView == mPicsCV {
            mPicIndex = indexPath.item
            mPicsCV.reloadData()
            selectedImge(imagestr: mPicsArray[indexPath.item] as! String)
        }
        else {
            mCategoryInedx = indexPath.item
            mCategoriesCV.reloadData()
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == mKgCV {
            
            return 4
        }
        else if collectionView == mPicsCV {
            return mPicsArray.count
        }
        else {
            return mProductArray.count
        }

    }
    func selectedImge(imagestr: String){
        mBigImageBtn.setImage(UIImage(named: imagestr), for: .normal)
    }
    
    @IBAction func imageClickedBtnAction(sender: UIButton){
        
        let mShowImageVC: ShowImageVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShowImageVC") as! ShowImageVC
        mShowImageVC.mImagesArray = mPicsArray
        self.present(mShowImageVC, animated: false, completion: nil)
        
    }
}
