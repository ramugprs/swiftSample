//
//  SearchVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/24/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SearchVC: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var mCollectionView:UICollectionView!
    var mArray: NSArray!
    var mSeleectedRow: Int!
    @IBOutlet weak var mSerchTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        mArray = ["Offer & Promotions","Fruits & Vegetables","Grocery & Staples","Household Needs","Namdhari's Branded","Bread,Dairy & Frozen","Personal Care","Gourment","Branded Products","Beverages","Gardening Need"]
        
        mSerchTF.layer.sublayerTransform = CATransform3DMakeTranslation(10, 0, 0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellIdentifier:String = "cell"
        let cell:KgCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! KgCell
        
        cell.mKgLabel.text = mArray[indexPath.row] as? String
        if let value = mSeleectedRow {
            if value == indexPath.row {
                cell.mImage.image = UIImage(named: "circle_green")
            }
            else{
                cell.mImage.image = UIImage(named: "Circle_gray")
            }
        }
        else{
            cell.mImage.image = UIImage(named: "Circle_gray")
        }
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return mArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(self.view.frame.size.width/2 - 4) ,height:40)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mSeleectedRow = indexPath.row
        mCollectionView.reloadData()
    }
    
    @IBAction func closeBtnAction(sender:UIButton){
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func backBtnAction(sender:UIButton){
        
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }
}
