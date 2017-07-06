//
//  MyOrdersVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/16/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class MyOrdersVC: UIViewController ,UITableViewDelegate, UITableViewDataSource,OrderDetailViewDelegate {

    @IBOutlet weak var mTableView: UITableView?
    @IBOutlet weak var mSeparatorX:NSLayoutConstraint!
    @IBOutlet weak var mVerSeparatorX:NSLayoutConstraint!
    @IBOutlet weak var mFooterView: UIView!
    var mOrderDetailView:OrderDetailView?
    var isFrom: String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mTableView?.register(UINib(nibName: "UpComingCell", bundle: nil), forCellReuseIdentifier: "cell1")
        mTableView?.register(UINib(nibName: "DeliveredCell", bundle: nil), forCellReuseIdentifier: "cell2")
        mTableView?.register(UINib(nibName: "CancelledCell", bundle: nil), forCellReuseIdentifier: "cell3")
        
        self.tappedBtn(sender: self.view.viewWithTag(100) as! UIButton)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Mark:- UITableViewDataSource
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch isFrom! {
            
        case "Delivered":
            let cell: DeliveredCell = tableView.dequeueReusableCell(withIdentifier: "cell2", for: indexPath) as! DeliveredCell
            
            cell.mInvoiceBtn.layer.borderWidth = 1.0
            cell.mInvoiceBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
            cell.mInvoiceBtn.layer.cornerRadius = 14;
            cell.mInvoiceBtn.addTarget(self, action: #selector(invoiceDetails), for: .touchUpInside)
            return cell
            
        case "Cancelled":
            
            let cell: CancelledCell = tableView.dequeueReusableCell(withIdentifier: "cell3") as! CancelledCell
            
            return cell
            
        default:

            let cell: UpComingCell = tableView.dequeueReusableCell(withIdentifier: "cell1") as! UpComingCell
            
            cell.mTrackBtn.layer.borderWidth = 1.0
            cell.mTrackBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
            cell.mTrackBtn.layer.cornerRadius = 12;
            cell.mTrackBtn.addTarget(self, action: #selector(trackOrderDetails), for: .touchUpInside)
            return cell
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        switch isFrom! {
            
        case "Delivered":
            
            return 5
        case "Cancelled":
            
            return 5
            
        default:
            return 1
        }
        
    }
    
    // Mark:- UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch isFrom! {
            
        case "Delivered":
            
            return
        case "Cancelled":
            
            return
            
        default:
            
            let mMyOrderVC: MyOrderVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "MyOrderVC") as! MyOrderVC
            mMyOrderVC.isFromController = "MyOrders"
            self.navigationController?.pushViewController(mMyOrderVC, animated: false)
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 240
    }
    
    @IBAction func backBtnAction(sender:UIButton){
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }
    
    @IBAction func tappedBtn(sender:UIButton){
        
        for tag in 100..<103 {
            let btn:UIButton = self.view.viewWithTag(tag) as! UIButton
            btn.backgroundColor = UIColor.clear
            btn.isSelected = false
        }
        
        let btn:UIButton = self.view.viewWithTag(sender.tag) as! UIButton
        btn.backgroundColor = UIColor.white
        btn.isSelected = true
        
        mTableView?.tableFooterView = UIView.init(frame: CGRect.zero)
        
        if sender.tag == 100 {
            isFrom = "upcoming"
            mSeparatorX.constant = 0
            mVerSeparatorX.constant = 2*UIScreen.main.bounds.width/3
            mTableView?.tableFooterView = mFooterView
            
        }
        else if sender.tag == 101 {
            
            isFrom = "Delivered"
            mSeparatorX.constant = UIScreen.main.bounds.width/3
        
        }
        else if sender.tag == 102 {
            
            isFrom = "Cancelled"
            mSeparatorX.constant = 2*UIScreen.main.bounds.width/3
            mVerSeparatorX.constant = UIScreen.main.bounds.width/3
            
        }
        mTableView?.contentOffset = CGPoint(x:0, y:0)
        mTableView?.reloadData()
    }
    
    func invoiceDetails(sender:UIButton){
        let mInvoiceVC: InvoiceVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "InvoiceVC") as! InvoiceVC
        self.present(mInvoiceVC, animated: false, completion: nil)
    }
    
    func trackOrderDetails(sender:UIButton){
        
        mOrderDetailView = OrderDetailView.instanceFromNib()
        mOrderDetailView?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        mOrderDetailView?.mdelegate = self
        mOrderDetailView?.reloadtableView()
        self.view.addSubview(mOrderDetailView!)
        
    }
    func closeOrderDetails(){
        
        mOrderDetailView?.removeFromSuperview()
        mOrderDetailView = nil
    }
}
