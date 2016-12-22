//
//  WorkorderEstimateSignatureCell.swift
//  ReachOut

import UIKit

class WorkorderEstimateSignatureCell: UITableViewCell {

    
    @IBOutlet weak var totalEstimateLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var signatureReceivedLabel: UILabel!
    @IBOutlet weak var successfullCheckImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
