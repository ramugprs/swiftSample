//
//  SwitchCategoryCell.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 5/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SwitchCategoryCell: UITableViewCell {
    
    @IBOutlet weak var mImage: UIImageView!
    @IBOutlet weak var mName:UILabel!
    @IBOutlet weak var mDiscription:UILabel!
    
    @IBOutlet weak var mimgW:NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
