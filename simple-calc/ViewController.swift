//
//  ViewController.swift
//  simple-calc
//
//  Created by Morgan Evans on 10/22/15.
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
        case "C":
            firstNum = Int(firstNumString)!
            input.append(firstNum)
            firstNumString = ""
            output.text = "C"
        case "A":
            firstNum = Int(firstNumString)!
            input.append(firstNum)
            firstNumString = ""
            output.text = "A"
        case "F":
            output.text = "F"
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
        case "C":
            output.text = "\(input.count)"
        case "A":
            var sum = 0
            for var i = 0; i < input.count; i++ {
                sum += input[i]
            }
            let avg = Float(sum) / Float(input.count)
            output.text = "\(avg)"
        case "F":
            var factorial = 1
            for var i = 0; i < firstNum; i++ {
                factorial *= i
            }
            output.text = "\(factorial)"
        default:
            "Please enter an appropriate expression to calculate."
        }
        
    }
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }*/

}

