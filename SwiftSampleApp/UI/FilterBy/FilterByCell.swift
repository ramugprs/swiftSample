//
//  FilterByCell.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class FilterByCell: UITableViewCell {

    @IBOutlet weak var mPriceLbl:UILabel!
    @IBOutlet weak var mSelectedImage: UIImageView!
    
    @IBOutlet weak var mBgView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
