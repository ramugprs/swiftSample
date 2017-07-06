//
//  MywishListVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/20/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class MywishListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Mark: - UITableViewDelegate,UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier:String = "Cell"
        
        let cell:ProductTVCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! ProductTVCell
        
        cell.mperscentLbl.layer.borderWidth = 1.0
        cell.mperscentLbl.layer.cornerRadius = 4.0
        cell.mperscentLbl.layer.borderColor = UIColor.init(red: 18/255.0, green: 136/255.0, blue: 51/255.0, alpha: 1.0).cgColor
        cell.mperscentLbl.clipsToBounds = true
        
        let attributeString: NSMutableAttributedString =  NSMutableAttributedString(string: cell.mDiscountLbl.text!)
        attributeString.addAttribute(NSStrikethroughStyleAttributeName, value: 2, range: NSMakeRange(0, attributeString.length))
        attributeString.addAttribute(NSStrikethroughColorAttributeName, value: UIColor.lightGray, range: NSMakeRange(0, attributeString.length))
        
        cell.mDiscountLbl.attributedText = attributeString
        
        cell.mNotifyBtn.layer.borderWidth = 1.0
        cell.mNotifyBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        cell.mNotifyBtn.layer.cornerRadius = 10;
        
        if indexPath.row % 2 == 0 {
            cell.mNotifyView.isHidden = true
            cell.mNotAvailBtn.isHidden = true
            cell.mNotAvailH.constant = 0
        }
        else{
            cell.mNotifyView.isHidden = false
            cell.mNotAvailBtn.isHidden = false
            cell.mNotAvailH.constant = 24
            
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row % 2 == 0 {
            return 130
        }
        else{
            return 160
        }
    }
    
    @IBAction func backBtnAction(sender:UIButton){
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }
}
