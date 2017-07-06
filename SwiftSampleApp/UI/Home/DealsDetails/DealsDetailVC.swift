//
//  DealsDetailVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/12/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class DealsDetailVC: UIViewController {

    @IBOutlet weak var mStartshoppingBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        mStartshoppingBtn.layer.borderWidth = 1.0
        mStartshoppingBtn.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        mStartshoppingBtn.layer.cornerRadius = 20;
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func closeButton(sender:UIButton){
        self.dismiss(animated: false, completion: nil)
    }
}
