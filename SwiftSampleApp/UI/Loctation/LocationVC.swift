//
//  LocationVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 4/30/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class LocationVC: UIViewController {

    @IBOutlet weak var mLocationView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.mLocationView.layer.cornerRadius = 20
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gotoHomeVC(sender:UIButton){
        
        let mDeliveryLocationVC:UIViewController = UIStoryboard(name:"Main",bundle:nil).instantiateViewController(withIdentifier: "DeliveryLocationVC") as UIViewController
        self.navigationController?.pushViewController(mDeliveryLocationVC, animated: false)
        
    }
}
