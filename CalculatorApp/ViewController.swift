//
//  ViewController.swift
//  CalculatorApp
//
//  Created by Nikolai Maksimov on 25.06.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel: UILabel!
    
    var numberForScreen: Double = 0
    var firstNumber: Double = 0
    var operation = 0
    var mathSign = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func digitsButtonPressed(_ sender: UIButton) {
        if mathSign == true {
            resultLabel.text = String(sender.tag)
            mathSign = false
        } else {
            resultLabel.text = resultLabel.text! + String(sender.tag)
        }
        
        numberForScreen = Double(resultLabel.text!)!
    }
    
    @IBAction func arithmeticOperationButtonPressed(_ sender: UIButton) {
        if resultLabel.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNumber = Double(resultLabel.text!)!
            
            if sender.tag == 11 { // деление
                resultLabel.text = "/"
                
            } else if sender.tag == 12 { // умножение
                resultLabel.text = "*"
                
            } else if sender.tag == 13 { // вычитание
                resultLabel.text = "-"
                
            } else if sender.tag == 14 { // сложение
                resultLabel.text = "+"
            }
            
            operation = sender.tag
            mathSign = true
            
        } else if sender.tag == 15 {
            if operation == 11 {
                resultLabel.text = String(firstNumber / numberForScreen)
            } else if operation == 12 {
                resultLabel.text = String(firstNumber * numberForScreen)
            } else if operation == 13 {
                resultLabel.text = String(firstNumber - numberForScreen)
            } else if operation == 14 {
                resultLabel.text = String(firstNumber + numberForScreen)
            }
        } else if sender.tag == 10 {
            resultLabel.text = ""
            firstNumber = 0
            numberForScreen = 0
            operation = 0
        }
    }
}

