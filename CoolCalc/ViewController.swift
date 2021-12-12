//
//  ViewController.swift
//  CoolCalc
//
//  Created by ioannis giannakidis on 30/7/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var actionsLbl: UILabel!
    
    @IBOutlet weak var resultsLbl: UILabel!
    
    @IBOutlet weak var divideBtn: UIButton!
    
    @IBOutlet weak var multiplyBtn: UIButton!
    
    @IBOutlet weak var subtractBtn: UIButton!
    
    @IBOutlet weak var addBtn: UIButton!
    
    @IBOutlet weak var equalBtn: UIButton!
    
    @IBOutlet weak var decimalBtn: UIButton!
    
    var isDecimal = false
    
    var firstNumber = ""
    
    var secondNumber = ""
    
    var numbers:[String] = []
    
    var operations = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        clearAll()
    }
    
    
    
    @IBAction func buttonPressed(_ sender: Any) {
        
        guard let button = (sender as? UIButton)?.titleLabel?.text else {
            
            return
        }
        
        switch button {
        case "1","2","3","4","5","6","7","8","9","0",".":
            
            if button == "." {
                
                decimalBtn.isEnabled = false
                
                isDecimal = true
            }
            resultsLbl.text! += button
            
            actionsLbl.text! += button
            
            enableButtons()
            
        case "X","÷","-","+":
            
            firstNumber = resultsLbl.text!
            
            resultsLbl.text = ""
            
            decimalBtn.isEnabled = true
            
            actionsLbl.text! += button
            
            operations = button
            
            disableButtons()
            
        case "=":
            if firstNumber == "" {
                
                firstNumber = resultsLbl.text!
                
                
            }else {
                
                secondNumber = resultsLbl.text!
            }
            calculations(num1: firstNumber, num2: secondNumber, calc: operations)
            
        case "AC":
            
            clearAll()
            
        default:
            
            break
            
        }
        
    }
    
    func clearAll() {
        
        resultsLbl.text = ""
        
        actionsLbl.text = ""
        
        operations = ""
        
        disableButtons()
    }
    
    func enableButtons() {
        
        addBtn.isEnabled = true
        
        subtractBtn.isEnabled = true
        
        divideBtn.isEnabled = true
        
        multiplyBtn.isEnabled = true
        
        equalBtn.isEnabled = true
        
    }
    
    func disableButtons(){
        
        addBtn.isEnabled = false
        
        subtractBtn.isEnabled = false
        
        divideBtn.isEnabled = false
        
        multiplyBtn.isEnabled = false
        
        equalBtn.isEnabled = false
        
    }
    func calculations(num1:String,num2:String,calc:String) {
        
        
        let number1 = Double(num1)!
        
        let number2 = Double(num2)!
        var result = 0.0
        
       switch calc {
           
        case "+":
           
            result = number1 + number2
           
        case "-":
           
            result = number1 - number2
           
        case "X":
           
            result = number1 * number2
           
        case "÷":
           
            result = number1 / number2
           
        default:
           
            break
        }
        
        //actionsLbl.text = ""
        resultsLbl.text = isDecimal ?  String(result) : String(Int(result))
        
    }
    
}


