//
//  SelectAddressCell.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/3/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SelectAddressCell: UITableViewCell {

    @IBOutlet weak var mDeleteBtn:UIButton!
    @IBOutlet weak var mEditBtn:UIButton!
    @IBOutlet weak var mHomeBtn:UIButton!
    @IBOutlet weak var mOfficeBtn:UIButton!
    @IBOutlet weak var mOtherBtn:UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
