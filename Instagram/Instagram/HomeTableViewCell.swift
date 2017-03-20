//
//  HomeTableViewCell.swift
//  Instagram
//
//  Created by Sumit Dhungel on 3/12/17.
//  Copyright © 2017 Sumit Dhungel. All rights reserved.
//

import UIKit
import Parse
import ParseUI


class HomeTableViewCell: UITableViewCell {

    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var workingImageView: PFImageView!
    
    @IBOutlet weak var captionLabel: UILabel!
   
    @IBOutlet weak var userLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
