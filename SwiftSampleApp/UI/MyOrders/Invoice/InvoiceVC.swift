//
//  InvoiceVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/20/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class InvoiceVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mHeaderView: UIView!
    @IBOutlet weak var mFooterView: UIView!
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mShareInvoiceBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mTableView.estimatedRowHeight = 40
        mTableView.tableHeaderView = mHeaderView
        mTableView.tableFooterView = mFooterView
        
        mTableView.layer.borderWidth = 1.0
        mTableView.layer.borderColor = UIColor.init(red: 195.0/255.0, green: 207.0/255.0, blue: 209.0/255.0, alpha: 1.0).cgColor
        
        mShareInvoiceBtn.layer.borderWidth = 1.0
        mShareInvoiceBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mShareInvoiceBtn.layer.cornerRadius = 18;
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MyorderCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyorderCell
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    @IBAction func backBtnAction(sender:UIButton){
       self.dismiss(animated: false, completion: nil)
    }
    
}
