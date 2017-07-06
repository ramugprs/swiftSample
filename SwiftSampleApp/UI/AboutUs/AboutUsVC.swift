//
//  AboutUsVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class AboutUsVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

}
