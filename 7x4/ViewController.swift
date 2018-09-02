//
//  ViewController.swift
//  7x4
//
//  Created by Ellen Yang on 2018/9/2.
//  Copyright © 2018年 Ellen Yang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var amountTextField: UITextField!
    
    @IBOutlet weak var CTSSwitch: UISwitch!
    @IBOutlet weak var cathaySwitch: UISwitch!
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    
    @IBOutlet weak var weekdaySegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func onCalculate(_ sender: UIButton)
    {
        //dismiss keyboard
        view.endEditing(true)
        
        
        //calculate the amount
        let amountOptiongal = Double(amountTextField.text!)
        
        if amountOptiongal != nil {
            let amount = amountOptiongal!
            let discount = getDiscount(amount)
            
            discountLabel.text = String(discount)
            totalAmountLabel.text = String(amount-discount)
        }
    }
    
    
    func getDiscount(_ amount:Double) -> Double {
        var discount = 0.0
        
        //Check the day
        switch weekdaySegmentedControl.selectedSegmentIndex {
        case 1:
            print("週2")
            //國泰卡
            if cathaySwitch.isOn {
                if amount >= 888 {
                    discount = 150.0
                }
            }
        case 2:
            print("週3")
            //中信卡
            if CTSSwitch.isOn {
                if amount >= 988 {
                    discount = amount * (1-0.88)
                }
            }
        case 5:
            print("週6")
            //不用卡
            if amount >= 488 {
                discount = amount * (1-0.88)
            }
        default:
            break;
        }
        
        return discount
    }
    
    @IBAction func onCTS(_ sender: UISwitch) {
        if sender.isOn {
            cathaySwitch.isOn = false
        }
    }
    
    @IBAction func onCathay(_ sender: UISwitch) {
        if sender.isOn {
            CTSSwitch.isOn = false
        }
    }
    
    
}

