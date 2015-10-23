//
//  ViewController.swift
//  iOS-SimpleCalc
//
//  Created by iGuest on 10/22/15.
//  Copyright © 2015 Morgan Evans. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var output: UILabel!
    
    var firstNumString : String = ""
    var secondNumString : String = ""
    var operation : String = ""
    var firstNum : Int = 0
    var secondNum : Int = 0
    var typingFirstNum : Bool = true
    var typingSecondNum : Bool = false
    var typingMultiOp : Bool = false
    var input : [Int] = [Int]()

    @IBAction func numberPressed(sender: UIButton) {
        if typingFirstNum {
            firstNumString += sender.currentTitle!
            output.text = firstNumString
        }
        if typingSecondNum {
            secondNumString += sender.currentTitle!
            output.text = secondNumString
        }
    }

    @IBAction func operand(sender: UIButton) {
        if typingFirstNum {
            typingFirstNum = false
            typingSecondNum = true
        }
        operation = sender.currentTitle!
        output.text = operation
    }
    
    @IBAction func multiOp(sender: UIButton) {
        typingMultiOp = true
        operation = sender.currentTitle!
        
        switch operation {
        case "count":
            firstNum = Int(firstNumString)!
            input.append(firstNum)
            firstNumString = ""
            output.text = "count"
        case "avg":
            firstNum = Int(firstNumString)!
            input.append(firstNum)
            firstNumString = ""
            output.text = "avg"
        case "fact":
            output.text = "fact"
            firstNum = Int(firstNumString)!
            firstNumString = ""
            calculate()
            firstNum = 0
            operation = ""
        default:
            break
        }
    }
    
    @IBAction func equalsPressed(sender: UIButton) {
        typingFirstNum = true
        typingSecondNum = false
        firstNum = Int(firstNumString)!
        if secondNumString != "" {
            secondNum = Int(secondNumString)!
        }
        if typingMultiOp {
            input.append(firstNum)
        }
        calculate()
        firstNum = 0
        secondNum = 0
        firstNumString = ""
        secondNumString = ""
        operation = ""
        input.removeAll()
        typingMultiOp = false
    }

func calculate() -> Void {
    switch operation {
    case "+":
        output.text = "\(firstNum + secondNum)"
    case "-":
        output.text = "\(firstNum - secondNum)"
    case "*":
        output.text = "\(firstNum * secondNum)"
    case "/":
        output.text = "\(firstNum / secondNum)"
    case "%":
        output.text = "\(firstNum % secondNum)"
    case "count":
        output.text = "\(input.count)"
    case "avg":
        var sum = 0
        for var i = 0; i < input.count; i++ {
            sum += input[i]
        }
        let avg = Float(sum) / Float(input.count)
        output.text = "\(avg)"
    case "fact":
        var factorial = 1
        for var i = 1; i < firstNum; i++ {
            factorial *= i
        }
        output.text = "\(factorial)"
    default:
        "Please enter an appropriate expression to calculate."
    }
}

}