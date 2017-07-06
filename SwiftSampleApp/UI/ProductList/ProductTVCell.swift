//
//  ProductTVCell.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/17/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class ProductTVCell: UITableViewCell,UICollectionViewDataSource,UICollectionViewDelegate {

    @IBOutlet weak var mkgCV:UICollectionView!
    @IBOutlet weak var mperscentLbl:UILabel!
    @IBOutlet weak var mDiscountLbl:UILabel!
    @IBOutlet weak var mPlusBtn:UIButton!
    @IBOutlet weak var mMinusBtn:UIButton!
    @IBOutlet weak var mNotifyBtn:UIButton!
    @IBOutlet weak var mNotifyView:UIView!
    @IBOutlet weak var mNotAvailBtn:UIButton!
    @IBOutlet weak var mNotAvailH: NSLayoutConstraint!
    
    @IBOutlet weak var mRemoveCartView:UIView! //this view for remove item from cart
        @IBOutlet weak var mRemoveBtn:UIButton!
        @IBOutlet weak var mCacelBtn:UIButton!
        @IBOutlet weak var mRemoveInnerView:UIView!
    var mSelectedRow:Int = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier:String = "cell"
        let cell:KgCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! KgCell
        cell.mKgLabel.text = "\(indexPath.item + 1) Kg"
        
        cell.mKgLabel.layer.borderWidth = 1.0
        cell.mKgLabel.layer.cornerRadius = 5.0
        cell.mKgLabel.clipsToBounds = true
        
        if indexPath.item == mSelectedRow {
            
            cell.mKgLabel.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
            cell.mKgLabel.textColor = UIColor.init(colorLiteralRed: 0.87, green: 0.38, blue: 0.22, alpha: 1.0)
        }
        else{
            cell.mKgLabel.layer.borderColor = UIColor.lightGray.cgColor
            cell.mKgLabel.textColor = UIColor.lightGray
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mSelectedRow = indexPath.item
        mkgCV.reloadData()
    }
}
