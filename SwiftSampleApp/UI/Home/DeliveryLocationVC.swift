//
//  DeliveryLocationVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 4/30/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController
import Alamofire

class DeliveryLocationVC: UIViewController,iCarouselDataSource,iCarouselDelegate,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet var caurosel:iCarousel!
    @IBOutlet var allproductView:UIView!
    @IBOutlet var dealsView:UIView!
    @IBOutlet var separtorX:NSLayoutConstraint!
    @IBOutlet var mPageController:UIPageControl!
    @IBOutlet weak var mAllProductBtn:UIButton!
    @IBOutlet weak var mDealsBtn:UIButton!
    @IBOutlet weak var mProductsCV:UICollectionView!
    var itemsNamesArray:NSArray!
    @IBOutlet weak var mTableView: UITableView!
        @IBOutlet var mHeaderView:UIView!
        @IBOutlet weak var mTotalsDealsBtn:UIButton!
        @IBOutlet weak var mSavingBtn:UIButton!
    @IBOutlet var mBannerView:UIView!
    var isFromSavings: Bool = false
    var mArray: NSArray? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self .tappedBtnAction(sender: self.mAllProductBtn)
        
        self.itemsNamesArray = ["Fruits & Vegetables","Grocery & Staples","Household Needs","Namdhari's branded","Bread,Dairy & Frozen","Personal Care","Gourment","Branded Products","Baverages","Gardening Needs"]
        
        mArray = ["Grocery_Staples","HouseholdNeeds","Namdhari’sFresh-Branded","Bread,Diary_Frozen","PersonalCare","Gourmet","BrandedProducts","Beverages","GardeningNeed",]
        
        
        caurosel.reloadData()
        self.mPageController.numberOfPages = mArray!.count
        caurosel.type = .linear
        caurosel.isPagingEnabled = true
    
        SJSwiftSideMenuController.enableDimBackground = true
        mTableView.estimatedRowHeight = 40
        mTableView.tableHeaderView = mHeaderView
        
        mTotalsDealsBtn.layer.borderWidth = 1.0
        
        mTotalsDealsBtn.layer.cornerRadius = 15;
        
        mSavingBtn.layer.borderWidth = 1.0
        
        mSavingBtn.layer.cornerRadius = 15;
        
//        var requestDict:[String : String] = [:]
//        
//        requestDict["userid"] = "1"
//        
//        Alamofire.request(Constants.DASHBOARADURL1, method: .get, parameters: ["":""], encoding: JSONEncoding.default, headers: nil).responseJSON { response in
//            
//            switch(response.result) {
//            case .success(_):
//                if let data = response.result.value{
//                    print(data)
//                    let resultDict: [String : Any] = data as! [String : Any]
//                    print("Status is \(resultDict["message"] ?? "")")
//                }
//                break
//                
//            case .failure(_):
//                print(response.result.error?.localizedDescription ?? "")
//                break
//                
//            }
//            
//        }
        
        // Do any additional setup after loading the view.
    }
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfItems(in carousel: iCarousel) -> Int {
        return mArray!.count
    }
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        
        var itemView: UIImageView
        
        itemView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width-10, height: 130))
        
        itemView.image = UIImage(named: mArray?[index] as! String)
        itemView.contentMode = .scaleToFill
        
        return itemView
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.0
        }
        return value
    }
    
    @IBAction func tappedBtnAction(sender:UIButton){
        if sender.tag == 100 {
            
            self.separtorX.constant = 0;

            self.mAllProductBtn.isSelected = true
            self.mDealsBtn.isSelected = false
            
            self.mAllProductBtn.backgroundColor = UIColor.white
            self.mDealsBtn.backgroundColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0)
            
            mBannerView.isHidden = false
            mTableView.isHidden = true
            mProductsCV.isHidden = false
            
        }
        else if sender.tag == 101{
            self.separtorX.constant = self.view.frame.size.width/2

            self.mAllProductBtn.isSelected = false
            self.mDealsBtn.isSelected = true
            
            self.mAllProductBtn.backgroundColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0)
            self.mDealsBtn.backgroundColor = UIColor.white
            
            mBannerView.isHidden = true
            mTableView.isHidden = false
            mProductsCV.isHidden = true
            self.dealsSaving(sender: self.view.viewWithTag(200) as! UIButton)
            
        }
    }
    
    func carouselCurrentItemIndexDidChange(_ carousel: iCarousel) {
        self.mPageController.currentPage = carousel.currentItemIndex
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.itemsNamesArray.count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cellidentifier:String = "cell"
            
        let cell : ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellidentifier, for: indexPath) as! ProductCell
        
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.lightGray .cgColor
        
        cell.mNameLbl.text =  self.itemsNamesArray[indexPath.item] as? String
        return cell
        
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let mProductListVC : ProductListVC = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "ProductListVC") as! ProductListVC
        
        self.navigationController?.pushViewController(mProductListVC, animated: false)
        
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:(self.view.frame.size.width/2-15),height:160)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
        return 10;
    }

    @IBAction func cartBtnAction(sender:UIButton){
        
        let mCartVC:CartVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "CartVC") as! CartVC
        self.navigationController?.pushViewController(mCartVC, animated: false)
    }
    
    @IBAction func searchBtnAction(sender:UIButton){
        
        let mSearchVC:SearchVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "SearchVC") as! SearchVC
        self.present(mSearchVC, animated: false, completion: nil)
        
    }
    
    @IBAction func editLocationBtnAction(sender:UIButton){
        
        let mLocationVC:LocationVC = UIStoryboard(name:"Main", bundle:nil).instantiateViewController(withIdentifier: "LocationVC") as! LocationVC
        self.navigationController?.pushViewController(mLocationVC, animated: false)
        
    }
    @IBAction func menuBtnAction(sender:UIButton){
        SJSwiftSideMenuController.toggleLeftSideMenu()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if isFromSavings == true{
            
            mTableView.register(UINib(nibName: "SavingCell", bundle: nil), forCellReuseIdentifier: "cell1")
            let cell: SavingCell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! SavingCell
            
            return cell
        }
        else{
            let cell: DealsSavingCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DealsSavingCell
            
            if indexPath.row == 0 {
                cell.mImage?.image = UIImage(named: "offer1")
            }
            else
            {
                cell.mImage?.image = UIImage(named: "offer2")
            }
            
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isFromSavings == true{
            let mSavingDetailsVC: SavingDetailsVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SavingDetailsVC") as! SavingDetailsVC
            self.present(mSavingDetailsVC, animated: false, completion: nil)
        }
        else{
            let mDealsDetailsVC: DealsDetailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DealsDetailVC") as! DealsDetailVC
            self.present(mDealsDetailsVC, animated: false, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isFromSavings == true{
            return 120
        }
        
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let mview = UIView()
        mview.frame = CGRect(x: 0, y: 0, width: tableView.frame.size.width, height: 45)
        mview.backgroundColor = UIColor.init(red: 57.0/255.0, green: 76.0/255.0, blue: 82.0/255.0, alpha: 1.0)
        let topLabel = UILabel()
        topLabel.frame = CGRect(x: 10, y: 5, width: tableView.frame.size.width - 20, height: 18)
        topLabel.textColor = UIColor.white
        topLabel.text = "UGADI SPECIAL FOR MARCH MONTH"
        topLabel.font = UIFont.boldSystemFont(ofSize: 14)
        mview.addSubview(topLabel)
        
        let bottomLabel = UILabel()
        bottomLabel.frame = CGRect(x: 10, y: 25, width: tableView.frame.size.width - 20, height: 15)
        bottomLabel.textColor = UIColor.white
        bottomLabel.text = "Shop and Avail Mega Discounts From Namdhari Fresh"
        bottomLabel.font = UIFont.systemFont(ofSize: 10)
        mview.addSubview(bottomLabel)
        
        return mview
        
    }
    
    @IBAction func dealsSaving(sender: UIButton){
        
        if sender.tag == 201{
            
            isFromSavings = true
            mSavingBtn.isSelected = true
            mTotalsDealsBtn.isSelected = false
            
            mTotalsDealsBtn.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
            mSavingBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        }
        else{
            isFromSavings = false
            mSavingBtn.isSelected = false
            mTotalsDealsBtn.isSelected = true
            
            mTotalsDealsBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
            mSavingBtn.layer.borderColor = UIColor(red:0.76, green:0.81, blue:0.82, alpha:1.0).cgColor
        }
        mTableView.reloadData()
    }
    
}
