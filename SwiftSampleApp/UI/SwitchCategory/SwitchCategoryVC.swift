//
//  SwitchCategoryVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/20/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SwitchCategoryVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mTableView:UITableView!
    var mArray: NSArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mArray = [["image": "Grocery_Staples", "name": "Grocery & Staples","disc":""],["image": "HouseholdNeeds", "name": "Household Needs","disc":""],["image": "Namdhari’sFresh-Branded", "name": "Namdhari’sFresh - Branded","disc":""],["image": "Bread,Diary_Frozen", "name": "Bread,Diary & Frozen","disc":""],["image": "PersonalCare", "name": "Personal Care","disc":""],["image": "Gourmet", "name": "Gourmet","disc":""],["image": "BrandedProducts", "name": "Branded Products","disc":""],["image": "Beverages", "name": "Beverages","disc":""],["image": "GardeningNeed", "name": "Gardening Need","disc":""]]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:SwitchCategoryCell = tableView.dequeueReusableCell(withIdentifier: "cell") as!SwitchCategoryCell
        
        if let dict = mArray[indexPath.row] as? [String:Any]{
            cell.mImage.image = UIImage(named: dict["image"] as! String)
            cell.mName.text = dict["name"] as! String?
        }
        return cell
    }
    
    @IBAction func closeBtnAction(sender:UIButton){
        self.dismiss(animated: false, completion: nil)
    }
}
