//
//  ViewController.swift
//  EggTimer
//
//  Created by Chinmay Ghotkar on 1/1/19.
//  Copyright © 2019 Chinmay Ghotkar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timerTextField: UITextField!
    var timer = Timer()
    var currentTimer : Int = 0
    var userSelectedTimer : Int = 0
    
    func stopTimer() -> Bool {
        if currentTimer <= 0 {
            timer.invalidate()
            print("Finished Timer!")
            return true
        }
        
        return false
    }
    
    @objc func processTimer() {
        if !stopTimer() {
            currentTimer -= 1
            timerTextField.text = String(currentTimer)
        }
    }
    
    @IBAction func pauseButtonPressed(_ sender: Any) {
        print("Pause Button Pressed!")
        timer.invalidate()
    }
   
    @IBAction func playButtonPressed(_ sender: Any) {
        print("Play Button Pressed!")
        if let userTimer = timerTextField.text {
            userSelectedTimer = Int(userTimer)!
            currentTimer = userSelectedTimer
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        } else {
            print("Text Field is Empty!")
        }

    }
    
    @IBAction func minusTenButtonPressed(_ sender: Any) {
        print("-10 Button Pressed!")
        currentTimer -= 10
        if currentTimer < 0 {
            currentTimer = 0
        }
        timerTextField.text = String(currentTimer)
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        print("Reset Button Pressed!")
        timer.invalidate()
        currentTimer = userSelectedTimer
        timerTextField.text = String(userSelectedTimer)
    }
    
    @IBAction func plusTenButtonPressed(_ sender: Any) {
        print("+10 Button Pressed!")
        currentTimer += 10
        timerTextField.text = String(currentTimer)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }


}

