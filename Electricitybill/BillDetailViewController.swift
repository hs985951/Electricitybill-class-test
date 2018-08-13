//
//  BillDetailViewController.swift
//  Electricitybill
//
//  Created by MacStudent on 2018-08-09.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class BillDetailViewController: UIViewController {
    @IBOutlet weak var txtcustomername: UILabel!
    @IBOutlet weak var txttotalbill: UILabel!
    @IBOutlet weak var txtgender: UILabel!
    @IBOutlet weak var txtcusomerid: UILabel!
    @IBOutlet weak var txtemail: UILabel!
    var electricitybill : ElectricityBill!

    @IBOutlet weak var datesee: UILabel!
    
    
   
    
    @IBAction func btnvsitus(_ sender: Any) {
        let alert = UIAlertController(title: "Head Office ", message: "14 Carlton Street Toronto, Ontario M5B 1K5", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
       
    }
    
    
    @IBAction func btnexits(_ sender: Any) {
    exit(0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        if let bill = electricitybill
        {
            print(bill.customername!)
            calculateTotalBillAmount()
            self.txtcusomerid.text=electricitybill.customerID
        self.txtcustomername.text = electricitybill.customername
            self.txtemail.text = electricitybill.email
            self.datesee.text = electricitybill.billdate
            self.txtgender.text = electricitybill.gender
            self.txttotalbill.text = String(format: "Total: %.2f",  electricitybill.totalbillamount!)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func calculateTotalBillAmount()
    {
        
        var totalBill = 0.0
        if(electricitybill?.unitconsumed)! <= 100
        {
            totalBill = Double((electricitybill?.unitconsumed)!) * 0.75
        }else if (electricitybill?.unitconsumed)! <= 250
        {
            totalBill = 75 + (Double((electricitybill?.unitconsumed)!) - 100) * 1.25
        }else if (electricitybill?.unitconsumed)! <= 450
        {
            totalBill = 262.2 + (Double((electricitybill?.unitconsumed)!) - 250) * 1.75
        }else
        {
            totalBill = 612.5 + (Double((electricitybill?.unitconsumed)!) - 450) * 2.25
        }
        electricitybill.totalbillamount = totalBill
        print(totalBill)
    }
}
