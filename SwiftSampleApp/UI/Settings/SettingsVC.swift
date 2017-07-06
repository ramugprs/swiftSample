//
//  SettingsVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SettingsVC: UIViewController,UITableViewDataSource,UITableViewDelegate {

    var mSettingsArray: NSArray! = []
    @IBOutlet weak var mTableView: UITableView!
    @IBOutlet weak var mFooterView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()

        mSettingsArray = ["Notifications","Notification Sound","About The Application","Terms of Use","Privacy Policy"]
        mTableView.tableFooterView = mFooterView
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backBtnAction(sender:UIButton){
        if let nav = self.navigationController {
            nav.popViewController(animated: false)
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: SettingsCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! SettingsCell
        cell.mTitleLbl.text = mSettingsArray.object(at: indexPath.row) as? String
        
        if indexPath.row > 1 {
            cell.mSoundOnOff.isHidden = true
        }
        else{
            cell.mSoundOnOff.isHidden = false
        }
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mSettingsArray.count
    }
    
}
