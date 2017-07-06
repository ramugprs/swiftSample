//
//  DealsSavingCell.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/7/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class DealsSavingCell: UITableViewCell {

    @IBOutlet weak var mImage: UIImageView?
    @IBOutlet weak var mValidLblH: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
