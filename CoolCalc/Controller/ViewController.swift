//
//  ViewController.swift
//  CoolCalc
//
//  Created by Jay Phillips on 5/29/20.
//  Copyright © 2020 devNasium. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Variables
    
    var isTyping: Bool = false
    var firstNumber: Double?
    var secondNumber: Double?
    var operation = ""
    var result: Double = 0.0
    
    // IBOutlets
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = "0"
    }
    
    
    // Functions
    
    func clearResults() {
        if resultLabel.text != "0" {
            firstNumber = 0
            resultLabel.text = "0"
        } else {
            isTyping = false
            firstNumber = 0
            secondNumber = 0
            resultLabel.text = "0"
        }
    }
    
    func calculate(operation: Operation) -> Double {
        guard let firstNumber = firstNumber, let secondNumber = secondNumber else { return 0 }
        switch operation {
        case .add:
            result = firstNumber + secondNumber
        case .subract:
            result = firstNumber - secondNumber
        case .multiply:
            result = firstNumber * secondNumber
        case .divide:
            result =  firstNumber / secondNumber
        case .remainder:
            result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
        }
        return result
    }
    
    
    // IBActions
    @IBAction func plusMinusPressed(_ sender: Any) {
        var number = resultLabel.text!
        
        if number != "0" {
            if number.prefix(1) != "-" {
                number = "-" + number
            } else {
                number.remove(at: number.startIndex)
            }
            resultLabel.text = number
        }
    }
    
    @IBAction func equalsButtonPressed(_ sender: Any) {
        isTyping = false
        
        let resultNumber = resultLabel.text!
        secondNumber = Double(resultNumber)
        
        if let firstNumber = firstNumber {
            if let secondNumber = secondNumber {
                switch operation {
                case "+":
                    result = firstNumber + secondNumber
                case "-":
                    result = firstNumber - secondNumber
                case "*":
                    result = firstNumber * secondNumber
                case "/":
                    result = firstNumber / secondNumber
                case "%":
                    result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
                default:
                    result = 0
                }
            }
        }
        let formatter = NumberFormatter()
        formatter.minimum = 0
        formatter.maximum = 2
        formatter.numberStyle = .decimal
        resultLabel.text = formatter.string(from: NSNumber(value: result as Double)) ?? nil
        
    }
    
    @IBAction func clearButtonPressed(_ sender: Any) {
        clearResults()
    }
    
    @IBAction func operatorButtonPressed(_ sender: AnyObject) {
        isTyping = false
        let number = resultLabel.text!
        firstNumber = Double(number)
        operation = sender.currentTitle!
        resultLabel.text = operation
        result = calculate(operation: Operation(rawValue: operation)!)
    }
    
    
    @IBAction func numberButtonPressed(_ sender: AnyObject) {
        let number = sender.currentTitle
        
        if isTyping {
            if let number = number {
                resultLabel.text = resultLabel.text! + number!
            }
        } else {
            resultLabel.text = number!!
            isTyping = true
        }
    }
    
    
}

