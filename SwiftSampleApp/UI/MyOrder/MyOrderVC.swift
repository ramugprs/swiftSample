//
//  MyOrderVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/7/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class MyOrderVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mHeaderView: UIView!
    @IBOutlet weak var mFooterView: UIView!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mProceedBtn: UIButton!
    @IBOutlet weak var topHeaderH: NSLayoutConstraint?
    @IBOutlet weak var bottomH: NSLayoutConstraint?
    @IBOutlet weak var mHeaderLbl: UILabel?
    var isFromController: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.estimatedRowHeight = 40
        mTableView.tableHeaderView = mHeaderView
        mTableView.tableFooterView = mFooterView
        
        mProceedBtn.layer.borderWidth = 1.0
        mProceedBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mProceedBtn.layer.cornerRadius = 18;
        
        if isFromController == "Delivery"{
            mHeaderLbl?.text = "My Order"
            mProceedBtn.setTitle("Place Order", for: .normal)
            topHeaderH?.constant = 0
            bottomH?.constant = 0
            
        }
        else{
            mHeaderLbl?.text = "Orders Details"
            mProceedBtn.setTitle("Cancel Order", for: .normal)
            bottomH?.constant = 70
            
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MyorderCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyorderCell
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func backBtnAction(sender:UIButton){
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }
}
