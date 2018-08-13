//
//  ElectricityBillViewController.swift
//  Electricitybill
//
//  Created by MacStudent on 2018-08-09.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class ElectricityBillViewController: UIViewController {
    var electricitybill = ElectricityBill()
    @IBOutlet weak var txtcustomerid: UITextField!
    @IBOutlet weak var txtcustomername: UITextField!
    @IBOutlet weak var opgender: UISegmentedControl!
    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var txtunit: UITextField!
    @IBOutlet weak var txtemail: UITextField!
    
    @IBOutlet weak var txtDate: UITextField!
    var viewDate: UIDatePicker?
    
    
    @IBOutlet var vwView: UIView!
    @IBAction func scTapped(_ sender: UISegmentedControl) {
    
        switch (opgender.selectedSegmentIndex) {
        case 0:
         electricitybill.gender = "Male"
        case 1:
            electricitybill.gender = "Female"
        default:
            break
        }
    }
    
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
        viewDate = UIDatePicker()
        viewDate?.datePickerMode = .date
        viewDate?.addTarget(self, action: #selector(ElectricityBillViewController.dateChanged(datePicker:)), for: .valueChanged)
        txtDate.inputView = viewDate
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(ElectricityBillViewController.viewTapped(gestureRecognizer:)))
        
    self.navigationItem.title = "Bill data entry"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btncalculatebill(_ sender: Any) {
        if isValidEmail(email: txtemail.text) == true{
            electricitybill = ElectricityBill(customerID: String(txtcustomerid.text!), customername: txtcustomername.text!, email: txtemail.text! ,gender: electricitybill.gender, billdate: txtDate.text, unitconsumed: Int(txtunit.text!), totalbillamount: 0)
        
        }
        else
        {
            let alert = UIAlertController(title: "Alert ", message: "Enter Valid Email", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        performSegue(withIdentifier: "seguebilldetails", sender: self)
        
        }
    
    @objc func dateChanged(datePicker: UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
      txtDate.text = dateFormatter.string(from: datePicker.date)
        view.endEditing(true)
    }
    
    
    @objc func viewTapped(gestureRecognizer: UITapGestureRecognizer)  {
        view.endEditing(true)
    }
    
  override  func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let destVC = segue.destination as? BillDetailViewController {
        print("#####  \(electricitybill)")
         destVC.electricitybill = electricitybill
        }
    }
    
    
    
    
    
    
    
}
