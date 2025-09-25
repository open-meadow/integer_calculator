//
//  ViewController.swift
//  integer_calculator
//
//  Created by open-meadow on 2025-09-23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        displayLabel.text = "0"
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet var displayLabel: UILabel!
    
    var screenText: String = ""
    var prevScreenText: String = ""
    var operation: String = ""
    
    @IBAction func calculate(_ sender: UIButton) {
        let buttonContent: String = (sender.titleLabel?.text)!
        
        if buttonContent != "=" {
            if(buttonContent == "C") {
                prevScreenText = ""
                screenText = ""
                displayLabel.text = "0"
            } else if (buttonContent == "+" || buttonContent == "-" || buttonContent == "/" || buttonContent == "*") {
                operation = buttonContent
                prevScreenText = screenText
                displayLabel.text = buttonContent
                screenText = ""
            } else {
                screenText += buttonContent
                displayLabel.text = screenText
            }
        } else {
            let opValue = performOperation(prevScreenText, operation, screenText)
            prevScreenText = screenText
            screenText = opValue
            displayLabel.text = screenText
        }
    }
    
    func performOperation(_ prevScreenText: String, _ operation: String, _ screenText: String) -> String {
        let num1: Int = Int(prevScreenText) ?? 0
        let op = operation
        let num2: Int = Int(screenText) ?? 0
        
        switch op {
        case "+":
            return String(num1 + num2)
        case "-":
            return String(num1 - num2)
        case "*":
            return String(num1 * num2)
        case "/":
            if (num2 == 0) {
                return "Zero division"
            } else {
                return String(num1 / num2)
            }
        default:
            return "Cannot parse input"
        }
    }
}

