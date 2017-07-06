//
//  SelectAddressVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/3/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SelectAddressVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mAddAddressBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mTableView.estimatedRowHeight = 40
        mTableView.tableFooterView = UIView.init(frame: CGRect.zero)
        
        mAddAddressBtn.layer.borderWidth = 1.0
        mAddAddressBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mAddAddressBtn.layer.cornerRadius = 20;
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
        
        let cell:SelectAddressCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SelectAddressCell
        
        cell.mHomeBtn.tag = indexPath.row
        cell.mOfficeBtn.tag = indexPath.row
        cell.mOtherBtn.tag = indexPath.row
        
        cell.mHomeBtn.addTarget(self, action: #selector(homeBtnAction), for: .touchUpInside)
        cell.mOfficeBtn.addTarget(self, action: #selector(officeBtnAction), for: .touchUpInside)
        cell.mOtherBtn.addTarget(self, action: #selector(otherBtnAction), for: .touchUpInside)
        
        
        
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
    
    func homeBtnAction(sender:UIButton){
        
        reloadValuesInTable(type: "home", index: sender.tag)
        
    }
    
    func officeBtnAction(sender:UIButton){
        
        reloadValuesInTable(type: "office", index: sender.tag)
        
    }
    
    func otherBtnAction(sender:UIButton){
        
        reloadValuesInTable(type: "other", index: sender.tag)
        
    }
    
    func reloadValuesInTable(type: String, index: Int){
        
    
        let indexPath = NSIndexPath(row: index, section: 0)
        //mTableView.reloadRows(at: [indexPath as IndexPath], with: .fade)
        
        let cell: SelectAddressCell = mTableView.cellForRow(at: indexPath as IndexPath) as! SelectAddressCell
        
        if type == "home" {
            cell.mHomeBtn.isSelected = true
            cell.mOfficeBtn.isSelected = false
            cell.mOtherBtn.isSelected = false
            
        }
        else if type == "office" {
            cell.mHomeBtn.isSelected = false
            cell.mOfficeBtn.isSelected = true
            cell.mOtherBtn.isSelected = false
        }
        else if type == "other" {
            
            cell.mHomeBtn.isSelected = false
            cell.mOfficeBtn.isSelected = false
            cell.mOtherBtn.isSelected = true
        }
        
    }
    
    @IBAction func addNewAddressBtnAction(sender:UIButton){
        
        let mAddNewAddressVC: AddNewAddressVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "AddNewAddressVC") as! AddNewAddressVC
        self.navigationController?.pushViewController(mAddNewAddressVC, animated: false)
    }
    
}
