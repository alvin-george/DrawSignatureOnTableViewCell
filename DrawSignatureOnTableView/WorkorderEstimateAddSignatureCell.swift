//
//  WorkorderEstimateAddSignatureCell.swift
//  ReachOut

import UIKit

@objc protocol completedDrawingDelegate{
    
    @objc optional func completedAddingSignature()
}
class WorkorderEstimateAddSignatureCell: UITableViewCell, DrawSignatureDelegate {
    var delegate : completedDrawingDelegate?
    @IBOutlet weak var titleView: UIView!
    @IBOutlet weak var titleViewHeight: NSLayoutConstraint!
    @IBOutlet weak var estimateTitleLabel: UILabel!
    @IBOutlet weak var estimateSubTitleLabel: UILabel!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var addSignatureView: DrawSignatureView!
    @IBOutlet weak var estimateNameTextField: UITextField!
    @IBOutlet weak var addSignatureButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        estimateTitleLabel.sizeToFit()
        estimateSubTitleLabel.sizeToFit()
        titleView.frame.size.height = estimateTitleLabel.frame.size.height+estimateSubTitleLabel.frame.size.height+70
        
        self.addSignatureView.delegate =  self
    }
    
    // SignatureView - DrawSignatureDelegate
    func finishedDrawing() {
        
    }
    func startedDrawing() {
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        
        if addSignatureView.doesContainSignature {
            let img = addSignatureView.getCroppedSignature()
            print("contain image")
        } else {
            print("empty image")
        }
    }
    @IBAction func addSignatureButtonTapped(_ sender: Any) {
        addSignatureView.isHidden =  false
        addSignatureView.backgroundColor = UIColor.white
        addSignatureButton.isHidden =  true
    }
    @IBAction func clearButtonTapped(_ sender: Any) {
        
        addSignatureView.clear()
    }
    @IBAction func finishEditingButtonTapped(_ sender: Any) {
        addSignatureView.isHidden =  true
        addSignatureButton.isHidden =  false
        addSignatureButton.titleLabel?.text = "Signture Added. Please tap to edit again"
        delegate?.completedAddingSignature!()
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
