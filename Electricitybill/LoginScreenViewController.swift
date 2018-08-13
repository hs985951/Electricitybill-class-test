//
//  LoginScreenViewController.swift
//  Electricitybill
//
//  Created by MacStudent on 2018-08-09.
//  Copyright © 2018 g. All rights reserved.
//

import UIKit

class LoginScreenViewController: UIViewController
{
    
    @IBOutlet weak var txtusername: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBAction func btnlogin(_ sender: Any) {
        if txtusername.text == "admin" && password.text == "admin@123" {
            performSegue(withIdentifier: "ElectricityBillViewController", sender: self)

        } else {
            let alert = UIAlertController(title: "Alert", message: "Wrong Id or Password", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnexit(_ sender: Any) {
        exit(0)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
