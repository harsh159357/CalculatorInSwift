//
//  ViewController.swift
//  CalculatorInSwift
//
//  Created by LinuxPlus on 31/07/17.
//  Copyright © 2017 Harsh Sharma. All rights reserved.
//

import UIKit

// Functions that can be performed on Calculator
enum CalculatorFunctions {
    case multiply
    case addition
    case substraction
    case clear
    case equals
}


class ViewController: UIViewController {
    
    // Label for showing results of calculations
    @IBOutlet weak var result: UILabel!;
    
    var currentResult:Int = 0;
    
    // Constants
    let zero = "0",one = "1",two="2",three = "3",four="4",five="5",six="6",seven="7",eight="8",nine="9";
    
    let clearScreen = "C",multiply="X",add="+",substract="-",equals = "=";
    
    // Will Track Current Function Being Executed
    var currentFunction:CalculatorFunctions = CalculatorFunctions.equals;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // This function will handle all the button presses
    @IBAction func didPressAnyNumberOnCalculator(_ buttonPressed: UIButton) {
        let pressedButtonTitle  = buttonPressed.currentTitle!
        
        switch (pressedButtonTitle) {
            
        //When any button with no 0 - 9 is pressed this case will occur
        case zero,one,two,three,four,five,six,seven,eight,nine:
            zeroToNineClickHandling(whatsPressed: pressedButtonTitle)
            
        // When C (Clear) Button Was Pressed
        case clearScreen:
            clearResults()
            
        // When + (Addition) Button Was Pressed
        case add:
            addNumbers()
            
        // When - (Substraction) Button Was Pressed
        case substract:
            subtractNumbers()
            
        // When X (Multiplication) Button Was Pressed
        case multiply:
            multiplyNumbers()
            
        // When = (Equality) Button Was Pressed
        case equals:
            giveMeFinalResult()
            
        // Default Case
        default:
            print(pressedButtonTitle)
        }
    }
    
    // Handle 0 - 9 Button Click
    func zeroToNineClickHandling(whatsPressed :String){
        if(result.text! == zero && whatsPressed == zero) {
            // do nothing here
            return
        } else if(result.text! == zero && whatsPressed != zero){
            // Just replace 0 with whatsPressed
            result.text = whatsPressed
        } else {
            // Just append whatsPressed with result
            var currentResultString = result.text;
            currentResultString = currentResultString!+whatsPressed
            result.text = currentResultString
        }
    }
    
    // Handle Add Button Click
    func addNumbers() {
        currentFunction = .addition
        currentResult = Int(result.text!)!
        result.text = zero
    }
    
    // Handle Substract Button Click
    func subtractNumbers() {
        currentFunction = .substraction
        currentResult = Int(result.text!)!
        result.text = zero
    }
    
    // Handle Multiply Button Click
    func multiplyNumbers() {
        currentFunction = .multiply
        currentResult = Int(result.text!)!
        result.text = zero
    }
    
    // Handle Equal Button Click
    func giveMeFinalResult() {
        if(currentFunction == .addition) {
            currentResult = currentResult + Int(result.text!)!
        } else if (currentFunction == .substraction) {
            currentResult = currentResult - Int(result.text!)!
        } else if (currentFunction == .multiply) {
            currentResult = currentResult * Int(result.text!)!
        } else if (currentFunction == .clear) {
            clearResults()
        } else {
            currentResult = Int(result.text!)!
            // Do Nothing
        }
        result.text = "\(currentResult)"
        currentFunction = .equals
    }
    
    // Handle Clear Button Press
    func clearResults(){
        currentFunction = .clear
        currentResult = 0
        result.text = zero;
    }
    
}

