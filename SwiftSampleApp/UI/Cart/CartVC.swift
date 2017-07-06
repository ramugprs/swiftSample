//
//  CartVC.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/23/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class CartVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var mTableView:UITableView!
    @IBOutlet weak var mLoginBtn:UIButton!
    var mselectedRow:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mLoginBtn.layer.borderWidth = 1.0
        mLoginBtn.layer.cornerRadius = 17.0
        mLoginBtn.layer.borderColor = UIColor.white.cgColor
        mLoginBtn.clipsToBounds = true
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
        
        cell.tag = indexPath.row
        
        cell.mRemoveBtn.tag = 100 + indexPath.row
        cell.mCacelBtn.tag = 200 + indexPath.row 
        
        cell.mRemoveBtn.addTarget(self, action: #selector(removeBtnAction), for: .touchUpInside)
        cell.mCacelBtn.addTarget(self, action: #selector(cancelBtnAction), for: .touchUpInside)
        
        
        cell.mRemoveInnerView.layer.cornerRadius = 17.0
        
        cell.mRemoveCartView.layer.borderWidth = 2.0
        
        cell.mRemoveCartView.layer.borderColor = UIColor.init(red: 0.87, green: 0.38, blue: 0.22, alpha: 1.0).cgColor
        
        
        let longuesture = UILongPressGestureRecognizer.init(target:self, action:#selector(longPress))
        longuesture.minimumPressDuration = 1.0
        
        cell.addGestureRecognizer(longuesture)
        
        
        if let longIndex = mselectedRow {
            if longIndex == indexPath.row {
                cell.mRemoveCartView.isHidden = false
            }
        }
        else{
            cell.mRemoveCartView.isHidden = true
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func longPress(gesture: UILongPressGestureRecognizer){
        
        if gesture.state == UIGestureRecognizerState.ended {
            
            mselectedRow = gesture.view?.tag
            mTableView.reloadRows(at: [NSIndexPath (row: (gesture.view?.tag)! , section: 0) as IndexPath], with: .fade)
        }
        
    }
    
    func removeBtnAction(sender: UIButton) {
        mselectedRow = nil
        
        mTableView.reloadRows(at: [NSIndexPath (row: sender.tag%100 , section: 0) as IndexPath], with: .none)
    }
    
    func cancelBtnAction(sender: UIButton) {
        
        mselectedRow = nil
        
        mTableView.reloadRows(at: [NSIndexPath (row: sender.tag%100 , section: 0) as IndexPath], with: .none)
    }

    @IBAction func loginCheckOut(sender:UIButton){
        
        let mCheckOutVC: CheckOutVC = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "CheckOutVC") as! CheckOutVC
        self.navigationController?.pushViewController(mCheckOutVC, animated: false)
        
    }
}
