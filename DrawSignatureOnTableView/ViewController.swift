//
//  ViewController.swift
//  DrawSignatureOnTableView

import UIKit
import Foundation

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource, UITextFieldDelegate,DrawSignatureDelegate , completedDrawingDelegate {
    
    @IBOutlet weak var workOrderEstimateTitleLabel: UILabel!
    @IBOutlet weak var workOrderEstimateTableView: UITableView!
    @IBOutlet weak var addEstimateButton: UIButton!
    
    //CustomCells
    var totalNumberOfRows:Int?
    var CellIdentifier: String = ""
    var cell:UITableViewCell?
    
    var selectedIndexPath:IndexPath?
    var signatureButtonTapped:Bool =  false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        initialUISetUp()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        initialUISetUp()
        
        
    }
    
    func initialUISetUp()
    {
        self.automaticallyAdjustsScrollViewInsets = false
        self.navigationController?.isNavigationBarHidden =  true
    }
    
    
    //MARK:- TableView DataSource and Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        self.workOrderEstimateTableView.estimatedRowHeight = 700.0
        
        
        if(indexPath.section == 0)
        {
            self.workOrderEstimateTableView.rowHeight = 131
        }
        if(indexPath.section == 1)
        {
            self.workOrderEstimateTableView.rowHeight = 35
        }
        
        if(indexPath.section == 2)
        {
            self.workOrderEstimateTableView.rowHeight = UITableViewAutomaticDimension
        }
        else if (indexPath.section == 3 ){
            //self.workOrderEstimateTableView.rowHeight =  450
            self.workOrderEstimateTableView.rowHeight =  UITableViewAutomaticDimension
        }
        else{
            //self.workOrderEstimateTableView.rowHeight =  UITableViewAutomaticDimension
        }
        return self.workOrderEstimateTableView.rowHeight
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if(section == 0){
            self.totalNumberOfRows = 1
        }
        if(section == 1){
            //Added by SiAz
            self.totalNumberOfRows = 1
        }
        if(section == 2){
            self.totalNumberOfRows = 1
        }
        if(section == 3){
            self.totalNumberOfRows = 1
        }
        
        return self.totalNumberOfRows!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0)
        {
            CellIdentifier = "workOrderEstimateSignatureCell"
            
            var cell :WorkorderEstimateSignatureCell
            cell =  tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as! WorkorderEstimateSignatureCell
            
            //Added by SiAz
            
            
            return cell
        }
            
        else if (indexPath.section == 1){
            
            CellIdentifier = "workorderEstimateTitleCell"
            var cell: WorkorderEstimateTitleCell
            cell =  tableView.dequeueReusableCell(withIdentifier: CellIdentifier)! as!WorkorderEstimateTitleCell
            
            //Added by SiAz
            cell.workOrderEstimateTitle.text = "ESTIMATED ITEMS"
            
            return cell
            
        }
        else if(indexPath.section == 2)
        {
            
            CellIdentifier = "workOrderEstimateDetailCell"
            
            var cell: WorkorderEstimateDetailCell
            cell =  tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as! WorkorderEstimateDetailCell
            
            
            let _ = cell.estimateDetailDescription.intrinsicContentSize.width
            cell.editEstimateButton?.layer.setValue(indexPath, forKey: "index")
            
            
            //Added by SiAz
            //   cell.estimateDetailTitleLabel.text = self.estimatesList
            
            
            return cell
        }
        else if(indexPath.section == 3)
        {
            
            CellIdentifier = "workOrderAddSignatureCell"
            
            var cell :WorkorderEstimateAddSignatureCell
            cell =  tableView.dequeueReusableCell(withIdentifier: CellIdentifier) as! WorkorderEstimateAddSignatureCell
            cell.addSignatureButton.addTarget(self, action: #selector(ViewController.addSignatureButtonTapped), for: .touchUpInside )
            cell.estimateNameTextField.layer.borderWidth = 1
            cell.estimateNameTextField.layer.borderColor =  UIColor.lightGray.cgColor
            cell.addSignatureView.layer.borderWidth = 1
            cell.addSignatureView.layer.borderColor = UIColor.lightGray.cgColor
            cell.addSignatureView.isHidden =  true
            
            cell.delegate =  self
            
            return cell
            
        }
        else {
            
            let cell: UITableViewCell = UITableViewCell()
            return cell
        }
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.resignFirstResponder();
        return true
        
    }
    @IBAction func addSignatureButtonTapped(_ sender: UIButton) {
        
        print("button tapped")
        if (sender.isHidden == true)
        {
            self.workOrderEstimateTableView.isScrollEnabled =  false
        }
        else {
            self.workOrderEstimateTableView.isScrollEnabled =  true
        }
        
    }
    func completedAddingSignature() {
        
        self.workOrderEstimateTableView.isScrollEnabled = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

