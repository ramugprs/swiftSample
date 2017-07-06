//
//  SideMenuController.swift
//  SJSwiftNavigationController
//
//  Created by Mac on 12/19/16.
//  Copyright © 2016 Sumit Jagdev. All rights reserved.
//

import UIKit
import SJSwiftSideMenuController

class SideMenuController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var menuTableView : UITableView!
    @IBOutlet weak var mAddressView: UIView!
    @IBOutlet weak var mFooterView: UIView!
    @IBOutlet weak var mBackView: UIView!
    var menuItems : NSArray = NSArray()
    var menuItemsimges : NSMutableArray = []
    var mSectionsArray : NSMutableArray = []
    var mExpandArray : NSMutableArray = []
    var mItemsArray : NSMutableArray = []
    
    var isMainMenu: Bool = true
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuItems = ["Deals & Saving - OfferZone","My Cart","My Orders","My Wallet","My Wishlist","Notifications","Feedback","Customer Care","Refer Friends","About","Settings"]
        
        menuItemsimges = ["Deals_Savings","MyCart","MyOrders","MyWallet","MyWishlist","Notifications","Feedback","CustomerCare","ReferFriends","About","Settings"]
        
        mSectionsArray = [["section":"Fruits & Vegetables", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Grocery & Staples", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Household Needs", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Fruits & Vegetables", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Namdhari’sFresh - Branded", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Bread,Diary & Frozen", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Personal Care", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Gourmet", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Branded Products", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Beverages", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]],["section":"Gardening Need", "list":["Pulses","Atta & Others","Rice","Edible Oils","Salt & Sugar","Spices","Ghee & Vanspati"]]]
        
        
        
        // mSectionsArray .setArray(menuItems as! [Any])
        // menuTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        menuTableView.reloadData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        menuTableView.allowsSelection = true
        menuTableView.isUserInteractionEnabled = true
        menuTableView.tableHeaderView = mAddressView
        menuTableView.tableFooterView = mFooterView
        self.view.backgroundColor = UIColor.clear
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isMainMenu == true
        {
            return menuItems.count
        }
        else{
            if mExpandArray.contains(section) {
                return mItemsArray.count
            }
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let idstr = "cell"
        
        let cell: SwitchCategoryCell = tableView.dequeueReusableCell(withIdentifier: idstr) as! SwitchCategoryCell
        
        if isMainMenu != true
        {
            cell.mName.text = mItemsArray.object(at: indexPath.row) as? String
            cell.mimgW.constant = 0
            cell.mDiscription.isHidden = true
        }
        else{
            cell.mimgW.constant = 20
            cell.mDiscription.isHidden = false
            cell.mName.text = menuItems.object(at: indexPath.row) as? String
            cell.mImage.image = UIImage(named: (menuItemsimges.object(at: indexPath.row) as! String))
        }
        
        //cell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
            
        case 0:
            SJSwiftSideMenuController.hideLeftMenu()
        case 1:
            let mCheckOutVC: CheckOutVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "CheckOutVC") as! CheckOutVC
            
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mCheckOutVC, animated: true)
        case 2:
            let mMyOrdersVC: MyOrdersVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MyOrdersVC") as! MyOrdersVC
            
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mMyOrdersVC, animated: true)
        case 3:
            let mMyWalletVC: MyWalletVC = UIStoryboard(name: "SideMenuScreens", bundle: nil).instantiateViewController(withIdentifier: "MyWalletVC") as! MyWalletVC
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mMyWalletVC, animated: true)
            
        case 4:
            let mMywishListVC: MywishListVC = UIStoryboard(name: "SideMenuScreens", bundle: nil).instantiateViewController(withIdentifier: "MywishListVC") as! MywishListVC
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mMywishListVC, animated: true)
        case 5:
            let mNotificationVC: NotificationVC = UIStoryboard(name: "SideMenuScreens", bundle: nil).instantiateViewController(withIdentifier: "NotificationVC") as! NotificationVC
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mNotificationVC, animated: true)
        case 6:
            let mFeedbackVC: FeedbackVC = UIStoryboard(name: "SideMenuScreens", bundle: nil).instantiateViewController(withIdentifier: "FeedbackVC") as! FeedbackVC
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mFeedbackVC, animated: true)
        case 7:
            let mCustomerCareVC: CustomerCareVC = UIStoryboard(name: "SideMenuScreens", bundle: nil).instantiateViewController(withIdentifier: "CustomerCareVC") as! CustomerCareVC
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mCustomerCareVC, animated: true)
        case 8:
            return
        case 9:
            let mAboutUsVC: AboutUsVC = UIStoryboard(name: "SideMenuScreens", bundle: nil).instantiateViewController(withIdentifier: "AboutUsVC") as! AboutUsVC
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mAboutUsVC, animated: true)
        case 10:
            let mSettingsVC: SettingsVC = UIStoryboard(name: "SideMenuScreens", bundle: nil).instantiateViewController(withIdentifier: "SettingsVC") as! SettingsVC
            SJSwiftSideMenuController.hideLeftMenu()
            SJSwiftSideMenuController.pushViewController(mSettingsVC, animated: true)
        default:
            return
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if isMainMenu == true
        {
            return 0
        }
        else{
            return 50
            
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isMainMenu == true
        {
            return 1
        }
        else{
            return mSectionsArray.count
            
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let view:UIView = UIView.init()
        view.frame = CGRect(x:0, y:0, width:tableView.frame.size.width, height:50)
        
        let titleLabel:UILabel = UILabel.init()
        
        titleLabel.frame = CGRect(x:15, y:0, width:view.frame.size.width - 50, height:50)
        
        let dict = mSectionsArray[section] as? [String:Any]
        
        titleLabel.text = dict?["section"] as? String
        
        
        view.addSubview(titleLabel)
        
        let bottomLine:UILabel = UILabel.init()
        
        bottomLine.frame = CGRect(x:15, y:48, width:view.frame.size.width - 20, height:1)
        bottomLine.backgroundColor = UIColor.lightGray
        view.addSubview(bottomLine)
        
        let arrow:UIImageView = UIImageView.init()
        arrow.frame = CGRect(x:menuTableView.frame.size.width - 40, y:18, width:10, height:15)
        
        
        if(mExpandArray.contains(section)){
            
            arrow.frame = CGRect(x:menuTableView.frame.size.width - 40, y:18, width:10, height:15)
            arrow.image = UIImage(named: "Downarrow_Home")
            
            titleLabel.textColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0)
            titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        }
        else{
            arrow.frame = CGRect(x:menuTableView.frame.size.width - 40, y:18, width:8, height:13)
            arrow.image = UIImage(named: "Uparrow")
            titleLabel.textColor = UIColor.black
            titleLabel.font = UIFont(name: "Helvetica Neue", size: 16)
        }
        arrow.contentMode = .scaleAspectFit
        
        view.addSubview(arrow)
        
        let button:UIButton = UIButton.init(type: .custom)
        
        button.addTarget(self, action: #selector(expandButtonAction), for: .touchUpInside)
        
        button.frame = view.frame;
        button.tag = section;
        view.addSubview(button)
        
        return view
    }
    
    func expandButtonAction(sender: UIButton)
    {
        let tag: Int = sender.tag
        
        if mExpandArray.contains(tag) {
            mExpandArray.remove(tag)
        }
        else{
            mExpandArray.add(tag)
        }
        
        let dict = mSectionsArray[tag] as? [String:Any]
        
        mItemsArray .setArray(dict?["list"] as! [Any])
        let range = NSMakeRange(tag, 1)
        let sections = NSIndexSet(indexesIn: range)
        menuTableView.reloadSections(sections as IndexSet, with: .fade)
        
    }
    
    @IBAction func exploreButtonAction(sender: UIButton)
    {
        isMainMenu = false;
        self.menuTableView.reloadData()
        
        refreshmenu()
        
        
    }
    @IBAction func backButtonAction(sender: UIButton)
    {
        isMainMenu = true;
        mExpandArray.removeAllObjects()
        self.menuTableView.reloadData()
        refreshmenu()
        
    }
    
    func refreshmenu()
    {
        if isMainMenu != true
        {
            menuTableView.tableHeaderView = mBackView
        }
        else{
            menuTableView.tableHeaderView = mAddressView
            
        }
        menuTableView.tableFooterView = mFooterView
        
        self.menuTableView.reloadData()
        
    }
    
    @IBAction func closeLeftMenu(sender: UIButton){
        SJSwiftSideMenuController.hideLeftMenu()
    }
    
    @IBAction func loginBtnAction(sender: UIButton){
        let mLoginVC: LoginVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        
        SJSwiftSideMenuController.hideLeftMenu()
        SJSwiftSideMenuController.pushViewController(mLoginVC, animated: true)
    }
}
