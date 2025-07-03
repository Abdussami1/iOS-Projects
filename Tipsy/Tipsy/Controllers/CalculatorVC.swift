//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorVC: UIViewController {

    @IBOutlet weak var zeroPctButtton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var bilTextField: UITextField!
    
    var tipPrc: Float = 0.0
    var currentValue = 0
    
    override func viewDidLoad() {
        tenPctButton.isSelected = false
    }

    @IBAction func tipChanged(_ sender: UIButton) {
        bilTextField.endEditing(true)
        disablingButtons(button: sender)
        if let title = sender.currentTitle {
            let trimmed = title.replacingOccurrences(of: "%", with: "")
            if let tip = Float(trimmed) {
                tipPrc = tip / 100
            }
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sender.minimumValue = 1
        sender.maximumValue = 12
        sender.stepValue = 1
            
        currentValue = Int(sender.value)
        splitNumberLabel.text = String(currentValue)
    }
    
    @IBAction func caculatePressed(_ sender: UIButton) {
        // Safely unwrap and convert bill amount
        guard let billText = bilTextField.text,
              let billAmount = Float(billText),
              let splitText = splitNumberLabel.text,
              let splitNumber = Float(splitText) else {
            print("Invalid input")
            return
        }
        
        let totalAmount = billAmount * (1 + tipPrc)  // Add tip
        let amountPerPerson = totalAmount / splitNumber
        
        print(String(format: "Each person should pay: %.2f", amountPerPerson))
        
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultVC
            
            let people = currentValue
            let tipPercentage = Int(tipPrc * 100)
            
            // Safely calculate total again (in case needed)
            if let billText = bilTextField.text,
               let billAmount = Float(billText),
               people != 0 {
                
                let totalAmount = billAmount * (1 + tipPrc)
                let amountPerPerson = totalAmount / Float(people)
                
                destinationVC.total = String(format: "%.2f", amountPerPerson)
                destinationVC.setting = "Split between \(people) people, with \(tipPercentage)% tip."
            }
        }
    }


    
    func disablingButtons(button: UIButton?){
        if button == zeroPctButtton{
            zeroPctButtton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        }else if button == tenPctButton{
            zeroPctButtton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
        }
        else{
            zeroPctButtton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
        }
    }
}

