//
//  CalculatorViewController.swift
//  Calculator
//
//  Created by Rani Singh on 08/02/19.
//  Copyright © 2019 InnoCric. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    //MARK: Outlets
    @IBOutlet weak var inputLabel: UILabel!
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMaths = false
    var operation = 0
    var isSelect = false
    var isDouble = false
    @IBOutlet weak var selectNumber: UIButton!
    
    //MARK: View LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        // inputLabel.inset = UIEdgeInsetsMake(top: 0, left: 16, bottom: 0, right: 0)
    }
    
    //MARK: Actions
    @IBAction func numbers(_ sender: UIButton) {
       
        if performingMaths == true {
            inputLabel.text = String(sender.tag-1)
            numberOnScreen = Double(inputLabel.text!)!
            performingMaths = false
        }
        else {
            if isSelect == false {
            inputLabel.text = ""
            }
            isSelect = true
            inputLabel.text = inputLabel.text! + String(sender.tag-1)
            numberOnScreen = Double(inputLabel.text!)!
        }
    }
    
    @IBAction func performCalculation(_ sender: UIButton) {
        if inputLabel.text != "" && sender.tag != 11 && sender.tag != 16 {
    
            previousNumber = Double(inputLabel.text!) ?? 0
            if sender.tag == 12 { //Divide
                inputLabel.text = "/"
            }
            if sender.tag == 13 { //Multiply
                inputLabel.text = "x"
            }
            if sender.tag == 14 { //Subtract
                inputLabel.text = "-"
            }
            if sender.tag == 15 { //Add
                inputLabel.text = "+"
            }
            if sender.tag == 17 { //Modulus
                inputLabel.text = String(previousNumber / 100)
            }
            operation = sender.tag
            performingMaths = true;
        }
        else if sender.tag == 16 {
            if operation == 12{ //Divide
                var result = previousNumber / numberOnScreen
                if numberOnScreen == 0 {
                    result = 0
                }
                if result.isInt {
                    inputLabel.text = "\(Int(result))"
                } else {
                    let value = String(format: "%.2f", result)
                    inputLabel.text = value
                }
            }
            else if operation == 13{ //Multiply
                let result = previousNumber * numberOnScreen
                if result.isInt {
                    inputLabel.text = "\(Int(result))"
                } else {
                    let value = String(format: "%.2f", result)
                    inputLabel.text = value//"\(result)"
                }
            }
            else if operation == 14{ //Subtract
                let result = previousNumber - numberOnScreen
                if result.isInt {
                    inputLabel.text = "\(Int(result))"
                } else {
                    let value = String(format: "%.2f", result)
                    inputLabel.text = value//"\(result)"
                }
            }
            else if operation == 15{ //Add
                let result = previousNumber + numberOnScreen
                if result.isInt {
                    inputLabel.text = "\(Int(result))"
                } else {
                    let value = String(format: "%.2f", result)
                    inputLabel.text = value//"\(result)"
                }
            }
        }
        else if sender.tag == 11{
            inputLabel.text = String(0)
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            isSelect = false
        }
    }
    
    @IBAction func decimalBtnAxn(_ sender: UIButton) {
        if performingMaths == true {
            inputLabel.text = "."
            numberOnScreen = Double(inputLabel.text!)!
            performingMaths = false
        }
        else {
            if isSelect == false {
                inputLabel.text = ""
            }
            isSelect = true
            inputLabel.text = inputLabel.text! + "."
            numberOnScreen = Double(inputLabel.text!)!
        }
        
    }
}

//MARK: Method to check double
//extension Double {
//
//    func isInteger() -> Bool {
//        if Int(self) != nil {
//            return true
//        }
//        return false
//    }
//}

//MARK: Method to check Float
extension FloatingPoint {
    var isInt: Bool {
        return floor(self) == self
    }
}

