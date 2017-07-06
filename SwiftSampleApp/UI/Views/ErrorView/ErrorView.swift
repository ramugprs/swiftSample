//
//  ErrorView.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

protocol errorViewDelegate: class {
    func removeErrorView();
}

class ErrorView: UIView {

    weak var mDelegate: errorViewDelegate?
    
    class func loadnib() -> ErrorView{
        return UINib(nibName: "ErrorView", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! ErrorView
    }

    @IBAction func gotoMain(sender: UIButton){
        self.mDelegate?.removeErrorView()
    }
    
}
