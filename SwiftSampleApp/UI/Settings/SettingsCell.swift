//
//  SettingsCell.swift
//  SwiftSampleApp
//
//  Created by Ramakrishna on 6/21/17.
//  Copyright © 2017 Ramakrishna. All rights reserved.
//

import UIKit

class SettingsCell: UITableViewCell {
    
    @IBOutlet weak var mSoundOnOff: UIButton!
    @IBOutlet weak var mTitleLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func onOff(sender: UIButton){
    
        if !mSoundOnOff.isSelected {
            mSoundOnOff.isSelected = true
        }
        else{
            mSoundOnOff.isSelected = false
        }
    }
}
