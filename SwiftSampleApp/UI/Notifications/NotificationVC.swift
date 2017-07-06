//
//  NotificationVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class NotificationVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var mTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.estimatedRowHeight = 40
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: DealsSavingCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DealsSavingCell
        
        cell.mImage?.image = UIImage(named: "offer1")
        
        if (indexPath.row % 2 == 0)
        {
            cell.mValidLblH.constant = 0
        }
        else
        {
            cell.mValidLblH.constant = 23
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
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
