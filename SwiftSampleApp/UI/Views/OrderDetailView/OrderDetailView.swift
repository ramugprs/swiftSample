//
//  OrderDetailView.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/19/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

protocol OrderDetailViewDelegate: class {
    func closeOrderDetails()
}

class OrderDetailView: UIView ,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mHeaderView: UIView!
    @IBOutlet weak var mDeleveredBtn: UIButton!
    
    weak var mdelegate: OrderDetailViewDelegate?
    
    class func instanceFromNib() -> OrderDetailView {
        return UINib(nibName: "OrderDetailView", bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! OrderDetailView
    }
    
    @IBAction func closeBtn(sender: UIButton){
        mdelegate?.closeOrderDetails()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: OrderDetailTvCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderDetailTvCell
        if indexPath.row == 0 {
            cell.mTopline?.isHidden = true
        }
        else{
            cell.mTopline?.isHidden = false
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    public func reloadtableView(){
        mTableView.dataSource = self
        mTableView.delegate = self
        mTableView.register(UINib(nibName: "OrderDetailTvCell", bundle: nil), forCellReuseIdentifier: "cell")
        
        mDeleveredBtn.layer.borderWidth = 1.0
        mDeleveredBtn.layer.borderColor = UIColor.init(red: 195.0/255.0, green: 207.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor
        mDeleveredBtn.layer.cornerRadius = 14;
        mTableView.tableFooterView = mHeaderView
    }
}
