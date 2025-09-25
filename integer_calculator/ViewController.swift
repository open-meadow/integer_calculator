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
                // If user presses 'C', empty all display
                prevScreenText = ""
                screenText = ""
                displayLabel.text = "0"
            } else if (buttonContent == "+" || buttonContent == "-" || buttonContent == "/" || buttonContent == "*") {
                // If the user presses either of the operations, save last number on the screen
                operation = buttonContent
                prevScreenText = screenText
                displayLabel.text = buttonContent
                screenText = ""
            } else {
                // If the user presses a number, show the number on the screen
                if screenText == "Zero Division" || screenText == "Cannot parse input" || screenText == "0" {
                    screenText = ""
                }
                screenText += buttonContent
                displayLabel.text = screenText
            }
        } else {
            // If user presses '=', previous number, operation, and current number
            let opValue = performOperation(prevScreenText, operation, screenText)
            prevScreenText = screenText
            screenText = opValue
            displayLabel.text = screenText
        }
    }
    
    func performOperation(_ prevScreenText: String, _ operation: String, _ screenText: String) -> String {
        // If any number is not provided, select '0'
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
                return "Zero Division"
            } else {
                return String(num1 / num2)
            }
        default:
            return "Cannot parse input"
        }
    }
}

