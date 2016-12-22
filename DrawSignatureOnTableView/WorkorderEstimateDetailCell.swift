//
//  WorkorderEstimateDetailCell.swift
//  ReachOut
//
//  Created by FTS-MAC-014 on 08/12/16.
//  Copyright © 2016 Aswathy. All rights reserved.
//

import UIKit

class WorkorderEstimateDetailCell: UITableViewCell {
    
    @IBOutlet weak var estimateDetailTitleLabel: UILabel!
    @IBOutlet weak var estimateDetailTypeLabel: UILabel!
    @IBOutlet weak var estimateDetailDescription: UILabel!
    @IBOutlet weak var estimateAmountLabel: UILabel!
    @IBOutlet weak var editEstimateImageView: UIImageView!
    @IBOutlet weak var editEstimateButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        estimateDetailDescription.sizeToFit()
        estimateDetailDescription.intrinsicContentSize.width
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
