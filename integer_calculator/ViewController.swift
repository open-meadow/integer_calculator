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
    
    var operations: [String] = []
    
    @IBAction func calculate(_ sender: UIButton) {
        let buttonContent: String = (sender.titleLabel?.text)!
        
        if buttonContent != "=" {
            if(buttonContent == "C") {
                operations = []
                displayLabel.text = "0"
            } else {
                operations.append(buttonContent)
                displayLabel.text = operations.joined(separator: " ")
            }
        } else {
            let opValue = performOperation(operations)
            operations = []
            displayLabel.text = opValue
        }
    }
    
    func performOperation(_ operations: [String]) -> String {
        let num1: Int = Int(operations[0]) ?? 0
        let op = operations[1]
        let num2: Int = Int(operations[2]) ?? 0
        
        switch op {
        case "+":
            return String(num1 + num2)
        case "-":
            return String(num1 + num2)
        case "*":
            return String(num1 * num2)
        case "/":
            return String(num1 / num2)
        default:
            return "Too complex"
        }
    }
}

