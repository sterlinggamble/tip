//
//  ViewController.swift
//  tip
//
//  Created by Sterling Gamble on 7/20/20.
//  Copyright © 2020 Codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var splitTextField: UITextField!
    @IBOutlet weak var billPerPersonLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Card View
        cardView.layer.cornerRadius = 10
        cardView.layer.shadowOpacity = 0.16
        cardView.layer.shadowOffset = CGSize(width: 0, height: 3)
        cardView.layer.shadowRadius = 6
        
        // Text Fields
        let textFieldLine = CALayer()
        textFieldLine.frame = CGRect(x: 0, y: 48, width: 150, height: 1)
        textFieldLine.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        billAmountTextField.layer.addSublayer(textFieldLine)
        billAmountTextField.keyboardType = UIKeyboardType.decimalPad
        
        let splitTextFieldLine = CALayer()
        splitTextFieldLine.frame = CGRect(x: 0, y: 48, width: 80, height: 1)
        splitTextFieldLine.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        splitTextField.layer.addSublayer(splitTextFieldLine)
        splitTextField.keyboardType = UIKeyboardType.decimalPad
    }

    @IBAction func onTap(_ sender: Any) {
        
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        // Get initial bill amount and calculate tipes
        let bill = Double(billAmountTextField.text!) ?? 0
        let split = Double(splitTextField.text!) ?? 1
        let tipPercentages = [0.15, 0.18, 0.2]
        
        // Calcualte tip, total, split
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let billPerPerson = total / split
        
        if split < 2 {
            billLabel.text = "Total"
        } else {
            billLabel.text = "Bill Per Person"
        }
        
        // Update tip and bill
        tipAmountLabel.text = String(format: "$%.2f", tip)
        billPerPersonLabel.text = String(format: "$%.2f", billPerPerson)
    }
    
}

