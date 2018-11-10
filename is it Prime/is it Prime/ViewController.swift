//
//  ViewController.swift
//  is it Prime
//
//  Created by Chinmay Ghotkar on 11/9/18.
//  Copyright © 2018 Chinmay Ghotkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInputTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func checkIfPrime(numberInput : Int) -> Bool {
        
        if numberInput == 1 {
            return false
        }
        
        for possibleDivider in 2...numberInput-1 {
            if numberInput % possibleDivider == 0 {
                return false
            }
        }
        
        return true
        
    }
    
    @IBAction func checkButton(_ sender: Any) {
        
        if let numberString = userInputTextField.text {
            if let number = Int(numberString) {
                if number > 0 {
                    if(checkIfPrime(numberInput: number)){
                        resultLabel.text = "Number \(number) is a prime number."
                    } else {
                        resultLabel.text = "Number \(number) is not prime number."
                    }
                } else {
                    resultLabel.text = "Please enter a positive whole number."
                }
            }
        } else {
            resultLabel.text = "Please enter a positive whole number."
        }
        
    }
    
}

